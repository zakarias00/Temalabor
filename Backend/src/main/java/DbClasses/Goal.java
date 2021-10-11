package DbClasses;

import org.springframework.format.annotation.DateTimeFormat;

public class Goal {
    private int Id;
    private String Type;
    private int Amount;
    private int UserId;
    private DateTimeFormat Date;
    private int CurrentAmount;
    private int Status;
}
