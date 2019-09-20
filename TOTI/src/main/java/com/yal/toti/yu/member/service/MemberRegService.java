package com.yal.toti.yu.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.yu.member.dao.MemberDaoInterface;
import com.yal.toti.yu.member.domain.MemberInfo;
import com.yal.toti.yu.member.domain.RequestMemberRegist;

@Service(value = "registService") // 이름안쓰면 memberRegService
public class MemberRegService  {

	@Autowired
	MailSenderService mailService;
	
	// 자동 메퍼를 위한 sqlSessionTemplate 객체 주입
	@Autowired
	private SqlSessionTemplate template;
		
	//@Autowired
	//private MemberDao dao;
		
	//@Autowired
	//private MemberJdbcTemplateDao dao;
		
	// 자동 메퍼를 이용해서 생성할 dao 
	private MemberDaoInterface dao;
	
	
	
	public int memberInsert(
			RequestMemberRegist regist) {
		/*
		 * , // 절대경로 겟~컨텍스트 위해서 받아옴 HttpServletRequest request
		*/	// 사용자가 입력한 거 
		// SqlSessionTemplate getMapper 를 이용해 dao 생성
		dao = template.getMapper(MemberDaoInterface.class);
		
		// 서버 경로
		/*
		 * String path = "/uploadfile/userphoto"; // 리소스 매핑 필요 // 절대 경로 String dir =
		 * request.getSession().getServletContext().getRealPath(path);
		 */
		MemberInfo memberInfo = regist.toMemberInfo();
		
		
		
		int cnt=0;

		if(memberInfo != null) {
			memberInfo.setM_photo("no_img.jpg");
			cnt = dao.insertMember(memberInfo);
			mailService.send(memberInfo.getM_id(), memberInfo.getM_email(),memberInfo.getM_name(), memberInfo.getM_code());
		}
		return cnt;
	}
	
	
	public String idCheck(String m_id) {
		
		// SqlSessionTemplate getMapper 를 이용해 dao 생성
		dao = template.getMapper(MemberDaoInterface.class);
		
		String chk = dao.selectMemberById(m_id)==null ? "Y" : "N";
		return chk;
	}
	
	public String emailCheck(String m_email) {
		
		// SqlSessionTemplate getMapper 를 이용해 dao 생성
		dao = template.getMapper(MemberDaoInterface.class);
		
		String chk = dao.selectMemberByEmail(m_email)==null?"Y":"N";
		return chk;
	}
	
//	String newFileName = "";
	/*try {
		if(regist.getM_photo()!=null) {
			//새로운 파일 이름 생성
			//String newFileName = memberInfo.getuId()+System.nanoTime(); //이래도 되고
			newFileName = memberInfo.getM_id()+"_"+regist.getM_photo().getOriginalFilename();//이렇게 만들어봄
			
			// 파일을 서버의 지정경로에 저장 (있으면 덮어쓰기 해준다)
			regist.getM_photo().transferTo(new File(dir,newFileName)); // 서버에는 썼으나 디비에 넣기 실패한 경우 지워주는 처리가 필요함. 안그럼 쓰레기 데이터가 계속 서버에.. 보통 매치해서 스케쥴러? 정기적으로 스케줄러 하는 경우도 있다. 어노테이션으로 간편하게? 스케쥴러 이용하면 특정시간 쿠폰뿌리기 등도 가능
			// (파일 실패하면 디비 인설트도 하면 안 되니까 디비처리도 이쪽에 해줘야)
			// 데이터베이스 저장을 하기 위한 파일이름 set
			memberInfo.setM_photo(newFileName);
		}
		resultCnt = dao.insertMember(memberInfo);
	
		// 축하 메일 발송
		//mailService.send(memberInfo.getm_id());
		
		// 축하 겸 인증 메일 발송 
		mailService.send(memberInfo.getM_email(), memberInfo.getM_code());
		
	} catch (IllegalStateException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (Exception e) {
		System.out.println("오류!!!");
		e.printStackTrace();
		if(regist.getM_photo()!= null) {
			new File(dir,newFileName).delete();
		}
	}
	System.out.println(resultCnt);
	return resultCnt;
}*/
	
	
}
