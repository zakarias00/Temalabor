package DbClasses;

import org.springframework.format.annotation.DateTimeFormat;

public class Activity {
    private int Id;                 //azonosito
    private int SportId;            //sport azonosito
    private int UserId;             //felhasznalo azonosito
    private double Time;             //sporttal tolott ido (perc)
    private DateTimeFormat Date;    //sportolas kezdete
    private double Kcal;             //elegetett kaloriak

    private User user;              //UserIdhoz tartozo User
    private Sport sport;            //SportIdhoz tartozo Sport

    public void KcalCalulate (){
        Kcal= sport.GetKcal()* user.GetWeight()*Time;
    }

    public String AddActivityDb(){
        return "INSERT INTO GetFitDB.Activity (SportId, UserId, Time, Date, Kcal) VALUES ('"+SportId+"',"+UserId+","+Time+","+Date.toString()+","
                +Kcal+")";
    }

    public void SetSportId(){
        SportId=sport.GetId();
    }

    public void SetUserId(){
        UserId=user.GetId();
    }
}
