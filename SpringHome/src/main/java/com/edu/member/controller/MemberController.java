package com.edu.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.member.dto.MemberDto;
import com.edu.member.service.MemberService;
import com.edu.util.Paging;

@Controller
public class MemberController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	
	// 로그인 화면으로 이동
	@RequestMapping(value = "/auth/login.do", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		log.info("Welcome MemberController login!");
		
		return "auth/LoginForm";
	}
	// 로그인 버튼 클릭시
	@RequestMapping(value = "/auth/loginCtr.do", method = RequestMethod.POST)
	public String login(String email, String password
			, HttpSession session, Model model) {
		log.info("Welcome MemberController loginCtr! " + email + ", " + password);
		
		MemberDto memberDto = memberService.memberExist(email, password);
		
		String viewUrl = "";
		if (memberDto != null) {
//			회원이 존재하면 세션에 담는다
			session.setAttribute("member", memberDto);
			
			viewUrl = "redirect:/member/list.do";
		}else {
			viewUrl = "/auth/LoginFail";
		}
		
		return viewUrl;
	}
	
	//로그아웃
	@RequestMapping(value = "/auth/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		log.info("Welcome MemberController logout!");
		
		session.invalidate();
		
		return "redirect:/auth/login.do";
	}
	
	@RequestMapping(value = "/member/listOne.do", method = RequestMethod.GET)
	public String memberListOne(int no, Model model) {
		log.debug("Welcome MemberController memberlistOne! - {}", no);
		
		Map<String, Object> map = memberService.memberSelectOne(no);
		
		MemberDto memberDto = (MemberDto)map.get("memberDto");
		List<Map<String, Object>> fileList
			= (List<Map<String, Object>>) map.get("fileList");
		
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("fileList", fileList);
		
		return "member/MemberListOneView";
	}
	//회원 목록 출력
	@RequestMapping(value = "/member/list.do", 
			method = {RequestMethod.GET, RequestMethod.POST})
	public String memberList(@RequestParam(defaultValue = "1") int curPage, Model model) {
		// Log4j
		log.info("Welcome MemberController list!: {}", curPage);
		
		int totalCount = memberService.memberSelectTotalCount();
		
		Paging memberPaging = new Paging(totalCount, curPage);
		
		int start = memberPaging.getPageBegin();
		int end = memberPaging.getPageEnd();
		
		List<MemberDto> memberList 
			= memberService.memberSelectList(start, end);
		HashMap<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("memberPaging",memberPaging);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("pagingMap", pagingMap);
		
		return "member/MemberListView";
	}
	
	@RequestMapping(value= "/member/add.do", method = RequestMethod.GET)
	public String memberAdd(Model model) {
		log.info("Welcome MemberController MemberAdd");
		
		return "member/MemberForm";
	}
	//회원 추가
	@RequestMapping(value= "/member/addCtr.do", method = RequestMethod.POST)
	public String memberAdd(MemberDto memberDto, MultipartHttpServletRequest mulRequest
			, Model model) {
		log.debug("Welcome MemberController MemberAdd" + memberDto);
		
		try {
			memberService.memberInsertOne(memberDto , mulRequest);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("오류 처리할거 있음 한다.");
			e.printStackTrace();
		}
				
//		int resultNum = memberService.memberInsertOne(memberDto);
		
//		System.out.println("추가된 회원 데이터 수" + resultNum);		
		return "redirect:/member/list.do";
	}
	
	
	
	 //  일반 .do는 단순 페이지 이동
	 @RequestMapping(value = "/member/update.do", method = RequestMethod.GET)
	 public String memberUpdate(int no, Model model) {
	     log.info("Welcome MemberController memberUpdate!" + no);
	     
	     Map<String, Object> map = memberService.memberSelectOne(no);
	     
	     MemberDto memberDto = (MemberDto)map.get("memberDto");
	     
	     List<Map<String, Object>> fileList 
	     	= (List<Map<String, Object>>)map.get("fileList");
	     
	     model.addAttribute("memberDto", memberDto);
	     model.addAttribute("fileList", fileList);
	     
	     return "member/MemberUpdateForm";
	 }
	
	@RequestMapping(value = "/member/updateCtr.do", method = RequestMethod.POST)
	public String memberUpdateCtr(MemberDto memberDto
			, @RequestParam(value = "fileIdx", defaultValue = "-1") int fileIdx
			, MultipartHttpServletRequest mulRequest
			, Model model) {
		log.info("Welcome MemberController memberupdateCtr! memberDto: {} \n fileIdx: {}"
			, memberDto, fileIdx);
		
		int resultNum = 0;
		
		try {
			resultNum = memberService.memberUpdateOne(memberDto, mulRequest, fileIdx);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
//		
		
		return "common/SuccessPage";
	}
	
	@RequestMapping(value = "/member/delete.do", method = RequestMethod.GET)
	public String memberDelete(int no) {
		log.info("Welcome MemberController memberDelete" + no);
		
		memberService.memberDeleteOne(no);
		
		return "redirect:/member/list.do";
	}
	
}
