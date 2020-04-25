package com.clover.p5.host.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.clover.p5.DTO.SearchHostDTO;
import com.clover.p5.entity.Host;
import com.clover.p5.host.service.HostService;

@SessionAttributes("newHost")
@Controller
public class HostController {
	
	@Autowired
	private HostService hostService;
	
	@ResponseBody
	@RequestMapping("/ajaxMap")
	public List<Host> ajaxMap(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		System.out.println("리스트 AJAXMAP 요청");
		
		String swLatlng = request.getParameter("swLatlng");
		System.out.println("sw좌표" + swLatlng);
		swLatlng = swLatlng.substring(1, (swLatlng.length()-1));
		
		String neLatlng = request.getParameter("neLatlng");
		System.out.println("ne좌표" + neLatlng);
		neLatlng = neLatlng.substring(1, (neLatlng.length()-1));

		String[] swLatlngStr =  swLatlng.split(", ");
		String[] neLatlngStr =  neLatlng.split(", ");
		
		System.out.println(swLatlngStr[0]);	//남서 위도
		double swLatitude = Double.parseDouble(swLatlngStr[0]);
		System.out.println(swLatlngStr[1]);	//남서 경도
		double swLongitude = Double.parseDouble(swLatlngStr[1]);

		System.out.println(neLatlngStr[0]);	//북동 위도
		double neLatitude = Double.parseDouble(neLatlngStr[0]);
		System.out.println(neLatlngStr[1]);	//북동 경도
		double neLongitude = Double.parseDouble(neLatlngStr[1]);
		
		int capacity = Integer.parseInt(request.getParameter("personnel"));
		System.out.println("capacity : " + capacity);
		String sStartDate = request.getParameter("startDate");
		String sEndDate = request.getParameter("endDate");
		System.out.println("sStartDate : " + sStartDate);
		System.out.println("sEndDate : " + sEndDate);
		
		SearchHostDTO dto = new SearchHostDTO(sStartDate, sEndDate, swLatitude, neLatitude, swLongitude, neLongitude, capacity);
		
		List<Host> HostList =  hostService.selectHostList(dto);
		
//		String result = new Gson().toJson(HostList);
		
		System.out.println("응답!");
//		System.out.println(result);
		return HostList;
		
		// ajax로 전송부
//		response.setContentType("application/json; charset=utf-8");
//		PrintWriter pw = null;
//		
//		try {
//			pw = response.getWriter();
//			pw.write(result);
//			pw.flush();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			if(pw != null) pw.close();
//		}


			

		
	}
	
/*	
	@RequestMapping("/reservation0")
	public String reservation0(HttpServletRequest request, Model model) {
		
		String name = HostService.selectHost();
		
		if(name != null) {
			model.addAttribute("name", name);
		}
		
		return "reservation0";
	}
*/
	
	
	
	@RequestMapping("/reservation1")
	public String reservation1(HttpServletRequest request, Model model) {
		
		System.out.println("reservation1 이동");
		
		String address = request.getParameter("address");
		
		String checkInDatecheckOutDate = request.getParameter("checkInDatecheckOutDate");
		
		String personnel = request.getParameter("personnel");

		
		String[] date = checkInDatecheckOutDate.split(" - ");
		String startDate = date[0];
		String endDate = date[1];
		
		System.out.println("키워드:" + address);
		System.out.println("날짜:" + checkInDatecheckOutDate);
		System.out.println("인원:" + personnel);
		
		System.out.println("시작날:" + startDate);
		System.out.println("끝날:" + endDate);
		
		model.addAttribute("address", address);
		model.addAttribute("checkInDatecheckOutDate", checkInDatecheckOutDate);
		model.addAttribute("personnel", personnel);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		return "reservation1";
		
	}
	
	@RequestMapping("/reservation2")
	public String reservation() {
		
		System.out.println("");
		
		return "reservation2";
		
	}
	
	
	
	
	
	
	
	
	
	
	
///////////////////////////// 호스트 등록 ////////////////////////////////	
	@ModelAttribute("newHost")
	public Host newHost() {
		return new Host();
	}
	@RequestMapping("/host/registration/roomType") // 등록 첫 페이지 - 단순 이동
	public void inputRoomType() {}
	
	 /////////////// 이때부터 세션에 정보를 저장 ////////////////
	@RequestMapping("/host/registration/roomCount") // 룸타입 저장
	public void inputRoomType(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	@RequestMapping("/host/registration/address") // 룸카운트 저장
	public void inputRoomCount(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	@RequestMapping("/host/registration/facilities") // 주소 저장
	public void inputAddress(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	@RequestMapping("/host/registration/photo") // 편의시설 저장
	public void inputFacilities(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	@RequestMapping("/host/registration/description") // 사진 저장
	public void inputPhoto(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	@RequestMapping("/host/registration/stayDate") // 설명 저장
	public void inputDescription(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	@RequestMapping("/host/registration/calendar") // 숙박일 저장
	public void inputStayDate(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	@RequestMapping("/host/registration/price") // 달력 저장
	public void inputCalendar(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	@RequestMapping("/host/registration/finish") // 가격 저장
	public void inputPrice(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	
	
	
	
	
	
	
	
	
	
}
