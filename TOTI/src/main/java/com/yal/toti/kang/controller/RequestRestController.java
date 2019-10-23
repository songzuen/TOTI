package com.yal.toti.kang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.google.protobuf.DescriptorProtos.SourceCodeInfo.Location;
import com.yal.toti.kang.domain.CategoriData;
import com.yal.toti.kang.domain.EstimateeList;
import com.yal.toti.kang.domain.ItemListData;
import com.yal.toti.kang.domain.UserRequestData;
import com.yal.toti.kang.domain.UserRequestList;
import com.yal.toti.kang.service.RequestService;

@RestController
@CrossOrigin
public class RequestRestController {

	@Autowired
	private RequestService requestService;
	
	@GetMapping("/kategorieList")
	public ResponseEntity<List<CategoriData>> getKategorieList() {
		
		List<CategoriData> list = requestService.getKategorieList();
		
		ResponseEntity<List<CategoriData>> entity = new ResponseEntity<List<CategoriData>>(list, HttpStatus.OK);
		
		return entity;	
	}
	
	@GetMapping("/getkateidx/{m_idx}")
	public ResponseEntity<String> getKateIdx(@PathVariable("m_idx") int m_idx) {
		
		String data = requestService.getKategorIdx(m_idx);

		ResponseEntity<String> entity = new ResponseEntity<String>(data, HttpStatus.OK);
				
		return entity;	
	}
	
	@GetMapping("/request/itemList/{quest_idx}")
	public ResponseEntity<List<ItemListData>> getItemList(@PathVariable("quest_idx") int quest_idx) {
		
		List<ItemListData> list = requestService.getItemList(quest_idx);
		
		ResponseEntity<List<ItemListData>> entity = new ResponseEntity<List<ItemListData>>(list, HttpStatus.OK);
		
		return entity;	
	}
	
	
	@GetMapping("/requests/{m_idx}")
	public ResponseEntity<List<UserRequestList>> getUserRequests(@PathVariable("m_idx") int m_idx) {
		
		List<UserRequestList> list = requestService.getUserRequests(m_idx);
		
		ResponseEntity<List<UserRequestList>> entity = new ResponseEntity<List<UserRequestList>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	@GetMapping("/requestsDelList/{m_idx}")
	public ResponseEntity<List<Integer>> getUserDelRequests(@PathVariable("m_idx") int m_idx) {
		
		List<Integer> list = requestService.getUserDelRequests(m_idx);
		
		ResponseEntity<List<Integer>> entity = new ResponseEntity<List<Integer>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	
	@DeleteMapping("/requests/{request_idx}")
	public ResponseEntity<Integer> requestDelete(@PathVariable("request_idx") int request_idx) {
		
		int cnt = requestService.requestDelete(request_idx);
		
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(cnt, HttpStatus.OK);
		
		return entity;
	}
	
	
	@GetMapping("/request/requestData")
	public ResponseEntity<UserRequestData> getRequest(@RequestParam("request_idx") int request_idx,@RequestParam("m_idx") int m_idx) {
		
		UserRequestData data = requestService.getUserRequestData(request_idx, m_idx);
		
		ResponseEntity<UserRequestData> entity = new ResponseEntity<UserRequestData>(data, HttpStatus.OK);
		
		return entity;
	}
	
	
	@GetMapping("/estimatee/estimateeList/{request_idx}")
	public ResponseEntity<EstimateeList> getEstimateeList(@PathVariable("request_idx") int request_idx) {
		
		EstimateeList data = requestService.getEstimateeList(request_idx);
		
		ResponseEntity<EstimateeList> entity = new ResponseEntity<EstimateeList>(data, HttpStatus.OK);
		
		return entity;
	}
	
	
	
}
