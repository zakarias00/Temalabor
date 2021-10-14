package hu.temalabor.getfit.Controller;

import DbClasses.User;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {
private List<User> users;

//Osszes User lekerese
    @GetMapping("/UserController")
    @ResponseBody
    void GetUsers(){

    }

    //Egy User kerese id alapjan
    @GetMapping("/UserController/{id}")
    @ResponseBody
    User GetUserById(@PathVariable(value = "id") int id){
        return new  User();
    }

    //Egy User kerese email, jelszo alapjan
    @GetMapping("/UserController/{email}{password}")
    @ResponseBody
    User GetUserByEmailPassword(@PathVariable(value = "email") String email,@PathVariable(value = "password") String password ){
        return new  User();
    }

    @PostMapping
    public void SaveUser(@Validated @RequestBody User user) {
        //TODO
    }
}
