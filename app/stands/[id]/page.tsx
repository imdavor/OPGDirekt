"use client";

import { useState, useMemo } from "react";
import { mockVendors, isVendorOpen, calculateDistance } from "@/lib/data";
import { Product, DeliveryMethod, PaymentMethod, CartItem } from "@/lib/types";
import Link from "next/link";
import { useParams } from "next/navigation";

export default function StandDetailPage() {
  const params = useParams();
  const vendorId = params.id as string;
  const vendor = mockVendors.find((v) => v.id === vendorId);

  const [userLocation] = useState({ lat: 45.815, lng: 15.9819 });
  const [cart, setCart] = useState<CartItem[]>([]);
  const [deliveryMethod, setDeliveryMethod] = useState<DeliveryMethod>("pickup");
  const [paymentMethod, setPaymentMethod] = useState<PaymentMethod>("cod");
  const [showCheckout, setShowCheckout] = useState(false);

  if (!vendor) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold text-gray-800 mb-4">
            Štand nije pronađen
          </h1>
          <Link
            href="/"
            className="text-green-600 hover:text-green-700 font-semibold"
          >
            ← Povratak na pregled
          </Link>
        </div>
      </div>
    );
  }

  const distance = calculateDistance(userLocation, vendor.location);
  const isOpen = isVendorOpen(vendor.workingHours);
  const canDeliver = distance <= vendor.deliveryRadius;

  const addToCart = (product: Product) => {
    const existingItem = cart.find((item) => item.product.id === product.id);
    if (existingItem) {
      setCart(
        cart.map((item) =>
          item.product.id === product.id
            ? { ...item, quantity: item.quantity + 1 }
            : item
        )
      );
    } else {
      setCart([...cart, { product, quantity: 1, vendorId: vendor.id }]);
    }
  };

  const removeFromCart = (productId: string) => {
    setCart(cart.filter((item) => item.product.id !== productId));
  };

  const updateQuantity = (productId: string, quantity: number) => {
    if (quantity <= 0) {
      removeFromCart(productId);
    } else {
      setCart(
        cart.map((item) =>
          item.product.id === productId ? { ...item, quantity } : item
        )
      );
    }
  };

  const totalAmount = useMemo(() => {
    return cart.reduce(
      (sum, item) => sum + item.product.price * item.quantity,
      0
    );
  }, [cart]);

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-green-600 text-white shadow-lg">
        <div className="container mx-auto px-4 py-4">
          <Link href="/" className="text-green-100 hover:text-white">
            ← Povratak na pregled
          </Link>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Main Content */}
          <div className="lg:col-span-2">
            {/* Vendor Info */}
            <div className="bg-white rounded-lg shadow-md p-6 mb-6">
              <div className="flex justify-between items-start mb-4">
                <div>
                  <h1 className="text-3xl font-bold text-gray-800 mb-2">
                    {vendor.name}
                  </h1>
                  <p className="text-gray-600">{vendor.description}</p>
                </div>
                <span
                  className={`px-4 py-2 rounded-full text-sm font-semibold ${
                    isOpen
                      ? "bg-green-100 text-green-800"
                      : "bg-red-100 text-red-800"
                  }`}
                >
                  {isOpen ? "Otvoreno" : "Zatvoreno"}
                </span>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mt-6">
                <div>
                  <h3 className="font-semibold text-gray-700 mb-2">Kontakt</h3>
                  <p className="text-sm text-gray-600">📍 {vendor.address}</p>
                  <p className="text-sm text-gray-600">📞 {vendor.phone}</p>
                  <p className="text-sm text-gray-600">✉️ {vendor.email}</p>
                  <p className="text-sm text-gray-600 mt-2">
                    🚚 Dostava do {vendor.deliveryRadius} km
                  </p>
                  <p className="text-sm text-gray-600">
                    📍 {distance.toFixed(1)} km od vas
                  </p>
                </div>

                <div>
                  <h3 className="font-semibold text-gray-700 mb-2">
                    Radno vrijeme
                  </h3>
                  <div className="space-y-1">
                    {vendor.workingHours.map((wh, idx) => (
                      <div key={idx} className="text-sm text-gray-600 flex justify-between">
                        <span>{wh.day}:</span>
                        <span>
                          {wh.isOpen
                            ? `${wh.open} - ${wh.close}`
                            : "Zatvoreno"}
                        </span>
                      </div>
                    ))}
                  </div>
                </div>
              </div>

              <div className="mt-6 pt-6 border-t">
                <h3 className="font-semibold text-gray-700 mb-2">
                  Načini plaćanja
                </h3>
                <div className="flex gap-2">
                  {vendor.acceptsOnlinePayment && (
                    <span className="px-3 py-1 bg-blue-100 text-blue-800 rounded text-sm font-semibold">
                      💳 Online plaćanje
                    </span>
                  )}
                  {vendor.acceptsCOD && (
                    <span className="px-3 py-1 bg-yellow-100 text-yellow-800 rounded text-sm font-semibold">
                      💵 Plaćanje pouzećem
                    </span>
                  )}
                </div>
              </div>
            </div>

            {/* Products */}
            <div className="bg-white rounded-lg shadow-md p-6">
              <h2 className="text-2xl font-bold text-gray-800 mb-6">
                Dostupni proizvodi
              </h2>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                {vendor.products.map((product) => (
                  <div
                    key={product.id}
                    className="border border-gray-200 rounded-lg p-4 hover:shadow-md transition"
                  >
                    <div className="flex justify-between items-start mb-2">
                      <div>
                        <h3 className="font-bold text-lg text-gray-800">
                          {product.name}
                        </h3>
                        <p className="text-sm text-gray-500">
                          {product.category}
                        </p>
                      </div>
                      <div className="text-right">
                        <p className="font-bold text-green-600 text-lg">
                          {product.price.toFixed(2)} €
                        </p>
                        <p className="text-xs text-gray-500">/ {product.unit}</p>
                      </div>
                    </div>
                    <p className="text-sm text-gray-600 mb-4">
                      {product.description}
                    </p>
                    {product.inStock ? (
                      <button
                        onClick={() => addToCart(product)}
                        className="w-full bg-green-600 text-white py-2 rounded-lg hover:bg-green-700 transition font-semibold"
                      >
                        Dodaj u košaricu
                      </button>
                    ) : (
                      <button
                        disabled
                        className="w-full bg-gray-300 text-gray-500 py-2 rounded-lg cursor-not-allowed"
                      >
                        Nije dostupno
                      </button>
                    )}
                  </div>
                ))}
              </div>
            </div>
          </div>

          {/* Cart Sidebar */}
          <div className="lg:col-span-1">
            <div className="bg-white rounded-lg shadow-md p-6 sticky top-4">
              <h2 className="text-xl font-bold text-gray-800 mb-4">
                Košarica
              </h2>

              {cart.length === 0 ? (
                <p className="text-gray-500 text-center py-8">
                  Košarica je prazna
                </p>
              ) : (
                <>
                  <div className="space-y-4 mb-6">
                    {cart.map((item) => (
                      <div
                        key={item.product.id}
                        className="border-b border-gray-200 pb-4"
                      >
                        <div className="flex justify-between items-start mb-2">
                          <div className="flex-1">
                            <h4 className="font-semibold text-gray-800">
                              {item.product.name}
                            </h4>
                            <p className="text-sm text-gray-500">
                              {item.product.price.toFixed(2)} € / {item.product.unit}
                            </p>
                          </div>
                          <button
                            onClick={() => removeFromCart(item.product.id)}
                            className="text-red-500 hover:text-red-700 text-sm"
                          >
                            ✕
                          </button>
                        </div>
                        <div className="flex items-center gap-2">
                          <button
                            onClick={() =>
                              updateQuantity(
                                item.product.id,
                                item.quantity - 1
                              )
                            }
                            className="w-8 h-8 bg-gray-200 rounded hover:bg-gray-300"
                          >
                            -
                          </button>
                          <span className="w-12 text-center font-semibold">
                            {item.quantity}
                          </span>
                          <button
                            onClick={() =>
                              updateQuantity(
                                item.product.id,
                                item.quantity + 1
                              )
                            }
                            className="w-8 h-8 bg-gray-200 rounded hover:bg-gray-300"
                          >
                            +
                          </button>
                          <span className="ml-auto font-semibold text-green-600">
                            {(item.product.price * item.quantity).toFixed(2)} €
                          </span>
                        </div>
                      </div>
                    ))}
                  </div>

                  {/* Delivery Options */}
                  <div className="mb-6">
                    <h3 className="font-semibold text-gray-700 mb-2">
                      Način preuzimanja
                    </h3>
                    <div className="space-y-2">
                      <label className="flex items-center gap-2 cursor-pointer">
                        <input
                          type="radio"
                          name="delivery"
                          value="pickup"
                          checked={deliveryMethod === "pickup"}
                          onChange={(e) =>
                            setDeliveryMethod(e.target.value as DeliveryMethod)
                          }
                          className="w-4 h-4"
                        />
                        <span className="text-sm">🏪 Pickup (preuzimanje)</span>
                      </label>
                      <label className="flex items-center gap-2 cursor-pointer">
                        <input
                          type="radio"
                          name="delivery"
                          value="delivery"
                          checked={deliveryMethod === "delivery"}
                          onChange={(e) =>
                            setDeliveryMethod(e.target.value as DeliveryMethod)
                          }
                          disabled={!canDeliver}
                          className="w-4 h-4"
                        />
                        <span className="text-sm">
                          🚚 Dostava
                          {!canDeliver && (
                            <span className="text-red-500 ml-1">
                              (izvan radijusa)
                            </span>
                          )}
                        </span>
                      </label>
                    </div>
                  </div>

                  {/* Payment Options */}
                  <div className="mb-6">
                    <h3 className="font-semibold text-gray-700 mb-2">
                      Način plaćanja
                    </h3>
                    <div className="space-y-2">
                      {vendor.acceptsOnlinePayment && (
                        <label className="flex items-center gap-2 cursor-pointer">
                          <input
                            type="radio"
                            name="payment"
                            value="online"
                            checked={paymentMethod === "online"}
                            onChange={(e) =>
                              setPaymentMethod(e.target.value as PaymentMethod)
                            }
                            className="w-4 h-4"
                          />
                          <span className="text-sm">💳 Online plaćanje</span>
                        </label>
                      )}
                      {vendor.acceptsCOD && (
                        <label className="flex items-center gap-2 cursor-pointer">
                          <input
                            type="radio"
                            name="payment"
                            value="cod"
                            checked={paymentMethod === "cod"}
                            onChange={(e) =>
                              setPaymentMethod(e.target.value as PaymentMethod)
                            }
                            className="w-4 h-4"
                          />
                          <span className="text-sm">💵 Plaćanje pouzećem</span>
                        </label>
                      )}
                    </div>
                  </div>

                  {/* Total */}
                  <div className="border-t pt-4 mb-4">
                    <div className="flex justify-between items-center text-xl font-bold">
                      <span>Ukupno:</span>
                      <span className="text-green-600">
                        {totalAmount.toFixed(2)} €
                      </span>
                    </div>
                  </div>

                  <button
                    onClick={() => setShowCheckout(true)}
                    className="w-full bg-green-600 text-white py-3 rounded-lg hover:bg-green-700 transition font-bold text-lg"
                  >
                    Naruči
                  </button>
                </>
              )}
            </div>
          </div>
        </div>
      </div>

      {/* Checkout Modal */}
      {showCheckout && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-lg shadow-xl max-w-md w-full p-6">
            <h2 className="text-2xl font-bold text-gray-800 mb-4">
              Potvrda narudžbe
            </h2>
            <div className="mb-6">
              <p className="text-gray-600 mb-2">
                <strong>Štand:</strong> {vendor.name}
              </p>
              <p className="text-gray-600 mb-2">
                <strong>Način preuzimanja:</strong>{" "}
                {deliveryMethod === "pickup" ? "Pickup" : "Dostava"}
              </p>
              <p className="text-gray-600 mb-2">
                <strong>Način plaćanja:</strong>{" "}
                {paymentMethod === "online" ? "Online" : "Pouzećem"}
              </p>
              <p className="text-gray-600 mb-4">
                <strong>Ukupno:</strong> {totalAmount.toFixed(2)} €
              </p>
              <div className="bg-green-50 border border-green-200 rounded-lg p-4">
                <p className="text-green-800 text-center font-semibold">
                  ✓ Narudžba je uspješno poslana!
                </p>
                <p className="text-green-700 text-sm text-center mt-2">
                  Vendor će potvrditi narudžbu u najkraćem mogućem roku.
                </p>
              </div>
            </div>
            <div className="flex gap-3">
              <button
                onClick={() => {
                  setShowCheckout(false);
                  setCart([]);
                }}
                className="flex-1 bg-green-600 text-white py-2 rounded-lg hover:bg-green-700 transition font-semibold"
              >
                U redu
              </button>
              <button
                onClick={() => setShowCheckout(false)}
                className="flex-1 bg-gray-200 text-gray-700 py-2 rounded-lg hover:bg-gray-300 transition font-semibold"
              >
                Zatvori
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
