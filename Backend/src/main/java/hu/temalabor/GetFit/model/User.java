package hu.temalabor.GetFit.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;

@Document("User")
public class User {
    @Id
    private int id;                 //azonosito
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

    public User(int id, String Username, String Name, String Email, String Password) {
        super();
        this.id = id;
        this.Username = Username;
        this.Name = Name;
        this.Email = Email;
        this.Password = Password;
        Points = 0;
        Level = 0;
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
        return  id;
    }

    public String getUsername() {
        return Username;
    }

    public String getName() {
        return Name;
    }

    public String getEmail() {
        return Email;
    }

    public String getPassword() {
        return Password;
    }

    public int getPoints() {
        return Points;
    }

    public int getLevel() {
        return Level;
    }

    public Date getBirthdate() {
        return Birthdate;
    }

    public boolean isGender() {
        return Gender;
    }
}
