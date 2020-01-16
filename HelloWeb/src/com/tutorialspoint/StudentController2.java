package com.tutorialspoint;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.ModelMap;
@Controller
public class StudentController2 {
    @RequestMapping(value = "/student2", method = RequestMethod.GET)
    public ModelAndView student2() {
        return new ModelAndView("student2", "command", new Student2());
    }
    @RequestMapping(value = "/addStudent2", method = RequestMethod.POST)
    @ExceptionHandler({SpringException.class})
    public String addStudent2( @ModelAttribute("HelloWeb")Student2 student,
                              ModelMap model) {
        if(student.getName().length() < 5 ){
            throw new SpringException("Given name is too short");
        }else{
            model.addAttribute("name", student.getName());
        }
        if( student.getAge() < 10 ){
            throw new SpringException("Given age is too low");
        }else{
            model.addAttribute("age", student.getAge());
        }
        model.addAttribute("id", student.getId());
        return "result3";
    }
}