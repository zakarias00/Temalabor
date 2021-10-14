package DbClasses;


public class Sport {
    private int Id;
    private static String Type;
    private double Kcal;            //sport altal elegetheto kaloriak (1kg, 1 percre)

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

    public String InsertSportDB(){
        return "INSERT INTO GetFitDB.Sport (Type, Kcal) VALUES ('"+Type+"',"+Kcal+")";
    }

    public int GetId(){
        return Id;
    }
}
