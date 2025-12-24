import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "OPG Direkt - Svježi proizvodi s lokalnih OPG-ova",
  description: "Naruči svježe proizvode s lokalnih OPG‑ova — pickup ili dostava u kvartu. Podrži lokalno, uštedi vrijeme i uživaj u svježim namirnicama.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="hr">
      <body>
        {children}
      </body>
    </html>
  );
}
