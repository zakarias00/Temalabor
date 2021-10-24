package hu.temalabor.GetFit.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import java.time.LocalDateTime;

@Document("Goal")
public class Goal {
    @Id
    private int id;
    private String Type;
    private int Amount;
    private int UserId;
    private LocalDateTime DateStart;
    private int CurrentAmount;
    private int Status;

    public Goal() {
    }

    public String InsertGoalDB(){
        return "INSERT INTO GetFitDB.Goal (Type, Amount, UserId, Date, CurrentAmount, Status) VALUES ('"+Type+"',"+Amount+","+UserId+","+ DateStart.toString()+","
        +CurrentAmount+","+Status+")";
    }

    public String GetType(){
        return Type;
    }
    public int Amount(){
        return Amount;
    }

    public int CurrentAmount(){
        return CurrentAmount;
    }

    public void SetStatus(){
        if (LocalDateTime.from(DateStart).plusDays(7).equals(LocalDateTime.from(DateStart))) Status =0; //lejart az egy het, nem sikerult teljesiteni
        else if(CurrentAmount>=Amount) Status = 1;      //teljesitette
        else Status =2; //meg folyamatban van
    }

    public int GetStatus(){
        return Status;
    }
}
