package fooba.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import fooba.service.MemberService2;
import fooba.service.ResService;

@Controller
public class ResController {
	
	@Autowired
	ResService rs;
}
