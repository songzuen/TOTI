package com.yal.toti.han.controller;

import java.util.List;

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

import com.yal.toti.han.domain.CategoryInfo;
import com.yal.toti.han.domain.ServiceInfo;
import com.yal.toti.han.service.ServiceAdminService;

@RestController
@RequestMapping("/admin/service")
public class ServiceRestController {
	
	@Autowired
	private ServiceAdminService serviceAdmin;

	@CrossOrigin
	@GetMapping("/categoryList")
	public ResponseEntity<List<CategoryInfo>> getKategorieList() {
		
		List<CategoryInfo> list = serviceAdmin.getCategoryList();
		
		ResponseEntity<List<CategoryInfo>> entity = new ResponseEntity<List<CategoryInfo>>(list, HttpStatus.OK);
		
		return entity;	
	}
	
	@CrossOrigin
	@PostMapping("/insert")
	public ResponseEntity<String> serviceInsert(ServiceInfo insertService) {

		int cnt = serviceAdmin.ServiceInsert(insertService);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}
	
	@CrossOrigin
	@GetMapping("/list/{cate_idx}")
	public ResponseEntity<List<ServiceInfo>> getServiceList(@PathVariable("cate_idx") int cate_idx) {

		List<ServiceInfo> list = serviceAdmin.getServicebyCate(cate_idx);

		ResponseEntity<List<ServiceInfo>> entity = new ResponseEntity<List<ServiceInfo>>(list, HttpStatus.OK);

		return entity;
	}

	@CrossOrigin
	@DeleteMapping("/delete/{service_idx}")
	public ResponseEntity<String> deleteService(@PathVariable("service_idx") int service_idx) {

		int cnt = serviceAdmin.Servicedelete(service_idx);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}

}
