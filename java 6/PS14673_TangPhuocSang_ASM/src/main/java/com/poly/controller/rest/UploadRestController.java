package com.poly.controller.rest;

import java.io.File;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.poly.service.UploadService;

@CrossOrigin("*")
@RestController
@RequestMapping("rest/upload")
public class UploadRestController {
	@Autowired private UploadService uploadService;
	
	@PostMapping("{folder}")
	public JsonNode upload(@PathVariable("folder") String folder,
			@PathParam("file")MultipartFile file) {
		File saveFile = uploadService.save(file,folder);
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode node = mapper.createObjectNode();
		node.put("name", saveFile.getName());
		node.put("size", saveFile.length());
		return node;
	}
}
