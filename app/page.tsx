"use client";

import { useState, useMemo } from "react";
import { mockVendors, isVendorOpen, calculateDistance, getProductCategories } from "@/lib/data";
import { Vendor, FilterOptions } from "@/lib/types";
import Link from "next/link";

export default function Home() {
  const [userLocation] = useState({ lat: 45.815, lng: 15.9819 }); // Default: Zagreb center
  const [filters, setFilters] = useState<FilterOptions>({
    category: undefined,
    isOpen: undefined,
    maxDistance: 10,
    searchQuery: "",
  });
  const [viewMode, setViewMode] = useState<"list" | "radar">("list");

  const categories = getProductCategories();

  // Filter vendors based on user criteria
  const filteredVendors = useMemo(() => {
    return mockVendors.filter((vendor) => {
      // Distance filter
      const distance = calculateDistance(userLocation, vendor.location);
      if (filters.maxDistance && distance > filters.maxDistance) {
        return false;
      }

      // Open/closed filter
      if (filters.isOpen !== undefined) {
        const isOpen = isVendorOpen(vendor.workingHours);
        if (filters.isOpen && !isOpen) return false;
      }

      // Category filter
      if (filters.category) {
        const hasCategory = vendor.products.some(
          (p) => p.category === filters.category
        );
        if (!hasCategory) return false;
      }

      // Search query filter
      if (filters.searchQuery) {
        const query = filters.searchQuery.toLowerCase();
        const matchesName = vendor.name.toLowerCase().includes(query);
        const matchesProduct = vendor.products.some((p) =>
          p.name.toLowerCase().includes(query)
        );
        if (!matchesName && !matchesProduct) return false;
      }

      return true;
    });
  }, [filters, userLocation]);

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-green-600 text-white shadow-lg">
        <div className="container mx-auto px-4 py-6">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold">🌱 OPG Direkt</h1>
              <p className="text-green-100 mt-1">
                Svježi proizvodi s lokalnih OPG-ova
              </p>
            </div>
            <Link
              href="/vendor"
              className="bg-white text-green-600 px-6 py-2 rounded-lg font-semibold hover:bg-green-50 transition"
            >
              Vendor Portal
            </Link>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        {/* Filters Section */}
        <div className="bg-white rounded-lg shadow-md p-6 mb-8">
          <h2 className="text-xl font-semibold mb-4">Filtriraj štandove</h2>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            {/* Search */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Pretraživanje
              </label>
              <input
                type="text"
                placeholder="Pretraži proizvode ili štandove..."
                className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent"
                value={filters.searchQuery}
                onChange={(e) =>
                  setFilters({ ...filters, searchQuery: e.target.value })
                }
              />
            </div>

            {/* Category Filter */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Kategorija proizvoda
              </label>
              <select
                className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent"
                value={filters.category || ""}
                onChange={(e) =>
                  setFilters({
                    ...filters,
                    category: e.target.value || undefined,
                  })
                }
              >
                <option value="">Sve kategorije</option>
                {categories.map((cat) => (
                  <option key={cat} value={cat}>
                    {cat}
                  </option>
                ))}
              </select>
            </div>

            {/* Working Hours Filter */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Radno vrijeme
              </label>
              <select
                className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent"
                value={
                  filters.isOpen === undefined
                    ? ""
                    : filters.isOpen
                    ? "open"
                    : "closed"
                }
                onChange={(e) =>
                  setFilters({
                    ...filters,
                    isOpen:
                      e.target.value === ""
                        ? undefined
                        : e.target.value === "open",
                  })
                }
              >
                <option value="">Svi štandovi</option>
                <option value="open">Samo otvoreni</option>
                <option value="closed">Samo zatvoreni</option>
              </select>
            </div>

            {/* Distance Filter */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Radijus: {filters.maxDistance} km
              </label>
              <input
                type="range"
                min="1"
                max="20"
                value={filters.maxDistance}
                onChange={(e) =>
                  setFilters({
                    ...filters,
                    maxDistance: parseInt(e.target.value),
                  })
                }
                className="w-full"
              />
            </div>
          </div>

          {/* View Mode Toggle */}
          <div className="mt-6 flex gap-2">
            <button
              onClick={() => setViewMode("list")}
              className={`px-6 py-2 rounded-lg font-semibold transition ${
                viewMode === "list"
                  ? "bg-green-600 text-white"
                  : "bg-gray-200 text-gray-700 hover:bg-gray-300"
              }`}
            >
              📋 Lista
            </button>
            <button
              onClick={() => setViewMode("radar")}
              className={`px-6 py-2 rounded-lg font-semibold transition ${
                viewMode === "radar"
                  ? "bg-green-600 text-white"
                  : "bg-gray-200 text-gray-700 hover:bg-gray-300"
              }`}
            >
              🗺️ Radar
            </button>
          </div>
        </div>

        {/* Results */}
        <div className="mb-4">
          <p className="text-gray-600">
            Pronađeno <strong>{filteredVendors.length}</strong> štandova
          </p>
        </div>

        {/* List View */}
        {viewMode === "list" && (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {filteredVendors.map((vendor) => (
              <VendorCard
                key={vendor.id}
                vendor={vendor}
                userLocation={userLocation}
              />
            ))}
          </div>
        )}

        {/* Radar View */}
        {viewMode === "radar" && (
          <div className="bg-white rounded-lg shadow-md p-8">
            <div className="relative" style={{ height: "600px" }}>
              <RadarView vendors={filteredVendors} userLocation={userLocation} />
            </div>
          </div>
        )}

        {filteredVendors.length === 0 && (
          <div className="text-center py-12">
            <p className="text-xl text-gray-500">
              Nema pronađenih štandova s odabranim filterima.
            </p>
            <button
              onClick={() =>
                setFilters({
                  category: undefined,
                  isOpen: undefined,
                  maxDistance: 10,
                  searchQuery: "",
                })
              }
              className="mt-4 px-6 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition"
            >
              Resetiraj filtere
            </button>
          </div>
        )}
      </div>
    </div>
  );
}

function VendorCard({
  vendor,
  userLocation,
}: {
  vendor: Vendor;
  userLocation: { lat: number; lng: number };
}) {
  const distance = calculateDistance(userLocation, vendor.location);
  const isOpen = isVendorOpen(vendor.workingHours);

  return (
    <Link href={`/stands/${vendor.id}`}>
      <div className="bg-white rounded-lg shadow-md hover:shadow-xl transition cursor-pointer h-full">
        <div className="p-6">
          {/* Header */}
          <div className="flex justify-between items-start mb-4">
            <h3 className="text-xl font-bold text-gray-800">{vendor.name}</h3>
            <span
              className={`px-3 py-1 rounded-full text-sm font-semibold ${
                isOpen
                  ? "bg-green-100 text-green-800"
                  : "bg-red-100 text-red-800"
              }`}
            >
              {isOpen ? "Otvoreno" : "Zatvoreno"}
            </span>
          </div>

          {/* Description */}
          <p className="text-gray-600 text-sm mb-4 line-clamp-2">
            {vendor.description}
          </p>

          {/* Info */}
          <div className="space-y-2 text-sm text-gray-700 mb-4">
            <div className="flex items-center gap-2">
              <span>📍</span>
              <span>{distance.toFixed(1)} km od vas</span>
            </div>
            <div className="flex items-center gap-2">
              <span>⭐</span>
              <span>{vendor.rating} / 5.0</span>
            </div>
            <div className="flex items-center gap-2">
              <span>🚚</span>
              <span>Dostava do {vendor.deliveryRadius} km</span>
            </div>
          </div>

          {/* Products */}
          <div className="border-t pt-4">
            <p className="text-sm font-semibold text-gray-700 mb-2">
              Proizvodi:
            </p>
            <div className="flex flex-wrap gap-2">
              {vendor.products.slice(0, 3).map((product) => (
                <span
                  key={product.id}
                  className="px-2 py-1 bg-gray-100 text-gray-700 rounded text-xs"
                >
                  {product.name}
                </span>
              ))}
              {vendor.products.length > 3 && (
                <span className="px-2 py-1 bg-gray-100 text-gray-700 rounded text-xs">
                  +{vendor.products.length - 3} više
                </span>
              )}
            </div>
          </div>

          {/* Payment Methods */}
          <div className="border-t pt-4 mt-4">
            <div className="flex gap-2">
              {vendor.acceptsOnlinePayment && (
                <span className="px-2 py-1 bg-blue-100 text-blue-800 rounded text-xs font-semibold">
                  💳 Online
                </span>
              )}
              {vendor.acceptsCOD && (
                <span className="px-2 py-1 bg-yellow-100 text-yellow-800 rounded text-xs font-semibold">
                  💵 Pouzećem
                </span>
              )}
            </div>
          </div>
        </div>
      </div>
    </Link>
  );
}

function RadarView({
  vendors,
  userLocation,
}: {
  vendors: Vendor[];
  userLocation: { lat: number; lng: number };
}) {
  // Simple radar visualization
  const maxDistance = 10; // km

  return (
    <div className="relative w-full h-full bg-gradient-to-br from-green-50 to-blue-50 rounded-lg flex items-center justify-center">
      {/* Radar circles */}
      <div className="absolute inset-0 flex items-center justify-center">
        <div className="absolute w-1/4 h-1/4 border-2 border-green-200 rounded-full"></div>
        <div className="absolute w-1/2 h-1/2 border-2 border-green-300 rounded-full"></div>
        <div className="absolute w-3/4 h-3/4 border-2 border-green-400 rounded-full"></div>
        <div className="absolute w-full h-full border-2 border-green-500 rounded-full"></div>
      </div>

      {/* User location */}
      <div className="absolute text-4xl">📍</div>

      {/* Vendor markers */}
      {vendors.map((vendor) => {
        const distance = calculateDistance(userLocation, vendor.location);
        const angle = Math.random() * 2 * Math.PI; // Random angle for demo
        const radius = (distance / maxDistance) * 45; // Percentage of radar
        const x = Math.cos(angle) * radius;
        const y = Math.sin(angle) * radius;
        const isOpen = isVendorOpen(vendor.workingHours);

        return (
          <div
            key={vendor.id}
            className="absolute group"
            style={{
              left: `calc(50% + ${x}%)`,
              top: `calc(50% + ${y}%)`,
              transform: "translate(-50%, -50%)",
            }}
          >
            <div
              className={`w-4 h-4 rounded-full cursor-pointer transition-transform hover:scale-150 ${
                isOpen ? "bg-green-500" : "bg-red-500"
              }`}
              title={vendor.name}
            ></div>
            <div className="absolute hidden group-hover:block bg-white shadow-lg rounded-lg p-3 z-10 whitespace-nowrap -translate-x-1/2 left-1/2 top-6">
              <p className="font-bold text-sm">{vendor.name}</p>
              <p className="text-xs text-gray-600">
                {distance.toFixed(1)} km
              </p>
            </div>
          </div>
        );
      })}

      {/* Legend */}
      <div className="absolute bottom-4 left-4 bg-white rounded-lg shadow-md p-4">
        <p className="text-sm font-bold mb-2">Legenda:</p>
        <div className="flex items-center gap-2 text-sm">
          <div className="w-3 h-3 bg-green-500 rounded-full"></div>
          <span>Otvoreno</span>
        </div>
        <div className="flex items-center gap-2 text-sm mt-1">
          <div className="w-3 h-3 bg-red-500 rounded-full"></div>
          <span>Zatvoreno</span>
        </div>
      </div>
    </div>
  );
}
