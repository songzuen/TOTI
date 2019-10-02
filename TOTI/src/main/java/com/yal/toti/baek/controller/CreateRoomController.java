package com.yal.toti.baek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CreateRoomController {

	/* @GetMapping("/{est_idx}/{cate_idx}/{user}/{m_idx}") */
	@RequestMapping(value = ("chat/createroom/{est_idx}/{cate_idx}/{user}/{m_idx}"), method = RequestMethod.GET)
	public String createRoom(@PathVariable("est_idx") int est_idx, @PathVariable("cate_idx") int cate_idx,
			@PathVariable("user") int user, @PathVariable("m_idx") int m_idx, Model model) {

		model.addAttribute("est_idx", est_idx);
		model.addAttribute("cate_idx", cate_idx);
		model.addAttribute("user", user);
		model.addAttribute("m_idx", m_idx);

		return "/baek/chat/chat";
	}

}
