package hu.temalabor.GetFit.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;

@Document("Goal")
public class Goal {
    @Id
    private int id;
    private int Type;
    private int Amount;
    private int UserId;
    private Date DateStart;
    private int CurrentAmount;
    private int Status;

    public Goal(int id, int Amount, int UserId, Date DateStart) {
        super();
        this.id = id;
        Type = 0;
        this.Amount = Amount;
        this.UserId = UserId;
        this.DateStart = DateStart;
        CurrentAmount = 0;
    }


    public int GetType(){
        return Type;
    }
    public int Amount(){
        return Amount;
    }

    public int CurrentAmount(){
        return CurrentAmount;
    }

//    public void SetStatus(){
//        if (LocalDateTime.from(DateStart).plusDays(7).equals(LocalDateTime.from(DateStart))) Status =0; //lejart az egy het, nem sikerult teljesiteni
//        else if(CurrentAmount>=Amount) Status = 1;      //teljesitette
//        else Status =2; //meg folyamatban van
//    }

    public int GetStatus(){
        return Status;
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return UserId;
    }

    public Date getDateStart() {
        return DateStart;
    }
}
