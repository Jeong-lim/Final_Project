package com.mycompany.webapp.controller;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.place.service.PlaceService;
import com.mycompany.webapp.travel.model.TravelVo;


@Controller
public class HomeController {

	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private PlaceService travelService;
	
	@RequestMapping("/")
	public String main(Model model) {
		List<TravelVo> bestTravelList=placeService.bestTravelLIst();
		model.addAttribute("bestTravelList",bestTravelList);
		return "main";
	}
	
	@RequestMapping("/product")
	public String buyProduct() {
		return "common/product";
	}
	
	@RequestMapping("/productDetail")
	public String productDetail(HttpServletRequest request,Model model) {
		String img=(String)request.getParameter("img");
		String title=(String)request.getParameter("title");
		String price=(String)request.getParameter("price");
		String pname=(String) request.getParameter("pname");
		String pprice=(String) request.getParameter("pprice");
		String pcode=(String)request.getParameter("pcode");
		model.addAttribute("img",img);
		model.addAttribute("title",title);
		model.addAttribute("price",price);
		model.addAttribute("pname",pname);
		model.addAttribute("pprice",pprice);
		model.addAttribute("pcode",pcode);
		
		return "common/productDetail";
	}
	
	/*@RequestMapping("/signin")
	public String signIn() {
		return "auth/signin";
	}
	
	@RequestMapping("/signup")
	public String signUp() {
		return "auth/signup";
	}
	
	@RequestMapping("/mypage")
	public String myPage() {
		return "user/mypage";
	}
	
	@RequestMapping("/mypage/update")
	public String myPageUpdate() {
		return "user/mypageupdate";
	}
	
	@RequestMapping("/place")
	public String place() {
		return "place/placelist";
	}
	
	@RequestMapping("/place/detail")
	public String placeDetail() {
		return "place/placedetail";
	}
	
	@RequestMapping("/travel/detail")
	public String travelDetail() {
		return "travel/traveldetail";
	}
	
	@RequestMapping("/travel/insert")
	public String travelInsert() {
		return "travel/travelinsert";
	}
	
	@RequestMapping("/travel/list")
	public String travelList() {
		return "travel/travellist";
	}*/
	
}

