package hu.temalabor.GetFit.Controller;


import hu.temalabor.GetFit.model.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
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


}
