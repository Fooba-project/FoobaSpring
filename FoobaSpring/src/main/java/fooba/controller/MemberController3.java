package fooba.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import fooba.service.MemberService3;

@Controller
public class MemberController3 {
	
	@Autowired
	MemberService3 ms;
	
	
	
}
