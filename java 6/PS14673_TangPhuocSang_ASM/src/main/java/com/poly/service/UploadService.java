package com.poly.service;

import java.io.File;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.entity.Order;

@Service
public interface UploadService {
	File save(MultipartFile file, String folder);
}
