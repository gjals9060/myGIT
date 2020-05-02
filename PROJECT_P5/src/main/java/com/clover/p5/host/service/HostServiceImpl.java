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
import com.clover.p5.host.dto.HostPhotoDTO;
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
		
		// 호스트 정보
		HostInfoDTO hostInfoDto = hostMapper.selectHost(id);
		
		// 호스트 사진 리스트
		List<HostPhotoDTO> hostPhotoDto = hostMapper.selectHostPhoto(id);
		System.out.println(hostPhotoDto.get(0).getPath());
//		
//		for(HostPhotoDTO dto : hostPhotoDto) {
//			String beforePath = dto.getPath();
//			System.out.println("전 : " + beforePath);
//			
//			String afterPath = beforePath.replace("\\", "/");	//java에서 특수문자' \ '은 ' \" ' 으로 쓰임
//			System.out.println("후 : " + afterPath);
//			dto.setPath(afterPath);
//		}
		
		model.addAttribute("host", hostInfoDto);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("capacity", capacity);
		
		model.addAttribute("hostPhoto", hostPhotoDto);
				
		return "postPage";	
	}


	@Override
	public List<HostInfoDTO> selectHostList(SearchInputDTO dto) {
		
		System.out.println("ajaxHosts 요청!");	
		
		// 받아온 HostParamVO를 SearchHostDTO에 맞게 데이터셋
		String swLatlng = dto.getSwLatlng();
		String neLatlng = dto.getNeLatlng();
		int capacity = Integer.parseInt(dto.getCapacity());
		String sStartDate = dto.getStartDate();
		String sEndDate = dto.getEndDate();
		
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
	public boolean insertHost(NewHostDTO newHostDto, HttpServletRequest request) {
		
	/***
	** 서버시간에 서울의 타임존을 적용한 DateTime을 얻는다.
	***/
		ZonedDateTime nowSeoul = ZonedDateTime.now(ZoneId.of("Asia/Seoul"));
		newHostDto.setCreationDate( // 필요한 형식으로 변경하여 세팅
			nowSeoul.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
																				);
	/***																	
	** 호스트를 등록한다.
	***/
		if(hostMapper.insertHost(newHostDto) == 1) { // 호스트 등록에 성공하면
			
			System.out.println("호스트 정보를 성공적으로 저장했습니다.");
			
			// 작성자 ID로 방금 DB에 등록된 호스트의 ID를 검색
			int hostId = hostMapper.selectNewHostId(newHostDto.getMemberId());
			// 서버와 DB에 저장할 사진파일 정보
			List<MultipartFile> photos = newHostDto.getPhoto();
			// DB에 저장할 예약 차단일 정보
			String blockingDate = newHostDto.getBlockingDate();
			
			
		/***
		** 저장할 사진 파일이 있으면 서버와 DB에 저장한다.
		***/
			if(photos.size() == 1 && photos.get(0).isEmpty()) { // 없으면
				
				System.out.println("업로드한 파일이 존재하지 않습니다.");
				
			} else { // 있으면 저장을 시도
				
				if(!insertHostPhoto(hostId, photos, request)) { // 문제 발생 시에만
					return false;
				}
				
			}
			
		/***		계속해서..
		** 등록할 예약불가 날짜가 있으면 DB에 저장한다.
		***/
			if(blockingDate.isEmpty()) { // 없으면
				
				System.out.println("등록할 예약불가 날짜가 없습니다.");
				return true; // 호스트 등록을 마침.
				
			} else { // 있으면 저장을 시도
				
				return insertBlocking(hostId, blockingDate);
				// 결과 반환으로 호스트 등록을 마침.
			}
			
		} // if(호스트 등록 성공)-END
		
		System.out.println("호스트 등록 실패");
		return false;
	}
	
	/////////////////////// start - 이미지 업로드 수정 by 허민
	@Override
	public boolean insertHostPhoto(int hostId, List<MultipartFile> photos, HttpServletRequest request) {
		
	  String defaultPath = request.getServletContext().getRealPath("/");

      //파일 기본경로 _ 상세경로
      String path = defaultPath + "resources" + File.separator + "upload" + File.separator + "host" + File.separator;
      	
	/**
	** 파일을 저장할 폴더가 존재하지 않을 경우 폴더를 생성해준다.
	**/
		File folder = new File(path);
        if(!folder.exists()) { // 존재하지 않으면
            if(folder.mkdirs()) { // 폴더를 생성하고 결과를 출력
            	System.out.println("host 폴더를 생성했습니다.");
            }
        }
        
    /**
    ** 서버에 파일을 저장하고 DB에 파일 정보 및 경로를 저장한다.
    **/
    	for(MultipartFile photo : photos) {
    		
    		// 원본 파일명
    		String originalName = photo.getOriginalFilename();
    		// 파일 크기
    		long fileSize = photo.getSize();
    		// 파일 확장자
    		String fileExtension =
				originalName.substring(originalName.lastIndexOf("."));
    		
    		// 저장 파일명을 생성
    		ZonedDateTime nowSeoul = ZonedDateTime.now(ZoneId.of("Asia/Seoul"));
    		String saveName = (
				nowSeoul.format(DateTimeFormatter.ofPattern("yyMMdd_HHmmssSSS_")) +
				UUID.randomUUID() + fileExtension		).replace("-", "");
    		
    		// 서버에 저장될 최종 path
    		String serverPath = path + saveName;
    		
    		// DB에 저장될 최종 path
    		String savePath = request.getContextPath() + "/upload/host/" + saveName;
    		System.out.println("이미지 경로 : " + savePath);
    		
		/***
		 ** 서버에 파일 저장
		 ***/
    		File file = new File(serverPath);
    		try {
				photo.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				System.out.println("업로드 파일을 서버에 저장 중에 오류 발생");
				return false;
			}
    		
    		
		/***
		** DB에 파일 정보 저장
		***/
    		if(hostMapper.insertHostPhoto
    				(hostId, originalName, fileSize, savePath) != 1) {
    			System.out.println("업로드 파일을 DB에 저장 중에 오류 발생");
    			return false;
    		}
    		
    	} // for-END
    	
    	System.out.println
    		(photos.size() + "개의 업로드 파일을 성공적으로 서버와 DB에 저장했습니다.");
	    return true; // 문제 없이 모든 수행이 끝났으면 true를 반환.
	}
	/////////////////////// end - 이미지 업로드 수정 by 허민
	
	
//	@Override
//	public boolean insertHostPhoto(int hostId, List<MultipartFile> photos) {
//		
//		// 파일을 저장할 폴더의 경로(Windows 기반)
//		String folderPath = "\\p5\\upload\\host";
//		
//	/**
//	** 파일을 저장할 폴더가 존재하지 않을 경우 폴더를 생성해준다.
//	**/
//		File folder = new File(folderPath);
//        if(!folder.exists()) { // 존재하지 않으면
//            if(folder.mkdirs()) { // 폴더를 생성하고 결과를 출력
//            	System.out.println("host 폴더를 생성했습니다.");
//            }
//        }
//        
//    /**
//    ** 서버에 파일을 저장하고 DB에 파일 정보 및 경로를 저장한다.
//    **/
//    	for(MultipartFile photo : photos) {
//    		
//    		// 원본 파일명
//    		String originalName = photo.getOriginalFilename();
//    		// 파일 크기
//    		long fileSize = photo.getSize();
//    		// 파일 확장자
//    		String fileExtension =
//				originalName.substring(originalName.lastIndexOf("."));
//    		
//    		// 저장 파일명을 생성
//    		ZonedDateTime nowSeoul = ZonedDateTime.now(ZoneId.of("Asia/Seoul"));
//    		String saveName = (
//				nowSeoul.format(DateTimeFormatter.ofPattern("yyMMdd_HHmmssSSS_")) +
//				UUID.randomUUID() + fileExtension		).replace("-", "");
//    		
//    		// DB에 저장될 최종 path
//    		String savePath = folderPath + "\\" + saveName;
//    		
//    		
//		/***
//		 ** 서버에 파일 저장
//		 ***/
//    		File file = new File(savePath);
//    		try {
//				photo.transferTo(file);
//			} catch (IllegalStateException | IOException e) {
//				e.printStackTrace();
//				System.out.println("업로드 파일을 서버에 저장 중에 오류 발생");
//				return false;
//			}
//    		
//    		
//		/***
//		** DB에 파일 정보 저장
//		***/
//    		if(hostMapper.insertHostPhoto
//    				(hostId, originalName, fileSize, savePath) != 1) {
//    			System.out.println("업로드 파일을 DB에 저장 중에 오류 발생");
//    			return false;
//    		}
//    		
//    	} // for-END
//    	
//    	System.out.println
//    		(photos.size() + "개의 업로드 파일을 성공적으로 서버와 DB에 저장했습니다.");
//	    return true; // 문제 없이 모든 수행이 끝났으면 true를 반환.
//	}

	
	
	@Override
	public boolean insertBlocking(int hostId, String blockingDate) {
		// 날짜를 배열에 담는다
		String[] arrBlockingDate = blockingDate.split(",");
		
		// DB에 입력
		int result = hostMapper.insertBlocking(hostId, arrBlockingDate);
		
		// 입력에 문제가 없으면
		if(arrBlockingDate.length == result) {
			System.out.println(
				hostId + "번 호스트 - " + result + "건의 예약 차단일을 입력했습니다."
			);
			return true;
		}
		
		System.out.println("예약 차단일 저장 중에 오류 발생");
		return false;
	}

	
	
}
