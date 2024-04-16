package kr.co.dingdong.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kr.co.dingdong.domain.Admin;
import kr.co.dingdong.domain.CommunityBoard;
import kr.co.dingdong.domain.CommunityVO;
import kr.co.dingdong.service.AdminCommunityService;
import kr.co.dingdong.service.CommunityService;

@Controller
public class AdminCommunityController {
	
	private static final Logger log = LoggerFactory.getLogger(AdminCommunityController.class);
	
	@Autowired
	private AdminCommunityService adminCommunityService;
	
	@Autowired
	private CommunityService communityService;
	
	@GetMapping("admin/board/listAll")
	public void listAll(Model model) {
		List<CommunityBoard> communityBoardList = adminCommunityService.listAll();
		model.addAttribute("communityBoardList", communityBoardList);
	}
	
	
	@GetMapping("admin/board/del")
	public void del(Model model) {
		List<CommunityBoard> delList = adminCommunityService.delList();
		model.addAttribute("delList", delList);
	}
	
	@GetMapping("admin/board/blind")
	public void blind(Model model) {
		List<CommunityBoard> blindList = adminCommunityService.blindList();
		model.addAttribute("blindList", blindList);
	}
	
	@PostMapping("admin/board/multiDelete")
	public String multiDelete(@RequestParam("boardNum")List<Integer> boardNumList, Model model, HttpServletResponse response) throws IOException {
		
		log.info("[boardNumList] " + boardNumList);
		
		int result = adminCommunityService.multiDelete(boardNumList);
		
//		스크립트 출력 
		PrintWriter w = response.getWriter();
		
//		한글 깨짐 -> utf-8 설정 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		if(result > 0) {
			w.println("<script>");
			w.println("alert('삭제 성공!')");
			w.println("location.href='/dingdong/admin/board/listAll'");
			w.println("</script>");
		}
		
		return "redirect:listAll";
	}
	
	@GetMapping("admin/board/read")
	public void read(@RequestParam int boardNum, Model model) throws Exception {
		
		CommunityVO communityVO = communityService.read(boardNum);
		
		log.info("communityVO " + communityVO);
		model.addAttribute("communityBoard", communityVO);
	}
	
	
	
	@GetMapping("admin/notice/write")
	public void write() {
		
	}
	
	@GetMapping("admin/notice/listAll")
	public void notice(Model model) {
		List<CommunityBoard> noticeList = adminCommunityService.noticeList();
		model.addAttribute("noticeList", noticeList);
	}
	
	@PostMapping("admin/notice/uploadAction")
	public void uploadAction(MultipartFile[] uploadFile, Model model) throws IOException {
		
		String uploadFolder = "/Users/imsaebyeol/Documents/workspace-sts-3.9.18.RELEASE/dingdong/src/main/webapp/resources/images/community/notice";
		
		File uploadPath = new File(uploadFolder);
		
//		날짜 폴더 경로 지정 
//		File uploadPath = new File(uploadFolder, getFolder());
//		log.info("[uploadPath] " + uploadPath);
//		log.info("[uploadPath exist?] " + uploadPath.exists());
//		
//		날짜 폴더 없으면 만듦
//		if(!uploadPath.exists()) {
//			uploadPath.mkdirs();
//		}
//		
		for (MultipartFile multipartFile : uploadFile) {
			
			log.info("---------------------------------------");
			log.info("[Upload File Name] " + multipartFile.getOriginalFilename());
			log.info("[Upload File Name] " + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();

			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

			log.info("only file name: " + uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;

			File saveFile = new File(uploadPath, uploadFileName);

			try {
				multipartFile.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				log.error(e.getMessage());
			}

		} // end of for

	}
	
//	날짜 폴더 경로 생성 메서드 ex) 2024/02/22
//	파일 업로드시 해당 날짜에 맞게 경로 설정 
//	쓰지말자 개빡친다
	private String getFolder() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = simpleDateFormat.format(date);
		
		return str.replace("-", File.separator);
	}

	
//	summernote 이미지 업로드
	@PostMapping("admin/notice/uploadSummernoteImageFile")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file")MultipartFile multipartFile, HttpServletRequest request){

		JsonObject jsonObject = new JsonObject();
		
//		저장 경로 설정
//		String uploadPath = "/Users/imsaebyeol/Documents/workspace-sts-3.9.18.RELEASE/dingdong/src/main/webapp/resources/images/community/notice/";
		
//		.meta/
		String uploadPath = request.getSession().getServletContext().getRealPath("resources"); 
		String fileRoot = uploadPath + "/images/community/notice/";
		
//		업로드 파일 원본 이름, 확장자 추출
		String originalFileName = multipartFile.getOriginalFilename();
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
//		새로운 파일명 생성(중복 방지) 랜덤UUID + _ + 파일명
//		String saveFileName = UUID.randomUUID() + "_" + originalFileName;
		String saveFileName = UUID.randomUUID() + "";
		
		File targetFile = new File(fileRoot + saveFileName);
		
		
		try {
//			업로드 파일의 inputstream 얻기
			InputStream fileStream = multipartFile.getInputStream();
			
//			파일을 지정된 경로(uploadPath)에 저장
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			
//			Json 객체에 이미지 url과 응답 코드 추가
//			jsonObject.addProperty("url", uploadPath + saveFileName);
			
//			realPathd와 대칭되는 실제 resources 폴더
			String imagePath = "/dingdong/resources/images/community/notice/";
			jsonObject.addProperty("url", imagePath + saveFileName);
			jsonObject.addProperty("responseCode", "success");
			
			
		} catch (IOException e) {
//			파일 저장 중 오류 발생하면 해당 파일 삭제, 에러 코드 추가 
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject.toString();
		
	}
	
	@PostMapping("admin/notice/insert")
	public String noticeInsert(HttpSession session, CommunityBoard notice, Model model) {
		Admin admin = (Admin)session.getAttribute("admin");
		
		log.info("[admin] " + admin);
		notice.setId(admin.getId());
		notice.setNickname(admin.getNickname());
		
		int result = adminCommunityService.insertNotice(notice);
		
		return "redirect:/admin/notice/listAll";
	}
	
	
	@GetMapping("admin/notice/detail")
	public void noticeDetail(@RequestParam("boardNum")int boardNum, Model model) {
		
		CommunityVO communityBoard = new CommunityVO();
		try {
			communityBoard = communityService.noticeRead(boardNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("communityBoard", communityBoard);
		
		
	}

	
	
	
	
	

}
