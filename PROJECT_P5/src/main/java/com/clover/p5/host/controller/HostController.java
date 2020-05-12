package com.clover.p5.host.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.clover.p5.host.dto.HostPhoto;
import com.clover.p5.host.service.HostService;


@Controller
public class HostController {
	
	@Autowired
	private HostService hostService;

	
	
	
	
	
	
	
	
		// 헤더의 '호스트 등록'을 눌렀을 때 해당 페이지로 이동시킨다.
	@RequestMapping("/host/hostingList")
	public void hostingList() {}
	
	
	// 선택 호스팅(호스트 등록) 화면으로 이동
	@RequestMapping("/host/hostingStatus")
	public String hostingStatus(int hostId, Model model) {
		if(hostId == 0) { // '새로 등록'을 선택했으면
			return "redirect:registration/roomType";
		}
			// 등록중(미완료)를 선택했으면 해당 호스트ID를 가지고 이동
		model.addAttribute("hostId", hostId);
		return "host/hostingStatus";
	}
	
	
	
	
	
	
	
	
	
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
	public boolean changeCoverImage(HttpServletRequest req) {
		return hostService.changeCoverImage(req);
	}
//****************************** 호스트 사진 등록(수정)-END ******************************************		
	
	
	
	
	
	
}
