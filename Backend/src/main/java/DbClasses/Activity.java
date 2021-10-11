package DbClasses;

import org.springframework.format.annotation.DateTimeFormat;

public class Activity {
    private int Id;                 //azonosito
    private int SportId;            //sport azonosito
    private int UserId;             //felhasznalo azonosito
    private double Time;             //sporttal tolott ido
    private DateTimeFormat Date;    //sportolas kezdete
    private double Kcal;             //elegetett kaloriak

    private User user;              //UserIdhoz tartozo User
    private Sport sport;            //SportIdhoz tartozo Sport

    public void KcalCalulate (){
        double x=0;
        switch (Sport.GetType()){
            case "Futas":
                x=0.207;
                break;
            case "Kocogas":
               x=0.169;
                break;
            case "Seta":
                x=0.118;
                break;
            case "Bicikli":
                x=0.109;
                break;
            case "Aerobik": case "Evezés": case "Kosarlabda": case "Tenisz": case "Uszas":
                x=0.091;
                break;
            case "Joga": case "Lovaglas":
                x=0.054;
                break;
            default:
                Kcal=0;
                break;
        } 
        Kcal= x* user.GetWeight()*Time;
    }

}
