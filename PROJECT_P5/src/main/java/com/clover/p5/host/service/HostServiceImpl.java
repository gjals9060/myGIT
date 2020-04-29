package com.clover.p5.host.service;

import java.io.File;
import java.io.IOException;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.clover.p5.entity.NewHostDTO;
import com.clover.p5.host.dto.HostInfoDTO;
import com.clover.p5.host.dto.SearchHostDTO;
import com.clover.p5.host.dto.SearchInputDTO;
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
		
		String startDate = request.getParameter("startDate");
		System.out.println("호출된 startDate : " + startDate);
		
		String endDate = request.getParameter("endDate");
		System.out.println("호출된 endDate : " + endDate);
		
		
		
		String capacity = request.getParameter("capacity");
		System.out.println("호출된 capacity : " + capacity);
				
		HostInfoDTO hostInfoDto = hostMapper.selectHost(id);
		
		model.addAttribute("host", hostInfoDto);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("capacity", capacity);
		
		return "postPage";	
	}


	@Override
	public List<HostInfoDTO> selectHostList(SearchInputDTO vo) {
		
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
		
		SearchHostDTO searchHostDto = new SearchHostDTO(sStartDate, sEndDate, swLatitude, neLatitude, swLongitude, neLongitude, capacity);
				
		return hostMapper.selectHostList(searchHostDto);
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


	@Override
	public String reservationPurchase(HttpServletRequest request, Model model) {

		System.out.println("reservationPurchase 페이지 이동");

		String checkInDatecheckOutDate = request.getParameter("checkInDatecheckOutDate");
		String personnel = request.getParameter("personnel");
		String hostId = request.getParameter("hostId");
		String memberId = request.getParameter("userId");
		String hostName = request.getParameter("hostName");
		int hostPrice = Integer.parseInt(request.getParameter("hostPrice"));
		int dateCount = Integer.parseInt(request.getParameter("dateCnt"));
		
		String[] date = checkInDatecheckOutDate.split(" - ");
		String checkInDate = date[0];
		String checkOutDate = date[1];
				
		int payment = dateCount * hostPrice;
		
		System.out.println("날짜 : " + checkInDatecheckOutDate);
		System.out.println("인원 : " + personnel);
		System.out.println("호스트 id : " + hostId);
		System.out.println("유저 id : " + memberId);
		System.out.println("체크인 : " + checkInDate);
		System.out.println("체크아웃 : " + checkOutDate);
		System.out.println("호스트 1박 금액 : " + hostPrice);
		System.out.println("호스트 이름 : " + hostName);
		System.out.println("결제 금액 : " + payment);
		
		model.addAttribute("personnel", personnel);
		model.addAttribute("memberId", memberId);
		model.addAttribute("checkInDatecheckOutDate", checkInDatecheckOutDate);
		model.addAttribute("checkInDate", checkInDate);
		model.addAttribute("checkOutDate", checkOutDate);
		model.addAttribute("hostPrice", hostPrice);
		model.addAttribute("dateCount", dateCount);
		model.addAttribute("hostName", hostName);
		model.addAttribute("payment", payment);
		
		
		return "reservationPurchase";
	}
	
	
	//////////// 아래부터 by 근형
	
	@Transactional
	@Override
	public boolean insertHost(NewHostDTO newHostDto) {
		// 서버시간에 서울의 타임존을 적용한 DateTime을 얻는다
		ZonedDateTime nowSeoul = ZonedDateTime.now(ZoneId.of("Asia/Seoul"));
		newHostDto.setCreationDate( // 필요한 형식으로 변경하여 세팅
				nowSeoul.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
		);
		if(hostMapper.insertHost(newHostDto) == 1) { // 호스트 등록 성공했으면
			
			List<MultipartFile> photos = newHostDto.getPhoto();
			if(photos.size() == 1 && photos.get(0).isEmpty()) {
				System.out.println("업로드한 파일이 존재하지 않는다.");
			} else {
				if(storePhoto("host", photos)) { // 서버에 잘 저장했으면
					System.out.println(photos.size() + "개의 사진 입력하겠음.");
					// insertHostPhoto
				}
			}
			
			
			String blockingDate = newHostDto.getBlockingDate();
			if(blockingDate.isEmpty()) { // 등록할 예약불가 날짜가 없으면
				System.out.println("등록할 예약불가 날짜가 없습니다.");
				return true; // 호스트 등록 결과를 바로 반환
			} else { // 등록할 예약불가 날짜가 있으면
				int memberId = newHostDto.getMemberId();
				if(insertBlocking(memberId, blockingDate) == 0) { //입력할 게 있는데 못했으면
					System.out.println("차단일 입력 중에 오류..");
					return false;
				}
			}
			return true; // 등록 성공 결과를 반환
		}
		return false;
	}
	
	
	@Override
	public boolean storePhoto(String lastFolderName, List<MultipartFile> photos) {
		// 파일을 저장할 폴더의 경로(Windows 기반)
		String folderPath = "\\p5\\upload\\" + lastFolderName; // host or profile
		
        ///////// 파일을 저장할 폴더가 존재하지 않을 경우 폴더를 생성. //////
		File folder = new File(folderPath);
        if(!folder.exists()) {
            if(folder.mkdirs()) { // 정상적으로 생성하면
            	System.out.println(lastFolderName + "폴더를 생성했습니다.");
            }
        }//////////////////////////////////////////////////////
        
        String originalFileName = null;
        try {
	    	for(MultipartFile photo : photos) {

	    		originalFileName = photo.getOriginalFilename(); // 파일명 추출
	    		String fileExtension = // 파일명 중 확장자만 추출  
	    				originalFileName.substring(originalFileName.lastIndexOf("."));
	    		
	    		ZonedDateTime nowSeoul = ZonedDateTime.now(ZoneId.of("Asia/Seoul"));
	    		String saveFileName = (
	    				
	    				nowSeoul.format(DateTimeFormatter.ofPattern("yyMMdd_HHmmssSSS_")) +
	    				UUID.randomUUID() + fileExtension
	    														).replace("-", "");
	    		String saveFilePath = folderPath + "\\" + saveFileName;
	    		System.out.println(saveFilePath); // DB에 저장할 실제 파일 저장 경로
	    		
	    		File file = new File(saveFilePath);
	    		
					photo.transferTo(file); // 파일 저장
	    	}
    	} catch (IllegalStateException | IOException e) {
    		e.printStackTrace();
    		System.out.println("파일 저장 중에 오류 발생 - " + originalFileName);
    		return false;
    	}
		return true;
	}

	@Transactional
	@Override
	public int insertBlocking(int memberId, String blockingDate) {
		// 작성자 ID를 받아서 방금 DB에 넣은 호스트의 ID를 검색하고
		int hostId = hostMapper.selectNewHostId(memberId);
		// 날짜를 배열에 담는다
		String[] arrBlockingDate = blockingDate.split(",");
		// 출력도 해보고
		for(int i = 0; i < arrBlockingDate.length; i++) {
			System.out.println(arrBlockingDate[i]);
		}
		int result = hostMapper.insertBlocking(hostId, arrBlockingDate);
		System.out.println(
			hostId + "번 호스트 - " + result + "건의 차단일 입력.");
		return result;
	}

	
	
}
