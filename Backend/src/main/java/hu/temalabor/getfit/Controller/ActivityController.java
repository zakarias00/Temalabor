package hu.temalabor.getfit.Controller;

import DbClasses.Activity;
import DbClasses.Goal;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

public class ActivityController {

    //Osszes Activity lekerese
    @GetMapping("/ActivityController")
    @ResponseBody
    void GetActivities(){

    }

    //Egy Activity kerese id alapjan
    @GetMapping("/ActivityController/{id}")
    @ResponseBody
    Goal GetActivityById(@PathVariable(value = "id") int id){
        return new Goal();
    }


    @PostMapping
    public void SaveActivity(@Validated @RequestBody Activity activity) {
        //TODO
    }
}
