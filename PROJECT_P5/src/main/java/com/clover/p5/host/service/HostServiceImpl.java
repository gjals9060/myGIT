package com.clover.p5.host.service;

import java.io.File;
import java.io.IOException;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.clover.p5.host.dto.HostPhoto;
import com.clover.p5.host.dto.HostPhotoVO;
import com.clover.p5.host.dto.NewHostDTO;
import com.clover.p5.host.mapper.HostMapper;

@Service
public class HostServiceImpl implements HostService {

	
	@Autowired
	private HostMapper hostMapper;
	
	
	
	
	
//********************************** 호스트 사진 검색(출력용) ***********************************************
	@Override
	public List<HostPhoto> getHostPhotoList(int hostId) {
		List<HostPhoto> list = hostMapper.selectHostPhotoList(hostId);
		System.out.println(hostId + "번 호스트 사진 - " + list.size() + "개");
		
		return list;
	}
//********************************** 호스트 사진 검색(출력용)-END ***********************************************
	
	

//********************************** 호스트 사진 등록 ***********************************************
	@Override
	public boolean insertHostPhoto(int hostId, List<MultipartFile> photos, HttpServletRequest request) {
		
	  String defaultPath = request.getServletContext().getRealPath("/");
	  
      //파일 기본경로 _ 상세경로
      String folderPath = defaultPath + "resources" + File.separator + "upload" + File.separator + "host" + File.separator;
      System.out.println("저장 경로 : " + folderPath);
      
	/**
	** 파일을 저장할 폴더가 존재하지 않을 경우 폴더를 생성해준다.
	**/
		File folder = new File(folderPath);
        if(!folder.exists()) { // 존재하지 않으면
            if(folder.mkdirs()) { // 폴더를 생성하고 결과를 출력
            	System.out.println("폴더 생성 완료 : " + folderPath);
            }
        }
        
    /**
    ** 서버에 파일을 저장하고 DB에 저장할 정보를 생성.
    **/
        List<HostPhotoVO> photoList = new ArrayList<>();
        
        int sortOrder = 0;
        if(hostMapper.selectHostPhotoCount(hostId) != 0) {
        	sortOrder = hostMapper.selectHostPhotoSortOrderMax(hostId);
        }
        
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
    		
    		// 서버에 저장될 실제 '저장' 경로
    		String savePath = folderPath + saveName;
    		
    		// DB에 저장될 최종 path
    		String path = request.getContextPath() + "/upload/host/" + saveName;
    		System.out.println("이미지 경로 : " + path);
    		
    		sortOrder++;
    		
		/***
		 ** 서버에 파일 저장
		 ***/
    		File file = new File(savePath);
    		try {
				photo.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				System.out.println("업로드 파일을 서버에 저장 중에 오류 발생");
				return false;
			}
    		
    		photoList.add(new HostPhotoVO(hostId, originalName, fileSize, path, sortOrder));
    	} // for-END
    	
    	
    	/***
		** DB에 파일 정보 저장
		***/
    		int insertResult = hostMapper.insertHostPhoto(photoList);
    		if(insertResult != photoList.size()) {
    			System.out.println("업로드 파일을 DB에 저장 중에 오류 발생");
    			return false;
    		}
    		
    	System.out.println
    		(insertResult + "개의 업로드 파일을 성공적으로 서버와 DB에 저장했습니다.");
	    return true; // 문제 없이 모든 수행이 끝났으면 true를 반환.
	}
//********************************** 호스트 사진 등록-END ***********************************************	



//********************************** 호스트 사진 삭제 ***********************************************
	@Override
	public boolean deleteHostPhoto(int hostPhotoId) {
		if(hostMapper.deleteHostPhoto(hostPhotoId) == 1) {
			System.out.println(hostPhotoId + "번 사진 삭제 성공");
			
			return true; // 삭제 성공
		}
		return false; // 삭제 실패
	}
//********************************** 호스트 사진 삭제-END ***********************************************
	
	
//********************************** 호스트 사진 정렬 결과 저장 ***********************************************
	@Override
	public int updateHostPhotoSort(int[] sortResult) {
		return hostMapper.updateHostPhotoSort(sortResult);
	}
//********************************** 호스트 사진 정렬 결과 저장-END ***********************************************
	
	
//**************************** 대표 사진 변경 *****************************************
	@Override
	public boolean changeCoverImage(HttpServletRequest req) {
		int choiceId = Integer.parseInt(req.getParameter("choiceId"));
		int coverId = Integer.parseInt(req.getParameter("coverId"));
		int choiceOrder = Integer.parseInt(req.getParameter("choiceOrder"));
		
		if(hostMapper.updateHostPhoto(coverId, choiceOrder) != 1) {
			System.out.println("대표 사진 변경 사전 작업 중에 오류 발생");
			return false;
		}
		if(hostMapper.updateHostPhoto(choiceId, 1) != 1) {
			System.out.println("대표 사진 변경 중에 오류 발생");
			return false;
		}
		System.out.println(coverId + " -> " + choiceId + "번 사진으로 대표사진 변경 완료.");
		return true;
	}
//**************************** 대표 사진 변경-END ***************************************	


	
	
	
	
	
	
	
	

	@Override
	public int completeStep1(NewHostDTO newHost) {
		if(hostMapper.insertHost(newHost) == 1) {
			System.out.println("newHost를 DB에 저장했습니다.");
				// 작성자 ID로 방금 DB에 등록된 호스트의 ID를 검색
			return hostMapper.selectNewHostId(newHost.getMemberId());
		}
		System.out.println("newHost를 DB에 저장 실패했습니다.");
		return 0;
	}
	
	
	
	/*@Override
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
	}*/





	
	
	
	
	/*@Transactional
	@Override
	public boolean insertHost(NewHostDTO newHostDto, HttpServletRequest request) {
		
	*//***
	** 서버시간에 서울의 타임존을 적용한 DateTime을 얻는다.
	***//*
		ZonedDateTime nowSeoul = ZonedDateTime.now(ZoneId.of("Asia/Seoul"));
		newHostDto.setCreationDate( // 필요한 형식으로 변경하여 세팅
			nowSeoul.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
																				);
	*//***																	
	** 호스트를 등록한다.
	***//*
		if(hostMapper.insertHost(newHostDto) == 1) { // 호스트 등록에 성공하면
			
			System.out.println("호스트 정보를 성공적으로 저장했습니다.");
			
			// 작성자 ID로 방금 DB에 등록된 호스트의 ID를 검색
			int hostId = hostMapper.selectNewHostId(newHostDto.getMemberId());
			// 서버와 DB에 저장할 사진파일 정보
			List<MultipartFile> photos = newHostDto.getPhoto();
			// DB에 저장할 예약 차단일 정보
			String blockingDate = newHostDto.getBlockingDate();
			
		*//***
		** 저장할 사진 파일이 있으면 서버와 DB에 저장한다.
		***//*
			if(photos.size() == 1 && photos.get(0).isEmpty()) { // 없으면
				
				System.out.println("업로드한 파일이 존재하지 않습니다.");
				
			} else { // 있으면 저장을 시도
				
				if(!insertHostPhoto(hostId, photos, request)) { // 문제 발생 시에만
					return false;
				}
				
			}
			
		*//***		계속해서..
		** 등록할 예약불가 날짜가 있으면 DB에 저장한다.
		***//*
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
	*/
	
	
	
}
