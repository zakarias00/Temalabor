package DbClasses;

import org.springframework.format.annotation.DateTimeFormat;

public class Activity {
    private int Id;
    private int SportId;
    private int UserId;
    private float Time;
    private DateTimeFormat Date;
    private float Kcal;
}
