package com.mycompany.webapp.file.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.Null;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.file.model.FileVo;
import com.mycompany.webapp.file.service.FileService;
import com.mycompany.webapp.member.controller.MemberController;

@Controller
public class FileController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
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
		
		String memberId = (String)session.getAttribute("memberId");
		MultipartFile mf=file.getAttach();
		FileVo fileVo = fileService.selectUserImage(memberId);
		
		
		if(!mf.isEmpty()) {
			String originalName=mf.getOriginalFilename();
			String savedFileName=UUID.randomUUID().toString()+"-"+originalName;
			String uploadRoot="C:/Temp/userImage";
			file.setFileOriginalName(originalName);
			file.setFileSavedName(savedFileName);
			file.setUploadRoot(uploadRoot);
			file.setUserName(memberId);
			session.setAttribute("fileSavedName", savedFileName);
			
			File uploadfile=new File(uploadRoot+"/"+savedFileName);
			mf.transferTo(uploadfile);
		}
		
		
		if(fileVo != null && !fileVo.equals("")) {
			fileService.deleteUserImage(memberId); // db에 filevo가 있을 때 delete & insert
			fileService.insertUserImage(file);
			
		} else {
			fileService.insertUserImage(file); // db에 filevo가 없을 때 insert
		}
		return "redirect:/mypage/update";
		
		}
	
	@RequestMapping("/userfiledelete")
	public String userImageDelete(HttpSession session, FileVo file, Model model) {
		String memberId = (String)session.getAttribute("memberId");
		fileService.deleteUserImage(memberId);
		session.setAttribute("fileSavedName",null);
		return "redirect:/mypage/update";
		
	}
}
	
	
