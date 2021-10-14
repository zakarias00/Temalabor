package DbClasses;

import java.util.Date;

public class User {
    private int Id;                 //azonosito
    private String Username;        //felhasznalonev
    private String Name;            //nev
    private String Email;           //emailcim
    private String Password;        //jelszo
    private int Points;             //pontok
    private int Level;              //szint
    private Date Birthdate;         //szuletesi ido
    private int Height;             //magasssag
    private int Weight;             //suly
    private boolean Gender;         //nem true=No; false=Ferfi

    public User() {
    }

    public double GetWeight() {
        return Weight;
    }
    public double GetHeight() {
        return Height;
    }

    public double BMI(){
        return Height/Weight;
    }

    public int GetId() {
        return  Id;
    }
}
