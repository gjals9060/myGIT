package com.clover.p5.place.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clover.p5.DTO.SearchPlaceDTO;
import com.clover.p5.entity.Place;
import com.clover.p5.member.service.MemberService;
import com.clover.p5.place.service.PlaceService;
import com.google.gson.Gson;


@Controller
public class PlaceController {
	
	@Autowired
	private PlaceService placeService;
	
	@ResponseBody
	@RequestMapping("/ajaxMap")
	public List<Place> ajaxMap(HttpServletRequest request, HttpServletResponse response, Model model) {
		
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
		
		SearchPlaceDTO dto = new SearchPlaceDTO(sStartDate, sEndDate, swLatitude, neLatitude, swLongitude, neLongitude, capacity);
		
		List<Place> placeList =  placeService.selectPlaceList(dto);
		
//		String result = new Gson().toJson(placeList);
		
		System.out.println("응답!");
//		System.out.println(result);
		return placeList;
		
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
		
		String name = placeService.selectPlace();
		
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
	
}
