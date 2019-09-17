package com.yal.toti.han.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.han.domain.InsertService;
import com.yal.toti.han.domain.ServiceInfo;
import com.yal.toti.han.service.AdminDeleteService;
import com.yal.toti.han.service.AdminInsertService;
import com.yal.toti.han.service.AdminListService;

@RestController
@RequestMapping("/admin/service")
public class ServiceRestFullController {

	@Autowired
	private AdminInsertService admininsertService;

	@Autowired
	private AdminListService adminlistService;

	@Autowired
	private AdminDeleteService admindeleteService;

	@CrossOrigin
	@PostMapping("/insert")
	public ResponseEntity<String> serviceInsert(InsertService insertService, HttpServletRequest request) {

		System.out.println(insertService);

		int cnt = admininsertService.ServiceInsert(request, insertService);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}

	@CrossOrigin
	@GetMapping("/list")
	public ResponseEntity<List<ServiceInfo>> getAllList() {

		List<ServiceInfo> list = adminlistService.getAllList();

		ResponseEntity<List<ServiceInfo>> entity = new ResponseEntity<List<ServiceInfo>>(list, HttpStatus.OK);

		return entity;
	}

	@CrossOrigin
	@DeleteMapping("/delete/{id}")
	public ResponseEntity<String> deleteService(@PathVariable("id") int cate_idx) {

		int cnt = admindeleteService.servicedelete(cate_idx);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}

}
