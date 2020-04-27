package com.clover.p5.host.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.clover.p5.VO.HostParamVO;
import com.clover.p5.DTO.SearchHostDTO;
import com.clover.p5.entity.Host;
import com.clover.p5.host.mapper.HostMapper;

@Service
public class HostServiceImpl implements HostService {
	
	@Autowired
	private HostMapper hostMapper;
	
	
	@Override
	public String selectHost(HttpServletRequest request, Model model) {
		
		System.out.println("postPage 페이지 이동");
		
		String id = request.getParameter("id");
		System.out.println("호출된 id :" + id);

		Host host = hostMapper.selectHost(id);
		model.addAttribute("host", host);
		
		return "postPage";	
	}


	@Override
	public List<Host> selectHostList(HostParamVO vo) {
		
		System.out.println("ajaxHosts 요청!");	
		
		// 받아온 HostParamVO를 SearchHostDTO에 맞게 데이터셋
		String swLatlng = vo.getSwLatlng();
		String neLatlng = vo.getNeLatlng();
		int capacity = Integer.parseInt(vo.getCapacity());
		String sStartDate = vo.getStartDate();
		String sEndDate = vo.getEndDate();
				
		System.out.println("sw좌표" + swLatlng);
		swLatlng = swLatlng.substring(1, (swLatlng.length()-1));
		
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
		
		System.out.println("capacity : " + capacity);
		System.out.println("sStartDate : " + sStartDate);
		System.out.println("sEndDate : " + sEndDate);
		
		SearchHostDTO dto = new SearchHostDTO(sStartDate, sEndDate, swLatitude, neLatitude, swLongitude, neLongitude, capacity);
				
		return hostMapper.selectHostList(dto);
	}


	@Override
	public String reservationList(HttpServletRequest request, Model model) {

		System.out.println("reservationList 페이지 이동");
		
		String address = request.getParameter("address");
		String checkInDatecheckOutDate = request.getParameter("checkInDatecheckOutDate");
		String capacity = request.getParameter("capacity");

		
		String[] date = checkInDatecheckOutDate.split(" - ");
		String startDate = date[0];
		String endDate = date[1];
		
		System.out.println("키워드:" + address);
		System.out.println("날짜:" + checkInDatecheckOutDate);
		System.out.println("인원:" + capacity);
		System.out.println("시작날:" + startDate);
		System.out.println("끝날:" + endDate);
				
		model.addAttribute("address", address);
		model.addAttribute("checkInDatecheckOutDate", checkInDatecheckOutDate);
		model.addAttribute("capacity", capacity);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
				
		
		return "reservationList";
	}
	
	
}
