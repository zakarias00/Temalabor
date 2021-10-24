package hu.temalabor.GetFit.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;

@Document("Activity")
public class Activity {
    @Id
    private int id;                 //azonosito
    private int SportId;            //sport azonosito
    private int UserId;             //felhasznalo azonosito
    private double Time;             //sporttal tolott ido (perc)
    private Date Date;    //sportolas kezdete
    private double Kcal;             //elegetett kaloriak

    public Activity(int id, int SportId, int UserId, double Time, Date Date) {
        super();
        this.id = id;
        this.SportId = SportId;
        this.UserId = UserId;
        this.Time = Time;
        this.Date = Date;
    }


    public void KcalCalulate (){
        //Kcal= sport.GetKcal()* user.GetWeight()*Time;
    }


    public void SetSportId(){
        //SportId=sport.GetId();
    }

    public void SetUserId(){
        //UserId=user.GetId();
    }
}
