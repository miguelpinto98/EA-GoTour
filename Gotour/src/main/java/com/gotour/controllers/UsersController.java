package com.gotour.controllers;

import com.gotour.models.Tourist;
import com.gotour.models.User;
import com.gotour.services.UserService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/users/")
public class UsersController {

    @Autowired
    UserService service;
    
    @RequestMapping(value = "signup", method = RequestMethod.GET)
    public String signup(ModelMap map) {
        map.put("msg", "Hello World!");
        return "user/signup";
    }

    @RequestMapping(value = "new", method = RequestMethod.POST)
    public String register(@RequestParam("name") String name, @RequestParam("email") String email) {

        /*
        if (result.hasErrors()) {
            return "/user/signup";
        }
        */
        
        Tourist t = new Tourist();
        t.setName(name);
        t.setEmail(email);
        
        service.saveTourist(t);
        
        return "";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(ModelMap map) {
        map.put("msg", "Hello World!");
        return "user/login";
    }

    @RequestMapping(value = "signin", method = RequestMethod.POST)
    public String signin(ModelMap map) {

        return "";
    }
}
