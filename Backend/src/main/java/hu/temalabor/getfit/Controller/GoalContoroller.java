package hu.temalabor.GetFit.Controller;


import hu.temalabor.GetFit.model.Goal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
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


}
