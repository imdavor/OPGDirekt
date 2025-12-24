# OPGDirekt
Mobilna aplikacija za lokalne OPG-ove i kupce: pregled štandova na karti, narudžbe za pickup ili dostavu unutar postavljenog radiusa i online plaćanje.

## Ideja u jednoj rečenici
Prodavači postavljaju proizvode, cijene, lokaciju mobilnog štanda, radno vrijeme i radius dostave; kupci naručuju i biraju pickup ili dostavu (npr. na posao) bez potrebe dolaska autom.

## Trenutni status
- Inicijalni Flutter projekt s rutama za: splash, auth, vendor dashboard, consumer home, checkout. Pogledaj [lib/main.dart](lib/main.dart).
- Dodani osnovni paketi: Riverpod, go_router, Dio, Freezed/JSON codegen, Google Maps, geolokacija, Stripe, Hive, shared_preferences, intl, logger.

## Zahtjevi i alati
- Flutter 3.35 (Dart 3.9)
- Android Studio / Xcode / VS Code s Flutter/Dart pluginovima
- (Opcionalno) iOS/Android emulatore ili fizički uređaj

## Pokretanje
1) Instaliraj ovisnosti:
	- `flutter pub get`
	- `flutter pub run build_runner build --delete-conflicting-outputs`
2) Pokreni aplikaciju: `flutter run`

## MVP fokus
- Prodavači: profil OPG-a, proizvodi i cijene, lokacija štanda, radno vrijeme, radius dostave, online naplata.
- Kupci: karta i lista najbližih štandova s filtrima, narudžba unaprijed, izbor pickup/dostava.
- Plaćanje: Stripe stub prisutan, potrebno dodati ključeve i integraciju.

## Sljedeći koraci (predlog)
- Dodati domain modele i DTO-e (Freezed + JSON) za proizvode, narudžbe i korisnike.
- Implementirati servisni sloj (Dio) i mock API za razvoj bez backenda.
- Uvesti state management (Riverpod) po feature modulima, te zaštitu ruta po rolama.
- Integrirati Google Maps (prikaz štandova) i geolocator (radius dostave) uz permisije.
