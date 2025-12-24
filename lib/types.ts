// Data models for OPG Direkt

export interface Location {
  lat: number;
  lng: number;
}

export interface WorkingHours {
  day: string;
  open: string;
  close: string;
  isOpen: boolean;
}

export interface Product {
  id: string;
  name: string;
  category: string;
  price: number;
  unit: string;
  description: string;
  image?: string;
  inStock: boolean;
}

export interface Vendor {
  id: string;
  name: string;
  description: string;
  location: Location;
  address: string;
  phone: string;
  email: string;
  workingHours: WorkingHours[];
  products: Product[];
  rating: number;
  image?: string;
  deliveryRadius: number; // in kilometers
  acceptsOnlinePayment: boolean;
  acceptsCOD: boolean;
}

export type DeliveryMethod = "pickup" | "delivery";
export type PaymentMethod = "online" | "cod";

export interface CartItem {
  product: Product;
  quantity: number;
  vendorId: string;
}

export interface Order {
  id: string;
  userId: string;
  vendorId: string;
  items: CartItem[];
  deliveryMethod: DeliveryMethod;
  deliveryAddress?: string;
  deliveryLocation?: Location;
  paymentMethod: PaymentMethod;
  totalAmount: number;
  status: "pending" | "confirmed" | "preparing" | "ready" | "completed" | "cancelled";
  createdAt: Date;
  updatedAt: Date;
}

export interface User {
  id: string;
  name: string;
  email: string;
  phone: string;
  location?: Location;
  address?: string;
}

export interface FilterOptions {
  category?: string;
  isOpen?: boolean;
  maxDistance?: number;
  searchQuery?: string;
}
