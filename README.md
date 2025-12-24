# 🌱 OPG Direkt

Naruči svježe proizvode s lokalnih OPG‑ova — pickup ili dostava u kvartu.

## O Projektu

OPG Direkt povezuje te s lokalnim proizvođačima i mobilnim štandovima u tvojoj blizini. Platforma omogućuje:

### Za kupce:
- 🗺️ **Radar i lista štandova** - Pregledaj sve lokalne proizvođače u blizini
- 🔍 **Napredno filtriranje** - Filtriraj po proizvodima, kategorijama i radnom vremenu
- 📍 **Pickup ili dostava** - Odaberi preuzimanje ili dostavu unutar radijusa
- 💳 **Fleksibilno plaćanje** - Plati online ili pouzećem
- ⭐ **Ocjene i recenzije** - Provjeri kvalitetu proizvođača

### Za vendore (proizvođače):
- 📦 **Upravljanje proizvodima** - Jednostavno dodavanje i uređivanje ponude
- 🕒 **Radno vrijeme** - Upravljanje rasporedom rada
- 📋 **Narudžbe** - Pregled i upravljanje dolazećim narudžbama
- 💰 **Način naplate** - Postavi željene načine plaćanja
- 🚚 **Radijus dostave** - Definiraj područje dostave

## Tehnologije

- **Frontend & Backend**: Next.js 16 (React 19)
- **Styling**: Tailwind CSS
- **Jezik**: TypeScript
- **Deployment**: Vercel ready

## Instalacija i pokretanje

### Preduvjeti
- Node.js 18 ili noviji
- npm ili yarn

### Lokalno pokretanje

1. **Kloniraj repozitorij**
```bash
git clone https://github.com/imdavor/OPGDirekt.git
cd OPGDirekt
```

2. **Instaliraj dependencies**
```bash
npm install
```

3. **Pokreni development server**
```bash
npm run dev
```

4. **Otvori u browseru**
```
http://localhost:3000
```

## Dostupne skripte

- `npm run dev` - Pokreće development server
- `npm run build` - Kreira production build
- `npm start` - Pokreće production server
- `npm run lint` - Pokreće linter

## Struktura projekta

```
OPGDirekt/
├── app/                    # Next.js App Router
│   ├── page.tsx           # Glavna stranica (lista i radar štandova)
│   ├── stands/[id]/       # Detalji pojedinačnog štanda
│   ├── vendor/            # Vendor portal
│   └── layout.tsx         # Root layout
├── components/            # React komponente
├── lib/                   # Utility funkcije i typovi
│   ├── types.ts          # TypeScript interfejsi
│   └── data.ts           # Mock podaci i helper funkcije
└── public/               # Statički assets

```

## Značajke

### 1. Pregledavanje štandova
- Lista view s karticama proizvođača
- Radar view za vizualni prikaz udaljenosti
- Filtriranje po kategorijama proizvoda
- Filtriranje po radnom vremenu (otvoreno/zatvoreno)
- Regulacija radijusa pretrage
- Pretraživanje po nazivu štanda ili proizvoda

### 2. Detalji štanda
- Prikaz svih informacija o proizvođaču
- Lista dostupnih proizvoda s cijenama
- Košarica za narudžbu
- Odabir načina preuzimanja (pickup/dostava)
- Odabir načina plaćanja
- Potvrda narudžbe

### 3. Vendor Portal
- Upravljanje proizvodima (dodavanje, uređivanje, brisanje)
- Postavljanje radnog vremena
- Pregled i upravljanje narudžbama
- Postavke štanda (kontakt, dostava, plaćanje)

## Roadmap

- [ ] Integracija Google Maps API za stvarne lokacije
- [ ] Autentifikacija korisnika i vendora
- [ ] Integracija platnog gateway-a
- [ ] Push notifikacije za narudžbe
- [ ] Mobilna aplikacija (React Native)
- [ ] Sistem ocjenjivanja i recenzija
- [ ] Povijest narudžbi
- [ ] Analytics dashboard za vendore

## Podrška lokalnim proizvođačima

OPG Direkt je osmišljen da omogući malim lokalnim proizvođačima lakši pristup tržištu i kupcima, dok istovremeno omogućuje potrošačima jednostavan pristup svježim, lokalnim namirnicama. 

**Podrži lokalno, uštedi vrijeme i uživaj u svježim namirnicama!** 🌿

## Licenca

ISC

## Kontakt

Za pitanja i sugestije, slobodno otvorite issue na GitHub repozitoriju.
