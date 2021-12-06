import { Sport } from "./sport";
import { User } from "./user";

export interface Activity{
    _id: number;
    date: number;
    distance: number;
    kcal: number;
    sportId: number;
    time: number;
    userId: number;
}