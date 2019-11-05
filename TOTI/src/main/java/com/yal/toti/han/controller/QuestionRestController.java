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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.han.domain.QuestionInfo;
import com.yal.toti.han.domain.QuestionItem;
import com.yal.toti.han.service.QuestionAdminService;

@RestController
@RequestMapping("/admin/question")
public class QuestionRestController {

	@Autowired
	private QuestionAdminService questAdmin;
	
	@CrossOrigin
	@GetMapping("/list/{cate_idx}")
	public ResponseEntity<List<QuestionInfo>> getQuestionList(@PathVariable("cate_idx") int cate_idx) {

		List<QuestionInfo> list = questAdmin.getQuestionbyCate(cate_idx);

		ResponseEntity<List<QuestionInfo>> entity = new ResponseEntity<List<QuestionInfo>>(list, HttpStatus.OK);

		return entity;
	}
	
	@CrossOrigin
	@PostMapping("/insert")
	public ResponseEntity<String> questionInsert(QuestionInfo insertQuestion) {

		int cnt = questAdmin.QuestionInsert(insertQuestion);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}
	
	@CrossOrigin
	@DeleteMapping("/delete/{quest_idx}")
	public ResponseEntity<String> deleteQuestion(@PathVariable("quest_idx") int quest_idx) {

		int cnt = questAdmin.Questiondelete(quest_idx);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}
	
	@CrossOrigin
	@GetMapping("/edit/{quest_idx}")
	public ResponseEntity<QuestionInfo> getMemberInfo(@PathVariable("quest_idx") int quest_idx) {

		QuestionInfo info = questAdmin.getEditFormData(quest_idx);

		return new ResponseEntity<QuestionInfo>(info, HttpStatus.OK);
	}
	
	@CrossOrigin
	@PutMapping("/edit/{quest_idx}")
	public ResponseEntity<String> editMember(@PathVariable("quest_idx") int quest_idx, @RequestBody QuestionInfo questionInfo) {

		questionInfo.setQuest_idx(quest_idx);

		int cnt = questAdmin.QuestionEdit(questionInfo);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);

	}
	
	@CrossOrigin
	@GetMapping("/itemlist/{quest_idx}")
	public ResponseEntity<List<QuestionItem>> getItemList(@PathVariable("quest_idx") int quest_idx) {

		List<QuestionItem> list = questAdmin.getItemByQuestion(quest_idx);

		ResponseEntity<List<QuestionItem>> entity = new ResponseEntity<List<QuestionItem>>(list, HttpStatus.OK);

		return entity;
	}
	
	@CrossOrigin
	@PostMapping("/insertItem")
	public ResponseEntity<String> itemInsert(QuestionItem questionItem) {

		int cnt = questAdmin.ItemInsert(questionItem);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}
	
	@CrossOrigin
	@DeleteMapping("/deleteItem/{item_idx}")
	public ResponseEntity<String> deleteItem(@PathVariable("item_idx") int item_idx) {

		int cnt = questAdmin.Itemdelete(item_idx);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}
	
}
