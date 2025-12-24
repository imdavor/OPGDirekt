import { Vendor, WorkingHours } from "./types";

// Mock vendors data for demonstration
export const mockVendors: Vendor[] = [
  {
    id: "1",
    name: "OPG Horvat",
    description: "Svježe voće i povrće iz vlastitog uzgoja. Ekološki uzgoj bez pesticida.",
    location: { lat: 45.815, lng: 15.9819 },
    address: "Trg bana Josipa Jelačića 5, Zagreb",
    phone: "+385 91 234 5678",
    email: "horvat@opg.hr",
    workingHours: [
      { day: "Ponedjeljak", open: "08:00", close: "16:00", isOpen: true },
      { day: "Utorak", open: "08:00", close: "16:00", isOpen: true },
      { day: "Srijeda", open: "08:00", close: "16:00", isOpen: true },
      { day: "Četvrtak", open: "08:00", close: "16:00", isOpen: true },
      { day: "Petak", open: "08:00", close: "16:00", isOpen: true },
      { day: "Subota", open: "08:00", close: "13:00", isOpen: true },
      { day: "Nedjelja", open: "00:00", close: "00:00", isOpen: false },
    ],
    products: [
      {
        id: "p1",
        name: "Rajčica",
        category: "Povrće",
        price: 3.5,
        unit: "kg",
        description: "Domaća rajčica iz ekološkog uzgoja",
        inStock: true,
      },
      {
        id: "p2",
        name: "Krastavac",
        category: "Povrće",
        price: 2.5,
        unit: "kg",
        description: "Svježi krastavci",
        inStock: true,
      },
      {
        id: "p3",
        name: "Jabuke",
        category: "Voće",
        price: 4.0,
        unit: "kg",
        description: "Domaće jabuke, sorta Idared",
        inStock: true,
      },
    ],
    rating: 4.8,
    deliveryRadius: 5,
    acceptsOnlinePayment: true,
    acceptsCOD: true,
  },
  {
    id: "2",
    name: "OPG Kovač",
    description: "Domaći med, mliječni proizvodi i sir. Tradicijska proizvodnja.",
    location: { lat: 45.8131, lng: 15.9772 },
    address: "Ilica 242, Zagreb",
    phone: "+385 91 345 6789",
    email: "kovac@opg.hr",
    workingHours: [
      { day: "Ponedjeljak", open: "07:00", close: "15:00", isOpen: true },
      { day: "Utorak", open: "07:00", close: "15:00", isOpen: true },
      { day: "Srijeda", open: "07:00", close: "15:00", isOpen: true },
      { day: "Četvrtak", open: "07:00", close: "15:00", isOpen: true },
      { day: "Petak", open: "07:00", close: "15:00", isOpen: true },
      { day: "Subota", open: "07:00", close: "14:00", isOpen: true },
      { day: "Nedjelja", open: "00:00", close: "00:00", isOpen: false },
    ],
    products: [
      {
        id: "p4",
        name: "Med livadski",
        category: "Med",
        price: 40,
        unit: "kg",
        description: "Prirodni livadski med",
        inStock: true,
      },
      {
        id: "p5",
        name: "Svježi sir",
        category: "Mliječni proizvodi",
        price: 25,
        unit: "kg",
        description: "Domaći svježi sir od kravljeg mlijeka",
        inStock: true,
      },
      {
        id: "p6",
        name: "Vrhnje",
        category: "Mliječni proizvodi",
        price: 15,
        unit: "l",
        description: "Svježe vrhnje",
        inStock: true,
      },
    ],
    rating: 4.9,
    deliveryRadius: 3,
    acceptsOnlinePayment: false,
    acceptsCOD: true,
  },
  {
    id: "3",
    name: "OPG Novak",
    description: "Sezonsko povrće i domaće pekmeze. Obiteljska proizvodnja.",
    location: { lat: 45.8088, lng: 15.9747 },
    address: "Savska cesta 41, Zagreb",
    phone: "+385 91 456 7890",
    email: "novak@opg.hr",
    workingHours: [
      { day: "Ponedjeljak", open: "09:00", close: "17:00", isOpen: true },
      { day: "Utorak", open: "09:00", close: "17:00", isOpen: true },
      { day: "Srijeda", open: "09:00", close: "17:00", isOpen: true },
      { day: "Četvrtak", open: "09:00", close: "17:00", isOpen: true },
      { day: "Petak", open: "09:00", close: "17:00", isOpen: true },
      { day: "Subota", open: "00:00", close: "00:00", isOpen: false },
      { day: "Nedjelja", open: "00:00", close: "00:00", isOpen: false },
    ],
    products: [
      {
        id: "p7",
        name: "Paprika",
        category: "Povrće",
        price: 3.0,
        unit: "kg",
        description: "Domaća paprika",
        inStock: true,
      },
      {
        id: "p8",
        name: "Pekmez od šljiva",
        category: "Pekmezi",
        price: 20,
        unit: "kom",
        description: "Domaći pekmez od šljiva, 500g",
        inStock: true,
      },
      {
        id: "p9",
        name: "Luk",
        category: "Povrće",
        price: 2.0,
        unit: "kg",
        description: "Domaći crveni luk",
        inStock: true,
      },
    ],
    rating: 4.6,
    deliveryRadius: 4,
    acceptsOnlinePayment: true,
    acceptsCOD: true,
  },
];

// Utility function to check if vendor is currently open
export function isVendorOpen(workingHours: WorkingHours[]): boolean {
  const now = new Date();
  const currentDay = now.toLocaleDateString("hr-HR", { weekday: "long" });
  const currentTime = now.toTimeString().slice(0, 5);

  const todayHours = workingHours.find(
    (wh) => wh.day.toLowerCase() === currentDay.toLowerCase()
  );

  if (!todayHours || !todayHours.isOpen) {
    return false;
  }

  return currentTime >= todayHours.open && currentTime <= todayHours.close;
}

// Calculate distance between two locations (Haversine formula)
export function calculateDistance(
  loc1: { lat: number; lng: number },
  loc2: { lat: number; lng: number }
): number {
  const R = 6371; // Earth's radius in km
  const dLat = ((loc2.lat - loc1.lat) * Math.PI) / 180;
  const dLng = ((loc2.lng - loc1.lng) * Math.PI) / 180;
  const a =
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos((loc1.lat * Math.PI) / 180) *
      Math.cos((loc2.lat * Math.PI) / 180) *
      Math.sin(dLng / 2) *
      Math.sin(dLng / 2);
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  return R * c;
}

// Get all unique categories
export function getProductCategories(): string[] {
  const categories = new Set<string>();
  mockVendors.forEach((vendor) => {
    vendor.products.forEach((product) => {
      categories.add(product.category);
    });
  });
  return Array.from(categories).sort();
}
