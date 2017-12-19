package com.imran.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


	@Controller
	public class HomeController {
		
		@RequestMapping(value="/", method=RequestMethod.GET)
		public String home(){
			return "home";
		}
		
		@RequestMapping(value="/uploadImage", method=RequestMethod.POST)
		public String uploadImage(@RequestParam("file") MultipartFile file, @RequestParam("title") String title, ModelMap map){
			map.addAttribute("msg", "Successfully Upload Image");
			
			
			if (!file.isEmpty()) {
				try {
					System.out.println(file.getOriginalFilename());
					System.out.println(file.getContentType());
					System.out.println(file.getSize());
					byte[] bytes = file.getBytes();
					
					String fileName = file.getOriginalFilename();
					
					// System.out.println(bytes);
					
					// Creating the directory to store file
	
					
					
					  File dir = new File("D:/JAVA/SPRING_FRAMEWORK/spMAVEN/spImgCURd/src/main/webapp/resources/imgFolder/");
						// Create the file on server
						File serverFile = new File(dir.getAbsolutePath()
								+ File.separator+fileName);
						BufferedOutputStream stream = new BufferedOutputStream(
								new FileOutputStream(serverFile));
						System.out.println(serverFile);
						System.out.println(stream);
						stream.write(bytes);
						stream.close();
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				map.addAttribute("msg", "No Image file Selected");
			}	
			
			return "home";
		}
		
		@RequestMapping(value="/welcome", method=RequestMethod.GET)
		public String welcome(Model m){
			m.addAttribute("msg", "This message from Welcome Method");
			return "welcome";
		}

	}
