package hu.temalabor.getfit.Controller;

import DbClasses.Goal;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

public class GoalContoroller {

    //Osszes Goal lekerese
    @GetMapping("/GoalController")
    @ResponseBody
    void GetGoals(){

    }

    //Egy Sport kerese id alapjan
    @GetMapping("/GoalController/{id}")
    @ResponseBody
    Goal GetGoalById(@PathVariable(value = "id") int id){
        return new Goal();
    }

    //Egy Goal kerese statusz alapjan
    @GetMapping("/GoalController/{status}")
    @ResponseBody
    List<Goal> GetGoalByType(@PathVariable(value = "status") int status){
        return null;
    }

    @PostMapping
    public void SaveGoal(@Validated @RequestBody Goal goal) {
        //TODO
    }
}
