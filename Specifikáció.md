# GetFit - Specikifáció
A program egy sportevékenységek és egészséges életmód követésérére ad lehetőséget. Lehetőség van felhasználót létrehozni, ahol követheti, hogy mikor mennyit sportolt, mit evett, valamint személyes adatokat (magasság, súly, életkor, nem...stb) is megadhat. 

## Funkciók
* ### Felhasználói fiók létrehozása:
  A regisztráció során a felhasználó meg kell adnia a nevét, e-mailcímét, egy felhasználónevet és egy jelszót. A későbbiekben e-mailcím és jelszó párossal tud majd belépni az alkalmazásba. 
  
* ### Személyes adatok:
  A felhasználónak lehetősége van személyes adatait eltárolni, így a születési időt, magasságot, súlyt. Ezeket az adatokat később is meg tudja változtatni. Minden felhasználónak van egy szintje, amik között céljai teljesítésével tud átlépni.  Ahányszor a felhasználó eléri a kitűzött célját pontokat kap érte. Egy adott pont összegyüjtése során szintet léphet.\
  A következő célok beállítására van lehetősége:
    * Hány napot szeretne edzeni egy héten
    * Hány km-t szeretne megtenni egy héten  

  
* ### Sporttevékenység követése:
  A felhasználó nyomon tudja követni, hogy mikor, milyen sporttevékenységeket végzett. Az edzéseket egyesével lehet rögzíteni, ahol meg kell adni, hogy mikor (dátum), mit sporotolt és mennyi ideig, valamint egyes sportoknál azt is, hogy hány kilométert tett meg. (futás, úszás, biciklizés, stb...) A felhasználóknak lehetőségük van több, előre meghatározott sport közül választani, így a program azt is meg tudja mondani, hogy hány kcal-t égettek el a mozgás során. Ha olyan sportot űztek, ami nem szerepel a felsoroltak közül, akkor az egyéb kategóriát tudják választani, ahol a mozgásforma nevét, illetve az elégetett kcal-ák számát tudják megadni.
  
* ### Más felhasználók:
  Más felhasználókra is rá lehet keresni, felhasználói név. Itt az ő szintjüket, és pontjaikat lehet látni.
  Egy összesített ranglistát is meg lehet nézni, ahol a megszerzett pontjaik alapján vannak rangsorolva a felhasználók.

## Webes felület

## Mobilos applikáció

Az alkalmazás kétnyelvű lesz, a login képernyőn két kis zászló ikon lesz látható,egy angol meg egy magyar, ezekre kattintva kiválaszthatjuk, hogy milyen nyelven szeretnénk használni az alkalmazást.

A bejelentkező képernyőn a felhasználó megadhatja az email címét és a jelszavát a bejelentkezéshez. Ha még nincs fiókja, akkor létrehozhat egyet, a Sign up gombra kattintva. Ezután mejelenik a regisztrációs képernyő, itt meg kell adni a nevet, e-mail címet, a felhasználó nevet, a jelszót, utána a submitra kattintva a következő képen a születési időt kell kiválasztani, majd a magasságot és a súlyt megadni. Ha ez kész akkor a submitra kattintva a felhasználó sikeresen beregisztrált és rögtön belép a fiókja főképernyőjére.
Alapvetően az alkalmazás bezárása után, majd újramegnyitás után a felhasználó bejelentkezve marad. A főképernyő jobb felső sarkában lévő gombbal lehet kijelentkezni.

A főképernyőn látszik a felhasználó név, a felhasználó szintje és alatta egy progress bar, mely azt jelzi, hogy mennyi pont kell még a következő szint eléréséhez.
A képernyő közepén egy szöveg lesz megjelenítve azok alapján, hogy mennyit telejsített/ mennyire van még a weekly céljaitól.
Minden héten hétfőn a célok eltűnnek és felugrik egy ablak, hogy szeretné-e a felhasználó megváltoztatni a súlyát, ha igen akkor beírhatja az új súlyt, ha nem akkor rákattint a cancelre.

A képernyők alján 4 kis ikon látszik, melyek segítségével navigálhatunk a képernyők között. A házikó ikon a főképernyőre visz, a kupa a weekly célokhoz, a sportoló ember a sporttevékenységekhez, az ember ikon pedig a többi felhasználóhoz.

A weekly céloknál egy legördülő listából választhatjuk ki, hogy melyik hét céljait szeretnénk látni. Alapból az aktuális hét céljait látjuk, a felső progres bar a kilóméter célokat, az alsó a heti edzések számát jeleníti meg. A set goal gombokra kattintva a feljövő ablakban beállíthatóak a célok.

A sport fülnél fel vannak sorolva a sportok és ezekre kattintva, sportokra bontva a felhasználó  már elvégzett sporttevékenységei láthatóak egy listában. A plusz gombra kattintva beírhatunk új sporttevékenységet, ahol megadhatjuk a sportolás idejét és kilóméterben mért távolságát. Az alkalmazás ezekből és a személyes adatokból kiszámolja, hogy hány kalóriát égettünk. Ha az egyéb kategóriát választjuk, akkor megadhatjuk, hogy hány kalóriát égettünk el. 

A barátok fülnél minden másik felhasználó neve és szintje megjelenik egy rangsorban. Itt rá lehet keresni konkrét emberekre felhasználónév alapján, és akkor csak az a név jelenik meg a képernyőn.









