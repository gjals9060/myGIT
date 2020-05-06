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
import org.springframework.web.multipart.MultipartFile;

import com.clover.p5.host.dto.NewHostDTO;
import com.clover.p5.host.mapper.HostMapper;

@Service
public class HostServiceImpl implements HostService {

	
	@Autowired
	private HostMapper hostMapper;
	
	
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
      System.out.println(path);
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
