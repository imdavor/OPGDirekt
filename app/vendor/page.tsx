"use client";

import { useState } from "react";
import { mockVendors } from "@/lib/data";
import { Vendor, Product, WorkingHours } from "@/lib/types";
import Link from "next/link";

export default function VendorPortal() {
  const [selectedVendor, setSelectedVendor] = useState<Vendor>(mockVendors[0]);
  const [activeTab, setActiveTab] = useState<
    "products" | "hours" | "orders" | "settings"
  >("products");

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-blue-600 text-white shadow-lg">
        <div className="container mx-auto px-4 py-6">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold">Vendor Portal</h1>
              <p className="text-blue-100 mt-1">
                Upravljanje štandom i narudžbama
              </p>
            </div>
            <Link
              href="/"
              className="bg-white text-blue-600 px-6 py-2 rounded-lg font-semibold hover:bg-blue-50 transition"
            >
              Povratak na trgovinu
            </Link>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="grid grid-cols-1 lg:grid-cols-4 gap-8">
          {/* Sidebar */}
          <div className="lg:col-span-1">
            <div className="bg-white rounded-lg shadow-md p-6">
              <h2 className="text-lg font-bold text-gray-800 mb-4">
                Moj štand
              </h2>
              <div className="space-y-2">
                <div className="border-b pb-2">
                  <p className="font-semibold text-gray-700">
                    {selectedVendor.name}
                  </p>
                  <p className="text-sm text-gray-500">
                    {selectedVendor.address}
                  </p>
                </div>
                <div className="pt-2">
                  <button
                    onClick={() => setActiveTab("products")}
                    className={`w-full text-left px-4 py-2 rounded-lg mb-2 transition ${
                      activeTab === "products"
                        ? "bg-blue-100 text-blue-700 font-semibold"
                        : "text-gray-700 hover:bg-gray-100"
                    }`}
                  >
                    📦 Proizvodi
                  </button>
                  <button
                    onClick={() => setActiveTab("hours")}
                    className={`w-full text-left px-4 py-2 rounded-lg mb-2 transition ${
                      activeTab === "hours"
                        ? "bg-blue-100 text-blue-700 font-semibold"
                        : "text-gray-700 hover:bg-gray-100"
                    }`}
                  >
                    🕒 Radno vrijeme
                  </button>
                  <button
                    onClick={() => setActiveTab("orders")}
                    className={`w-full text-left px-4 py-2 rounded-lg mb-2 transition ${
                      activeTab === "orders"
                        ? "bg-blue-100 text-blue-700 font-semibold"
                        : "text-gray-700 hover:bg-gray-100"
                    }`}
                  >
                    📋 Narudžbe
                  </button>
                  <button
                    onClick={() => setActiveTab("settings")}
                    className={`w-full text-left px-4 py-2 rounded-lg transition ${
                      activeTab === "settings"
                        ? "bg-blue-100 text-blue-700 font-semibold"
                        : "text-gray-700 hover:bg-gray-100"
                    }`}
                  >
                    ⚙️ Postavke
                  </button>
                </div>
              </div>
            </div>
          </div>

          {/* Main Content */}
          <div className="lg:col-span-3">
            {activeTab === "products" && (
              <ProductsManagement vendor={selectedVendor} />
            )}
            {activeTab === "hours" && (
              <WorkingHoursManagement vendor={selectedVendor} />
            )}
            {activeTab === "orders" && <OrdersManagement vendor={selectedVendor} />}
            {activeTab === "settings" && (
              <SettingsManagement vendor={selectedVendor} />
            )}
          </div>
        </div>
      </div>
    </div>
  );
}

function ProductsManagement({ vendor }: { vendor: Vendor }) {
  const [products, setProducts] = useState<Product[]>(vendor.products);
  const [showAddForm, setShowAddForm] = useState(false);

  return (
    <div className="bg-white rounded-lg shadow-md p-6">
      <div className="flex justify-between items-center mb-6">
        <h2 className="text-2xl font-bold text-gray-800">Upravljanje proizvodima</h2>
        <button
          onClick={() => setShowAddForm(true)}
          className="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition font-semibold"
        >
          + Dodaj proizvod
        </button>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {products.map((product) => (
          <div
            key={product.id}
            className="border border-gray-200 rounded-lg p-4"
          >
            <div className="flex justify-between items-start mb-2">
              <div className="flex-1">
                <h3 className="font-bold text-lg text-gray-800">
                  {product.name}
                </h3>
                <p className="text-sm text-gray-500">{product.category}</p>
                <p className="text-sm text-gray-600 mt-1">
                  {product.description}
                </p>
              </div>
              <div className="text-right ml-4">
                <p className="font-bold text-blue-600 text-lg">
                  {product.price.toFixed(2)} €
                </p>
                <p className="text-xs text-gray-500">/ {product.unit}</p>
              </div>
            </div>
            <div className="flex justify-between items-center mt-4 pt-4 border-t">
              <span
                className={`px-3 py-1 rounded text-sm font-semibold ${
                  product.inStock
                    ? "bg-green-100 text-green-800"
                    : "bg-red-100 text-red-800"
                }`}
              >
                {product.inStock ? "Na stanju" : "Nije dostupno"}
              </span>
              <div className="flex gap-2">
                <button className="text-blue-600 hover:text-blue-700 text-sm font-semibold">
                  Uredi
                </button>
                <button className="text-red-600 hover:text-red-700 text-sm font-semibold">
                  Ukloni
                </button>
              </div>
            </div>
          </div>
        ))}
      </div>

      {showAddForm && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-lg shadow-xl max-w-md w-full p-6">
            <h3 className="text-xl font-bold text-gray-800 mb-4">
              Dodaj novi proizvod
            </h3>
            <form className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Naziv proizvoda
                </label>
                <input
                  type="text"
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                  placeholder="npr. Svježe jagode"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Kategorija
                </label>
                <select className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                  <option>Voće</option>
                  <option>Povrće</option>
                  <option>Med</option>
                  <option>Mliječni proizvodi</option>
                  <option>Pekmezi</option>
                </select>
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Cijena
                  </label>
                  <input
                    type="number"
                    step="0.01"
                    className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                    placeholder="0.00"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Jedinica
                  </label>
                  <select className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                    <option>kg</option>
                    <option>l</option>
                    <option>kom</option>
                  </select>
                </div>
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Opis
                </label>
                <textarea
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                  rows={3}
                  placeholder="Kratak opis proizvoda..."
                ></textarea>
              </div>
              <div className="flex gap-3 pt-4">
                <button
                  type="submit"
                  className="flex-1 bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700 transition font-semibold"
                >
                  Spremi
                </button>
                <button
                  type="button"
                  onClick={() => setShowAddForm(false)}
                  className="flex-1 bg-gray-200 text-gray-700 py-2 rounded-lg hover:bg-gray-300 transition font-semibold"
                >
                  Odustani
                </button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}

function WorkingHoursManagement({ vendor }: { vendor: Vendor }) {
  const [workingHours, setWorkingHours] = useState<WorkingHours[]>(
    vendor.workingHours
  );

  return (
    <div className="bg-white rounded-lg shadow-md p-6">
      <h2 className="text-2xl font-bold text-gray-800 mb-6">
        Upravljanje radnim vremenom
      </h2>

      <div className="space-y-4">
        {workingHours.map((wh, index) => (
          <div
            key={index}
            className="border border-gray-200 rounded-lg p-4 flex items-center justify-between"
          >
            <div className="flex items-center gap-4 flex-1">
              <label className="flex items-center gap-2 cursor-pointer">
                <input
                  type="checkbox"
                  checked={wh.isOpen}
                  onChange={() => {
                    const updated = [...workingHours];
                    updated[index].isOpen = !updated[index].isOpen;
                    setWorkingHours(updated);
                  }}
                  className="w-5 h-5"
                />
                <span className="font-semibold text-gray-700 w-28">
                  {wh.day}
                </span>
              </label>
              {wh.isOpen && (
                <div className="flex items-center gap-2">
                  <input
                    type="time"
                    value={wh.open}
                    onChange={(e) => {
                      const updated = [...workingHours];
                      updated[index].open = e.target.value;
                      setWorkingHours(updated);
                    }}
                    className="px-3 py-1 border border-gray-300 rounded-lg"
                  />
                  <span>-</span>
                  <input
                    type="time"
                    value={wh.close}
                    onChange={(e) => {
                      const updated = [...workingHours];
                      updated[index].close = e.target.value;
                      setWorkingHours(updated);
                    }}
                    className="px-3 py-1 border border-gray-300 rounded-lg"
                  />
                </div>
              )}
              {!wh.isOpen && (
                <span className="text-gray-500 italic">Zatvoreno</span>
              )}
            </div>
          </div>
        ))}
      </div>

      <div className="mt-6">
        <button className="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition font-semibold">
          Spremi promjene
        </button>
      </div>
    </div>
  );
}

function OrdersManagement({ vendor }: { vendor: Vendor }) {
  const [orders] = useState([
    {
      id: "ORD-001",
      customerName: "Ivan Horvat",
      items: 3,
      total: 45.5,
      method: "pickup",
      payment: "cod",
      status: "pending",
      time: "10:30",
    },
    {
      id: "ORD-002",
      customerName: "Ana Kovač",
      items: 5,
      total: 67.0,
      method: "delivery",
      payment: "online",
      status: "confirmed",
      time: "11:15",
    },
    {
      id: "ORD-003",
      customerName: "Marko Novak",
      items: 2,
      total: 28.0,
      method: "pickup",
      payment: "cod",
      status: "ready",
      time: "12:00",
    },
  ]);

  const getStatusColor = (status: string) => {
    switch (status) {
      case "pending":
        return "bg-yellow-100 text-yellow-800";
      case "confirmed":
        return "bg-blue-100 text-blue-800";
      case "ready":
        return "bg-green-100 text-green-800";
      case "completed":
        return "bg-gray-100 text-gray-800";
      default:
        return "bg-gray-100 text-gray-800";
    }
  };

  const getStatusText = (status: string) => {
    switch (status) {
      case "pending":
        return "Na čekanju";
      case "confirmed":
        return "Potvrđeno";
      case "ready":
        return "Spremno";
      case "completed":
        return "Završeno";
      default:
        return status;
    }
  };

  return (
    <div className="bg-white rounded-lg shadow-md p-6">
      <h2 className="text-2xl font-bold text-gray-800 mb-6">
        Upravljanje narudžbama
      </h2>

      <div className="space-y-4">
        {orders.map((order) => (
          <div key={order.id} className="border border-gray-200 rounded-lg p-4">
            <div className="flex justify-between items-start mb-4">
              <div>
                <h3 className="font-bold text-lg text-gray-800">
                  {order.id}
                </h3>
                <p className="text-sm text-gray-600">
                  Kupac: {order.customerName}
                </p>
                <p className="text-sm text-gray-600">Vrijeme: {order.time}</p>
              </div>
              <span
                className={`px-3 py-1 rounded-full text-sm font-semibold ${getStatusColor(
                  order.status
                )}`}
              >
                {getStatusText(order.status)}
              </span>
            </div>

            <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-4">
              <div>
                <p className="text-xs text-gray-500">Broj artikala</p>
                <p className="font-semibold">{order.items}</p>
              </div>
              <div>
                <p className="text-xs text-gray-500">Ukupno</p>
                <p className="font-semibold text-blue-600">
                  {order.total.toFixed(2)} €
                </p>
              </div>
              <div>
                <p className="text-xs text-gray-500">Način preuzimanja</p>
                <p className="font-semibold">
                  {order.method === "pickup" ? "Pickup" : "Dostava"}
                </p>
              </div>
              <div>
                <p className="text-xs text-gray-500">Plaćanje</p>
                <p className="font-semibold">
                  {order.payment === "online" ? "Online" : "Pouzećem"}
                </p>
              </div>
            </div>

            <div className="flex gap-2 pt-4 border-t">
              {order.status === "pending" && (
                <>
                  <button className="flex-1 bg-green-600 text-white py-2 rounded-lg hover:bg-green-700 transition font-semibold">
                    Potvrdi
                  </button>
                  <button className="flex-1 bg-red-600 text-white py-2 rounded-lg hover:bg-red-700 transition font-semibold">
                    Odbij
                  </button>
                </>
              )}
              {order.status === "confirmed" && (
                <button className="flex-1 bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700 transition font-semibold">
                  Označi kao spremno
                </button>
              )}
              {order.status === "ready" && (
                <button className="flex-1 bg-gray-600 text-white py-2 rounded-lg hover:bg-gray-700 transition font-semibold">
                  Završi narudžbu
                </button>
              )}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

function SettingsManagement({ vendor }: { vendor: Vendor }) {
  return (
    <div className="bg-white rounded-lg shadow-md p-6">
      <h2 className="text-2xl font-bold text-gray-800 mb-6">Postavke štanda</h2>

      <div className="space-y-6">
        {/* Basic Info */}
        <div>
          <h3 className="text-lg font-semibold text-gray-700 mb-4">
            Osnovni podaci
          </h3>
          <div className="space-y-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Naziv štanda
              </label>
              <input
                type="text"
                defaultValue={vendor.name}
                className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Opis
              </label>
              <textarea
                defaultValue={vendor.description}
                className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                rows={3}
              />
            </div>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Telefon
                </label>
                <input
                  type="tel"
                  defaultValue={vendor.phone}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Email
                </label>
                <input
                  type="email"
                  defaultValue={vendor.email}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                />
              </div>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Adresa
              </label>
              <input
                type="text"
                defaultValue={vendor.address}
                className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
              />
            </div>
          </div>
        </div>

        {/* Delivery Settings */}
        <div className="pt-6 border-t">
          <h3 className="text-lg font-semibold text-gray-700 mb-4">
            Postavke dostave
          </h3>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Radijus dostave (km)
            </label>
            <input
              type="number"
              defaultValue={vendor.deliveryRadius}
              min="1"
              max="50"
              className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
            />
          </div>
        </div>

        {/* Payment Settings */}
        <div className="pt-6 border-t">
          <h3 className="text-lg font-semibold text-gray-700 mb-4">
            Načini plaćanja
          </h3>
          <div className="space-y-2">
            <label className="flex items-center gap-2 cursor-pointer">
              <input
                type="checkbox"
                defaultChecked={vendor.acceptsOnlinePayment}
                className="w-5 h-5"
              />
              <span>Prihvaćam online plaćanje</span>
            </label>
            <label className="flex items-center gap-2 cursor-pointer">
              <input
                type="checkbox"
                defaultChecked={vendor.acceptsCOD}
                className="w-5 h-5"
              />
              <span>Prihvaćam plaćanje pouzećem</span>
            </label>
          </div>
        </div>

        <div className="pt-6">
          <button className="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition font-semibold">
            Spremi sve promjene
          </button>
        </div>
      </div>
    </div>
  );
}
