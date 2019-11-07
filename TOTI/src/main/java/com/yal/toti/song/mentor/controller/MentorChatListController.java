package com.yal.toti.song.mentor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.song.mentor.domain.ChatList;
import com.yal.toti.song.mentor.service.mentorChatListService;

@RestController
@RequestMapping("/mentor/chattingList/{mento_idx}")
public class MentorChatListController {
	
	@Autowired
	private mentorChatListService mentorChatService;

	@CrossOrigin
	@GetMapping
	public ResponseEntity<List<ChatList>> getList(@PathVariable("mento_idx") int mento_idx){
		List<ChatList> list = null;
		
		list = mentorChatService.getList(mento_idx);
		
		ResponseEntity<List<ChatList>> entity = new ResponseEntity<List<ChatList>>(list,HttpStatus.OK);
		
		return entity;
	}
}
