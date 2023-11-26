package com.springboot.dtod.contactus.constroller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.dtod.contactus.domain.Consultation;
import com.springboot.dtod.contactus.service.ConService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class ConController {
	
	private final ConService conService;
	
	//CREATED
	@CrossOrigin
	@PostMapping("/admin/contactUs")
	public ResponseEntity<?> save(@RequestBody Consultation con){
		return new ResponseEntity<>(conService.저장하기(con), HttpStatus.OK); // 200을 응답
	}

}
