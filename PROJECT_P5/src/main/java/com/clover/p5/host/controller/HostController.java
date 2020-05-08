package com.clover.p5.host.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.clover.p5.host.dto.HostPhoto;
import com.clover.p5.host.service.HostService;

//@SessionAttributes("newHost")
@Controller
public class HostController {
	
	@Autowired
	private HostService hostService;

	
///////////////////////////// 호스트 등록 ////////////////////////////////
	
	/*@ModelAttribute("newHost")
	public NewHostDTO newHost(@SessionAttribute("user") Member user) {
		return new NewHostDTO(user.getId());
	}	
	@RequestMapping("/host/registration/roomType") // 등록 첫 페이지 - 단순 이동
	public void inputRoomType() {}
	
	 /////////////// 이때부터 세션에 정보를 저장 ////////////////
	@RequestMapping("/host/registration/roomCount") // 룸타입 저장
	public void inputRoomType(@ModelAttribute("newHost") NewHostDTO newHostDto) {
		System.out.println(newHostDto);
	}
	@RequestMapping("/host/registration/address") // 룸카운트 저장
	public void inputRoomCount(@ModelAttribute("newHost") NewHostDTO newHostDto) {
		System.out.println(newHostDto);
	}
	@RequestMapping("/host/registration/facilities") // 주소 저장
	public void inputAddress(@ModelAttribute("newHost") NewHostDTO newHostDto) {
		System.out.println(newHostDto);
	}
	@RequestMapping("/host/registration/photo") // 편의시설 저장
	public void inputFacilities(@ModelAttribute("newHost") NewHostDTO newHostDto) {
		System.out.println(newHostDto);
	}
	@RequestMapping("/host/registration/description") // 사진 저장
	public void inputPhoto(@ModelAttribute("newHost") NewHostDTO newHostDto) {
		System.out.println(newHostDto + "\n사진 " + newHostDto.getPhoto().size() + "개 넘어옴");
		for(int i = 0; i < newHostDto.getPhoto().size(); i++) {
			if(newHostDto.getPhoto().get(i).isEmpty()) {
				System.out.println(i+1+"번째 파일이 비었습니다.");
			}
		}
	}
	@RequestMapping("/host/registration/stayDate") // 설명 저장
	public void inputDescription(@ModelAttribute("newHost") NewHostDTO newHostDto) {
		System.out.println(newHostDto);
	}
	@RequestMapping("/host/registration/calendar") // 숙박일 저장
	public void inputStayDate(@ModelAttribute("newHost") NewHostDTO newHostDto) {
		System.out.println(newHostDto);
	}
	@RequestMapping("/host/registration/price") // 달력 저장
	public void inputCalendar(@ModelAttribute("newHost") NewHostDTO newHostDto) {
		System.out.println(newHostDto);
	}
	@RequestMapping("/host/registration/finish") // 가격 저장
	public void inputPrice
	(@ModelAttribute("newHost") NewHostDTO newHostDto, SessionStatus sessionStatus, HttpServletRequest request) {
		System.out.println(newHostDto);
		if(hostService.insertHost(newHostDto, request)) {
			sessionStatus.setComplete(); // 호스트 등록 세션 초기화
			System.out.println("호스트 등록 성공!");
		}
	}*/
	
	
	
//****************************** 호스트 사진 등록(수정) ******************************************	
	@RequestMapping("/ajax/getHostPhotoList") // 사진 목록 가져오기
	@ResponseBody
	public List<HostPhoto> getHostPhotoList(int hostId) {
		return hostService.getHostPhotoList(hostId);
	}
	
	@RequestMapping("/ajax/addHostPhoto") // 사진 추가
	@ResponseBody
	public boolean addHostPhoto(List<MultipartFile> photoFiles, HttpServletRequest req) {
		return hostService.insertHostPhoto(77, photoFiles, req);
	}
	
	@RequestMapping("/ajax/deleteHostPhoto") // 사진 삭제
	@ResponseBody
	public boolean deleteHostPhoto(int hostPhotoId) {
		return hostService.deleteHostPhoto(hostPhotoId);
	}
	
	@RequestMapping("/ajax/updateHostPhotoSort") // 사진 정렬 내용 적용
	@ResponseBody
	public int updateHostPhotoSort(int[] sortResult) {
		return hostService.updateHostPhotoSort(sortResult);
	}
	
	@RequestMapping("/ajax/changeCoverImage") // 대표 사진 변경하기
	@ResponseBody
	public int changeCoverImage(HttpServletRequest req) {
		return hostService.changeCoverImage(req);
	}
//****************************** 호스트 사진 등록(수정)-END ******************************************		
	
	
	
	
	
	
}
