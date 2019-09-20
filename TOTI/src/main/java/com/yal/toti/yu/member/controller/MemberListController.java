package com.yal.toti.yu.member.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.yu.member.domain.MemberInfo;
import com.yal.toti.yu.member.service.MemberListService;

@RestController
@RequestMapping("/admin/memberlist")
public class MemberListController {

	
	@Autowired
	private MemberListService service;

	@CrossOrigin
	@GetMapping()
	public ResponseEntity<List<MemberInfo>> getAllList() {

		List<MemberInfo> list = service.getAllList();

		ResponseEntity<List<MemberInfo>> entity = new ResponseEntity<List<MemberInfo>>(list, HttpStatus.OK);

		return entity;
	}
	
	
	
	
	
	
	
	
	
	/*
	 * @Autowired private MemberListService listService;
	 * 
	 * @RequestMapping("member/memberList") public String memberList(Model
	 * model, @RequestParam(value = "p", defaultValue = "1") int pageNumber,
	 * 
	 * @RequestParam(value = "stype", required = false) String stype,
	 * 
	 * @RequestParam(value = "keyword", required = false) String keyword) {
	 * 
	 * SearchParam searchParam = null;
	 * 
	 * if (stype != null && keyword != null && !stype.isEmpty() &&
	 * !keyword.isEmpty()) { searchParam = new SearchParam();
	 * searchParam.setStype(stype); searchParam.setKeyword(keyword); }
	 * 
	 * ListViewData listdata = listService.getListData(pageNumber, searchParam);
	 * 
	 * System.out.println("전체 회원의 수 : " + listdata.getTotalCount());
	 * 
	 * 
	 * //프린트ln이 생각보다 출력시 메모리를 사용해서 성능에 영향을.. 그러니 이제 안 쓰면 주석! 그리고 콘솔 로그가 톰캣에 남는데
	 * 남겨두는건 꼭 필요한 것들만! for(MemberInfo m : listdata.getMemberList()) {
	 * System.out.println(m); //이러면 멤버인포에 투스트링 해놓은게 찍힐 것 }
	 * 
	 * 
	 * model.addAttribute("viewData", listdata);
	 * 
	 * // 나중에 와이어프레임이나 페이퍼들 산출물로 요구할거란 말씀을 하고계신다. return "member/memberList"; }
	 * 
	 * // 2 - json // 이렇게 해놓고 http://localhost:8080/mm/member/memberListJson?p=2 이렇게
	 * 확인해봄 // @RequestMapping("/member/memberListJson")
	 * 
	 * @RequestMapping("/member/json/memberListJson")
	 * 
	 * public @ResponseBody ListViewData memberListJson(@RequestParam(value = "p",
	 * defaultValue = "1") int pageNumber,
	 * 
	 * @RequestParam(value = "stype", required = false) String stype,
	 * 
	 * @RequestParam(value = "keyword", required = false) String keyword,
	 * HttpServletResponse response // 스프링 4.2버전 되면 리스폰스 엔티티이용해서 이거 안 받아도 처리할 수 있음 )
	 * {
	 * 
	 * SearchParam searchParam = null;
	 * 
	 * if (stype != null && keyword != null && !stype.isEmpty() &&
	 * !keyword.isEmpty()) { searchParam = new SearchParam();
	 * searchParam.setStype(stype); searchParam.setKeyword(keyword); }
	 * 
	 * ListViewData listdata = listService.getListData(pageNumber, searchParam); //
	 * response.setStatus(HttpServletResponse.SC_OK);// 상수 200 //
	 * response.setStatus(HttpServletResponse.SC_NOT_FOUND);//404
	 * response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);// 500
	 * 
	 * // 브라우저는 어떻게 에러가 나더라도 화면을 출력 but // 자바코드에서는 상태값이 200(정상)을 가져오지 못했을 경우엔 오류가 나게
	 * 됨. 그게 맞는거고. 그래서 f12 보면~ return listdata; }
	 * 
	 * // 반환 타입이 ResponseEntitiy<T> : 스프링 4.2 버전 이상에서 사용가능! // 반환하는 Body,
	 * statusCode,HttpHeader (를 담고있는) // @RequestMapping("/member/memberListJson2")
	 * 
	 * @RequestMapping("/member/json/memberListJson2") // @ResponseBody public
	 * ResponseEntity<ListViewData> memberListJson2(@RequestParam(value = "p",
	 * defaultValue = "1") int pageNumber,
	 * 
	 * @RequestParam(value = "stype", required = false) String stype,
	 * 
	 * @RequestParam(value = "keyword", required = false) String keyword) {
	 * 
	 * SearchParam searchParam = null;
	 * 
	 * if (stype != null && keyword != null && !stype.isEmpty() &&
	 * !keyword.isEmpty()) { searchParam = new SearchParam();
	 * searchParam.setStype(stype); searchParam.setKeyword(keyword); }
	 * 
	 * ListViewData listdata = listService.getListData(pageNumber, searchParam);
	 * 
	 * ResponseEntity<ListViewData> entity = new
	 * ResponseEntity<ListViewData>(listdata, HttpStatus.OK);
	 * 
	 * return entity; }
	 */

	/*
	 * // 리퀘스트 매핑에 /json/ 추가했음
	 * 
	 * 
	 * 
	 * @RequestMapping("/member/json/memberList.json")
	 * 
	 * @ResponseBody public ListViewData memberList2( Model model,
	 * 
	 * @RequestParam(value = "p", defaultValue = "1") int pageNumber,
	 * 
	 * @RequestParam(value = "stype", required = false) String stype,
	 * 
	 * @RequestParam(value = "keyword", required = false) String keyword,
	 * HttpServletResponse response ) {
	 * 
	 * 
	 * //response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	 * response.setStatus(HttpServletResponse.SC_OK);
	 * 
	 * 
	 * SearchParam searchParam = null;
	 * 
	 * if( stype!=null && keyword!=null && !stype.isEmpty() && !keyword.isEmpty()) {
	 * searchParam = new SearchParam(); searchParam.setStype(stype);
	 * searchParam.setKeyword(keyword); }
	 * 
	 * 
	 * 
	 * 
	 * ListViewData listdata = listService.getListData(pageNumber, searchParam);
	 * 
	 * 
	 * for(MemberInfo m : listdata.getMemberList()) { System.out.println(m); }
	 * 
	 * 
	 * model.addAttribute("viewData", listdata);
	 * 
	 * 
	 * return listdata; }
	 */
	/*
	 * @RequestMapping("/member/json/memberList2.json")
	 * 
	 * @ResponseBody public ResponseEntity<ListViewData> memberList3(Model model,
	 * 
	 * @RequestParam(value = "p", defaultValue = "1") int pageNumber,
	 * 
	 * @RequestParam(value = "stype", required = false) String stype,
	 * 
	 * @RequestParam(value = "keyword", required = false) String keyword) {
	 * 
	 * SearchParam searchParam = null;
	 * 
	 * if (stype != null && keyword != null && !stype.isEmpty() &&
	 * !keyword.isEmpty()) { searchParam = new SearchParam();
	 * searchParam.setStype(stype); searchParam.setKeyword(keyword); }
	 * 
	 * ListViewData listdata = listService.getListData(pageNumber, searchParam);
	 * 
	 * 
	 * for(MemberInfo m : listdata.getMemberList()) { System.out.println(m); }
	 * 
	 * 
	 * model.addAttribute("viewData", listdata);
	 * 
	 * return new ResponseEntity<ListViewData>(listdata,
	 * HttpStatus.INTERNAL_SERVER_ERROR); }
	 * 
	 * @RequestMapping("/member/json/memberList2") public String memberList(Model
	 * model) {
	 * 
	 * RestTemplate restTemplate = new RestTemplate();
	 * 
	 * ListViewData listdata =
	 * restTemplate.getForObject("http://localhost:8080/mm/member/memberList.json",
	 * ListViewData.class);
	 * 
	 * 
	 * for(MemberInfo m : listdata.getMemberList()) { System.out.println(m); }
	 * 
	 * 
	 * model.addAttribute("viewData", listdata);
	 * 
	 * return "member/memberList"; }
	 */
}
