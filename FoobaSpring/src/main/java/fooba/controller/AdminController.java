package fooba.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import fooba.service.AdminService;
import fooba.service.MemberService2;

@Controller
public class AdminController {
	
	@Autowired
	AdminService as;
}
