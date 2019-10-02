package com.yal.toti;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TOTIMainController {
	
	@RequestMapping("/main") 
	  public String getMain() {
		  return "main";
	 }

}
