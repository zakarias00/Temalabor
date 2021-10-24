package hu.temalabor.GetFit.Controller;


import hu.temalabor.GetFit.model.Goal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
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



}
