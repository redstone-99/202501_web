package com.example.spring02.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.spring02.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class SendController {
	/*
	 * 	컨트롤러 메소드 안에서 HttpServletRequest , HttpServletResponse , HttpSession 등의 객체가 필요하면
	 * 	매개변수에 선언하면 된다.
	 * 
	 * 	선언만 하면 spring 프레임워크가 알아서 해당객체의 참조값을 매개변수에 전달해준다.
	 */
	
	@ResponseBody //이게 있으면 컨트롤러 메소드에서 클라이언트로 바로 보낸다.. 없으면 view 페이지에 응답해야한다..
	@PostMapping("/send")
	public String send(HttpServletRequest request) {
		//요청 파라미터 추출!
		String msg = request.getParameter("msg");
		//콘솔창에 출력하기
		System.out.println(msg);
		return "/send okay!";	
	}
	
	//전송되는 파라미터명과 동일하게 매개 변수를 선언하면 자동으로 추출되어서 매개 변수에 전달된다.
	//<input type="text" name="msg" />
	@ResponseBody
	@PostMapping("/send2")
	public String send2(String msg) {
		System.out.println(msg);
		return "/send2 okay!";
	}
	
	@ResponseBody
	@PostMapping("/send3")
	public String send3(int num, String name, String addr) {
		System.out.println(num + " | " + name + " | " + addr);
		return "/send3 okay!";
	}
	/*
	 *  매개 변수에 dto 를 선언하면 추출된 요청 파라미터가 dto 객체에 담겨서 전달된다.
	 */
	@ResponseBody
	@PostMapping("/send4")
	public String send4(MemberDto dto) {
		System.out.printf("%d | %s | %s", dto.getNum(), dto.getName(), dto.getAddr());
		return "/send4 okay!";
	}
}
