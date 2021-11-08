## 5.Hét
#### Orova Dorina
Közösen megírtuk a specifikációt a többiekkel, egyeztettük pontosan milyen funkciók is lesznek a programban.

Emellett főként az adatbázissal foglalkoztam, elkészítettem az adatok tárolásának, táblákba rendezésének tervét, valamint magát az adatbázist is létrehoztam. Ezután a projekt és az adatbázis összekapcsolásával próbálkoztam. Ez a tűzfal miatt nem sikerült. Ezután a kódból próbálkoztam egy adatbázist létrehozni, ekkor a driverekkel volt ptoblémája és nem emiatt nem tudott kapcsolatot létrehozni.

Az adatbázis tábláit reprezentáló osztályokat létrehoztam.

#### Sipos Noémi

Az előző héten megírt appomat hozzácsatoltam egy Firebase adatbázishoz. Az IOS-es rész működik, viszont, ha Androidon futtatom a programot akkor valamiért nem tud csatlakozni az adatbázishoz. A hibaüzeneteket tanulmányoztam, de nem jutottam végső megoldásra. 
A hibaüzenet, amit mindig kaptam az alábbi volt:
Firebase Database connection was forcefully killed by the server. Will not attempt reconnect. Reason: Database lives in a different region.
Próbálkoztam a régió átállításán, az emulátron a nem működő internethozzáférés javításával is, de egyik sem oldotta meg a hibát.
IOSen viszont szépen fut a program és a megadott first name,last name és email cím kombináció megjelenik a hozzákapcsolt adatbázisban.

Amit eddig nem sikerült megcsinálnom, hogy ne külön repoban legyen a projektem, hanem a közös repo mappájába rakjam fel direktbe, így egy fájlba írt link vezet a repohoz.

#### Valaska Nóra

A megbeszéltek szerint a HTML5 megismerésével, tanulásával foglalkoztam részletesebben. Tanulás közben folyamatosan ki is próbáltam az új dolgokat.

#### Zakariás Anna

Én is az előző héten elkészített MyForm alkalmazásomat fejeztem be, kijavítottam a hibákat, így mostmár ha adatokat írunk be, azok megjelennek a valósidejű alkalmazásban.

## 6.Hét
#### Orova Dorina
Sikerült az adatbázist IntelliJ-ben hozzákapcsolnom a projekthez, viszont a kódból még mindig nem tudok connectiont létrehozni, a következő hibát kapom: java.sql.SQLException: No suitable driver found for jdbc:sqlserver://localhost:1433;databasename=GetFitDB;.

Az adatokat reprezentáló osztáylok függvényeit írtam (pl.: getterek, setterek, új adat felvétele...stb), valamint a controlelr osztáylok vázát.

#### Sipos Noémi

Annával megírtuk a mobilos alkalmazás specifikációt, valamint megterveztük az alkalmazás kinézetét.

#### Zakariás Anna
Noémivel együtt megterveztük az alkalmazás egyes képernyőit a Justinmind segítségével.
Én ezek alapján elkészítettem a bejelentkező illetve a regisztraciós képernyőket, amik egyelőre még nem vesznek be adatokat, csak a Sign up gomb működik, azzal lehet a Login képernyőről a Sign up képérnyőre váltani.
Ezen kívűl elolvastam a Swagger specifikációját, az egyes parancsokat értelmeztem, viszont ki még nem probáltam, hogy élesben hogyan is működik.

Valamint most én is belefutottam abba a problémába, amibe a mólt héten Noémi, hogy a Github nem engedett feltölteni egy második projektet a mappába, ezért az új projektet becsomagolva töltöttem fel ide.

#### Valaska Nóra
Megterveztem a webes felület kinézetét a Justinmind programmal.

## 7.Hét

#### Sipos Noémi

Létrehoztam az alkalmazásunk Flutter projektjét. Elkészítettem a főbb oldalakat, melyekre szükség lesz az alkalmazásban. A projekt úgy néz ki, hogy a main pageről lehet navigálni a különböző nézetekre. Néhány dolgot változtattunk a specifikáción és a kinézeten, hogy az alkalmazás logikusabb legyen. Például, hogy célnak csak az aktív napok számát lehet csak beállítani, viszont a lefutott kilóméterek és az edzéssel töltött idő is meg fog jelenni a képernyőn.( Ez mind hetekre bontva.)

#### Orova Dorina

Hosszas próbálkozás után sem sikerült összekapcsolnom a projektet SQL serverrel (ha külön felhasználót hoztam létre, és azzal próbálkoztam kapcsolódni nem ismerte fel, és Windows autentikációval sem tudtam csatlakozni). Ezért végül az adatbázist lecseréltem MongoDB-re, amivel már futott, illetve kódból is sikerült felöltenem teszt adatokkal. Elkészítettem a repositorykat minden adat osztályhoz, valamit az ezekhez tartozó controllek függvényeit (alapvető lekérdezések) írtam. Valamiért viszont innen már nem jól kerülnek ki az adatok, lekérdezésnél semmit sem kapok vissza, csak azt, hogy pl az adott táblában hány darab felhasznló adata van.
Swaggerel is sikerült összekapcsolnia projektet, ami szintén sok órányi debugolást igényelt, mert a UI-t nem akarta feliserni (500-as hibát dobott, internetes keresések alapján gyanítom, hogy a verziókkal lehett valami baj), így végül kódból konfiguráltam, így működik.

#### Zakariás Anna

Elkészítettem az Android-os képernyőket, ami hasonlóan működik, mint a Flutter-es, csak nekem a bejelentkező oldal a kezdőképernyő, ami egyelőre még nem vár adatokat, és a login gombbal simán be lehet lépni, ekkor nekem is a Home képernyő jelenik meg, innen lehet a képernyő alján található négy gombbal elnavigálni a különböző menüopciókhoz.

#### Valaska Nóra
Elkezdtem a webes képernyők elkészítését, ehhez különböző hiányzó komponenseket installáltam. Angular és Typescript használatával haladtam eddig.

## 8.hét

#### Orova Dorina
A controllereket javítottam, mivel üres json-ket adatk vissza, mivel nem volt az osztályokban minden attribútumhoz publikus getter. Mostmár működik (: 
Egyenlőre viszont az osztályok adatai nincsenek összekötve, az activityknál pl csak az userId-t adja vissza, nem a usert.

## 9.hét
#### Sipos Noémi
A felhasználói felületet szépítgettem, a navigációkat létrehoztam a képernyők között. Beleírtam a kódba, hogy hol milyen adatot kell majd a backendről lekérni. Egyenlőre tesztadatokat használok a megjelenítésekhez.
Néhány helyen elkezdtem írni a validációkat. Létrehoztam az osztályokat, melyekben az adatok lesznek. Ezenkívül létrehoztam a datepicker widgetet.

#### Valaska Nóra
A különböző screenek html részét csináltam meg, CSS-el elkezdtem foglalkozni, hogy a weboldal majd a korábban elkészített tervekhez hasonlítson. A szűrők és filterek még nem működnek, illetve a "leaderboard" és "recent activities" táblázatoknál csak mintaadatok vannak.

#### Orova Dorina
Különböző, specifikáltabb hívásokhoz készítettem endpointokat (pl.: névrészlet alapján keresés, egy heti activiyk listázása). Kijavítottam az új adatok felvételének működését, mivel nem működtek jól, nem lehetett a megfelelő attribútumokat megadni.  Hostolási lehetőségekről oovastam, de még nem jutottunk előbbre e kapcsán a többiekkel. Még az id-k automatikus számozására keresek megoldást.
