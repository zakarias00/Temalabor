import { Sport } from "./sport";
import { User } from "./user";

export interface Activity{
    id: number;
    SportId: number;
    UserId: number;
    Time: number;
    Date: Date;
    Kcal: number;
    sport: Sport;
    user: User;
}