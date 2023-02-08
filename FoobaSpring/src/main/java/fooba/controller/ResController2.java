package fooba.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import fooba.service.ResService2;

@Controller
public class ResController2 {
	
	@Autowired
	ResService2 rs;

}
