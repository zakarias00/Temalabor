package hu.temalabor.GetFit.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document("Sport")
public class Sport {

    @Id
    private int id;
    private static String Type;
    private double Kcal;            //sport altal elegetheto kaloriak (1kg, 1 percre)

    public Sport(int Id, String Type, double Kcal){
        super();
        this.id=Id;
        this.Type =Type;
        this.Kcal=Kcal;

    }

    public static String GetType(){
        return Type;
    }

    public void SetKcal(){
        switch (Type){
            case "Futas":
                Kcal=0.207;
                break;
            case "Kocogas":
                Kcal=0.169;
                break;
            case "Seta":
                Kcal=0.118;
                break;
            case "Bicikli":
                Kcal=0.109;
                break;
            case "Aerobik": case "Evezés": case "Kosarlabda": case "Tenisz": case "Uszas":
                Kcal=0.091;
                break;
            case "Joga": case "Lovaglas":
                Kcal=0.054;
                break;
            default:
                Kcal=0;
                break;
        }
    }

    public double GetKcal() {
        return Kcal;
    }

    public int GetId(){
        return id;
    }
}
