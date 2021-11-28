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
Különböző, specifikáltabb hívásokhoz készítettem endpointokat (pl.: névrészlet alapján keresés, egy heti activiyk listázása). Kijavítottam az új adatok felvételének működését, mivel nem működtek jól, nem lehetett a megfelelő attribútumokat megadni.  Hostolási lehetőségekről olvastam, de még nem jutottunk előbbre e kapcsán a többiekkel. Még az id-k automatikus számozására keresek megoldást.

#### Zakariás Anna
A felhasználói felületet írtam át, az eddigi Activity-k nagyrészét átírtam Fragment-re, hogy lehessen az egyes nézetek között NavigationBar-ral váltani. Létrehoztam egy Retrofit api-t, de még nem tudtam kiprobálni, hogy tényleges működik-e a backend szerverrel.

## 10.hét
#### Sipos Noémi
Sikerült összekötni az alkalmazást a backenddel. Megírtam az osztályokhoz a JSON konverziókhoz tartozó függvényeket. Megírtam az osztályok adapterosztályait, ahol a GET és a POST kéréseket feldolgozom. A login képernyő müködik már, csak az adatbázisban lévő felhasználók tudnak belépni, megfelelő jelszó név-párossal.

#### Orova Dorina
A backendet és a hozzá tartozó mongodb adatbázist is feltettem azure-ba, így már a töbiekkel alkalmazásával együtt működik. Nagyrészt Noémi kérései szerint írtam lekérdezéseket, ami pl userId alapján adják vissza a goalokat és activityket. A programot átraktam egy másik publikus repoba, amit a README-ben linkeltem.

#### Valaska Nóra
Sikerült megoldani azt a problémát, hogy az app.component.html-ben nem érzékelte a többi létrehozott komponenst. Először módosítva se működött, aztán a hibaüzenetet a cmd-ből ki akartam másolni és hirtelen megjavult.
Létrehoztam a backendnek megfelelően különböző service-eket a usernek, sportnak, activitynek és goalnak. A userhez megírtam typescriptben a függvényeket a backendhez igazodva. Egy sima felhasználónevek kilistázásával próbálkoztam először, hogy teszteljem, jól működik a backend és frontend kapcsolata, de egyenlőre hibaüzenetet dob. (Access to XMLHttpRequest at 'https://getfit-application.azurewebsites.net/UserController' from origin 'http://localhost:4200' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource.)

#### Zakariás Anna
Összekapcsoltam a projektemet az adatbázissal. Megírtam az Api osztály GET és POST kéréseihez tartozó függvényeket az egyes adatosztályokhoz. Elkészítettem a bejelentkezéshez, illetve a regisztráláshoz tartozó oldalakat, valamint a ranglistához tartozó oldalt.

## 11.hét

#### Sipos Noémi
Összehangoltam az alkalmazást az új backend függvényekkel. Létrehoztam az update függvényeket, az usernél már meg lehet változtatni a súlyt és a magasságot. Létrehoztam legördülő listákat, amik alapján listázni lehet különböző dolgokat. Ami nem sikerült egyenlőre az, az hogy rögtön frissüljenek widgetek a szűréseknél. A goalok és a dátumok kezelése még nincs meg. Megcsináltam az admin felületet, hogy új sportokat lehessen felvinni. SizedBoxokkal igazitottam péicit a kinézeten.

#### Zakariás Anna
Elkészítettem az admin felhasználóhoz tartozó Activity-t, így már ha valaki admin felhasználóként lép be, akkor létre tud hozni új sportot. Elkészítettem a History és Goals képernyőket. Viszont a Home képernyőnél a súly és magasság beállításánál egy DialogFragment kéne felugorjon, de ez egyelőre nem működik. Emiatt a Goals képernyőnél se működik a Change Goal gomb.

#### Orova Dorina
Már működik az id-k automatikus adása (volt vele több probléma is, de megoldódott). ehhez létrehoztam egy counter gyűjteményt az adatbázisban ami számolja az egyes gyűjteméynekben lévő elemeket, ez alapján ad id-t. Több kisebb függvényt is írtam: pl goal kiválasztása dátum alapján (tehát pl adott heti goal lekérdezése), CurrentAmount növelése activity felvételekor... stb. Ezen felül az updateket módosítottam: nem lehet felülírni az id-kat.

#### Valaska Nóra
Megpróbáltam többféle módszerrel is azure-ra feltölteni az angularos projektet, de valamiért nem működött egyikkel se. A localhost:4200-on a leaderboardnál van egy sima felhasználó kilistázás, aminél valami miatt csak "[object Object]"-eket listáz ki. Ezt próbáltam megoldani, de egyenlőre nem sikerült és csak sejtem mi lehet a probléma. A böngészőben a státusznál 200-OK van, tehát elvileg eléri az adatokat.
Közben a backend függvények irogatásával haladtam.

## 12. hét

#### Valaska Nóra
Sikerült az Angular applikáció feltöltése Azure-ra, a https://getfitweb.azurewebsites.net/ linken elérhető.

#### Sipos Noémi
Az applikáció designjét kicsit megváltoztattam,adtam hozzá képeket és hátteret.
Most már működnek a szűrések, a provider osztályaim segítségével, mindig frissülnek az adatok. Lehet a nevek között keresni, és lehet sportágak alapján keresni. A dátumok az activityknél megjelennek már, és az activity létrehozáskor is már jó dátumot lehet megadni. A születési időt is jól lehet már megadni.
