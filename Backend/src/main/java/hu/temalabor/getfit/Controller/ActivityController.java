package hu.temalabor.GetFit.Controller;


import hu.temalabor.GetFit.model.Activity;
import hu.temalabor.GetFit.repository.ActivityRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/ActivityController")
public class ActivityController {

    ActivityRepository activityRepository;
    public ActivityController(ActivityRepository activityRepository){
        this.activityRepository=activityRepository;
    }

    //Osszes Activity lekerese
    @GetMapping("/")
    List<Activity> GetActivities(){
        return activityRepository.findAll();
    }

    //Egy Activity kerese id alapjan
    @GetMapping("/{id}")
    Optional<Activity> GetActivityById(@PathVariable(value = "id") int id){
        return activityRepository.findById(id);
    }

    @DeleteMapping("/{id}")
    void DeleteActivityById(@PathVariable(value="id") int id){
        activityRepository.deleteById(id);
    }

    @PostMapping
    void NewActivity(@RequestBody Activity newActivity){
        activityRepository.save(newActivity);
    }

    @PutMapping
    void updateActivity(@PathVariable(value="id") int id, @RequestBody Activity uActivity){
        Optional<Activity> activityData = activityRepository.findById(id);
        if(activityData.isPresent()){
            Activity activity = activityData.get();
            activity=uActivity;
            activityRepository.save(activity);
        }
    }


}
