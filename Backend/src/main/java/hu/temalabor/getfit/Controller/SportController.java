package hu.temalabor.getfit.Controller;

import DbClasses.Sport;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

public class SportController {

    //Osszes Sport lekerese
    @GetMapping("/SportController")
    @ResponseBody
    void GetSports(){

    }

    //Egy Sport kerese id alapjan
    @GetMapping("/SportController/{id}")
    @ResponseBody
    Sport GetSportById(@PathVariable(value = "id") int id){
        return new  Sport();
    }

    //Egy Sport kerese tipus alapjan
    @GetMapping("/SportController/{type}")
    @ResponseBody
    Sport GetSportByType(@PathVariable(value = "type") String type){
        return new  Sport();
    }

    @PostMapping
    public void SaveSport(@Validated @RequestBody Sport sport) {
        //TODO
    }
}
