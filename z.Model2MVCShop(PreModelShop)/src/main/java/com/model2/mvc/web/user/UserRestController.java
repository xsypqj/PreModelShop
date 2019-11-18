package com.model2.mvc.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.domain.User;

@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	//Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	//Constructor
	public UserRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser(@PathVariable String userId) throws Exception {
		
		System.out.println("/user/json./getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}//end of getUser
	
	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(@RequestBody User user, HttpSession session) throws Exception {
		
		System.out.println("/user/json/login : POST");
		
		//Business Logic
		System.out.println("::"+user);
		User dbUser = userService.getUser(user.getUserId());
		
		if(user.getPassword().equals(dbUser.getPassword())) {
			session.setAttribute("user", dbUser);
		}
		
		return dbUser;
	}
	
}//end of class





































