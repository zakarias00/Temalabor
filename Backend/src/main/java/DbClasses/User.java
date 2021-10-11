package DbClasses;

import org.springframework.format.annotation.DateTimeFormat;

public class User {
    private int Id;                 //azonosito
    private String Username;        //felhasznalonev
    private String Name;            //nev
    private String Email;           //emailcim
    private String Password;        //jelszo
    private int Points;             //pontok
    private int Level;              //szint
    private DateTimeFormat Birthdate;   //szuletesi ido
    private int Height;             //magasssag
    private int Weight;             //suly
}
