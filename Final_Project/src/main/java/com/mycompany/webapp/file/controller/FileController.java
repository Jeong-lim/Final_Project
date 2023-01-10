package com.mycompany.webapp.file.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.file.model.FileVo;
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
	
	
	@RequestMapping("/fileuploadform")
	public String insertFileForm(){
		
		return "fileuploadform";
	}
	
	@RequestMapping("/fileupload")
	public String insertFile(FileVo file,Model model,String fileName) throws IOException {
		MultipartFile mf=file.getAttach();
		if(!mf.isEmpty()) {
			String originalName=mf.getOriginalFilename();
			String savedFileName=UUID.randomUUID().toString()+"-"+originalName;
			String uploadRoot="C:/Temp/projectfiles";
			file.setFileOriginalName(originalName);
			file.setFileSavedName(savedFileName);
			file.setUploadRoot(uploadRoot);
			model.addAttribute("fileName",fileName);
			
			File uploadfile=new File(uploadRoot+"/"+savedFileName);
			mf.transferTo(uploadfile);
		}
		
		fileService.insertFile(file);
		
		
		return "redirect:/fileuploadform";
	}
	
	@RequestMapping("/userfileupload")
	public String userImageFile(HttpSession session, FileVo file,Model model) throws IOException {
		String userName = (String)session.getAttribute("memberId");
		MultipartFile mf=file.getAttach();
		if(!mf.isEmpty()) {
			String originalName=mf.getOriginalFilename();
			String savedFileName=UUID.randomUUID().toString()+"-"+originalName;
			String uploadRoot="C:/Temp/projectfiles";
			file.setFileOriginalName(originalName);
			file.setFileSavedName(savedFileName);
			file.setUploadRoot(uploadRoot);
			file.setUserName(userName);
			
			File uploadfile=new File(uploadRoot+"/"+savedFileName);
			mf.transferTo(uploadfile);
		}
		
		fileService.userImageFile(file);
		
		
		return "user/mypageupdate";
	}
	
	

}
