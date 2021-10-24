package hu.temalabor.GetFit.Controller;


import hu.temalabor.GetFit.model.Sport;
import hu.temalabor.GetFit.repository.SportRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/SportController")
public class SportController {
    private SportRepository sportRepository;

    public SportController(SportRepository sportRepository) {
        this.sportRepository = sportRepository;
    }

    //Osszes Sport lekerese
    @GetMapping("/")
    @ResponseBody
    List<Sport> GetSports(){
        return sportRepository.findAll();
    }

    //Egy Sport kerese id alapjan
    @GetMapping("/{id}")
    @ResponseBody
    Sport GetSportById(@PathVariable(value = "id") int id){
        return null;
    }

    //Egy Sport kerese tipus alapjan
    @GetMapping("/{type}")
    @ResponseBody
    Sport GetSportByType(@PathVariable(value = "type") String type){
        return null;
    }


}
