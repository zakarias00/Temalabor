package DbClasses;

import java.time.LocalDateTime;
import java.util.Date;

public class Goal {
    private int Id;
    private String Type;
    private int Amount;
    private int UserId;
    private Date DateStart;
    private int CurrentAmount;
    private int Status;

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
        if (LocalDateTime.from(DateStart.toInstant()).plusDays(7).equals(LocalDateTime.from(DateStart.toInstant()))) Status =0; //lejart az egy het, nem sikerult teljesiteni
        else if(CurrentAmount>=Amount) Status = 1;      //teljesitette
        else Status =2; //meg folyamatban van
    }

    public int GetStatus(){
        return Status;
    }
}
