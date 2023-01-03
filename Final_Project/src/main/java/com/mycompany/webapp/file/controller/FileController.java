package com.mycompany.webapp.file.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.file.service.FileService;

@Controller
public class FileController {
	
	@Autowired
	private FileService fileService;

	@RequestMapping("/file")
	public String place() {
		System.out.println("check");
		fileService.countFile();
		return "place/placelist";
	}
	
	

}
