package kr.co.dingdong.controller;


import com.google.gson.JsonObject;

import kr.co.dingdong.Time;
import kr.co.dingdong.domain.*;
import kr.co.dingdong.service.CommunityService;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class CommunityController {
	
	private static final Logger log = LoggerFactory.getLogger(CommunityController.class); 

    @Autowired
    CommunityService communityService;


    @GetMapping("/community/insert")
    public void getInsert() throws Exception{

    }

    //	summernote 이미지 업로드
    @PostMapping("/community/uploadSummernoteImageFile")
    @ResponseBody
    public String uploadSummernoteImageFile(@RequestParam("file")MultipartFile multipartFile, HttpServletRequest request){


        JsonObject jsonObject = new JsonObject();

        String uploadPath = request.getSession().getServletContext().getRealPath("resources");
        String fileRoot = uploadPath + "/images/community/";

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

//			realPathd와 대칭되는 실제 resources 폴더
            String imagePath = "/dingdong/resources/images/community/";
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

    @PostMapping("/community/insert")
    public String postInsert(CommunityVO communityVO) throws Exception{
        communityService.insert(communityVO);


        return "redirect:/community/read?boardNum="+communityVO.getBoardNum();
    }

    @PostMapping("/community/likeDown")
    @ResponseBody
    public int responseBody(CommunityGoodDTO communityGoodDTO) throws Exception{

        communityService.goodDown(communityGoodDTO.getBoardNum());

         communityService.likeDown(communityGoodDTO);

        CommunityVO communityVO = communityService.read(communityGoodDTO.getBoardNum());


        return communityVO.getGood();


    }

    @PostMapping("/community/jjimUp")
    @ResponseBody
    public int jjimUp(JjimDTO jjimDTO ) throws Exception{

        communityService.jjimUp(jjimDTO);

        communityService.jjimCountUp(jjimDTO.getBoardNum());
        return communityService.read(jjimDTO.getBoardNum()).getJjim() ;
    }

    @ResponseBody
    @PostMapping("/community/jjimDown")
    public int jjimDown(JjimDTO jjimDTO) throws Exception{
        log.info("[log]"+String.valueOf(jjimDTO));

        communityService.jjimDown(jjimDTO);

        communityService.jjimCountDown(jjimDTO.getBoardNum());
        return (communityService.read(jjimDTO.getBoardNum())).getJjim();
    }


    @ResponseBody
    @PostMapping("/community/likeUp")
    public int likeup( CommunityGoodDTO communityGoodDTO) throws Exception{


        communityService.goodPlus(communityGoodDTO.getBoardNum());


          communityService.likeUp(communityGoodDTO);

        CommunityVO communityVO = communityService.read(communityGoodDTO.getBoardNum());


        return communityVO.getGood();


    }

    @ResponseBody
    @PostMapping("/community/dislikeUp")
    public int dislikeup(CommunityBadDTO communitybadDTO) throws Exception {


         communityService.badPlus(communitybadDTO.getBoardNum());


         communityService.dislikeUp(communitybadDTO);

        CommunityVO communityVO = communityService.read(communitybadDTO.getBoardNum());


        return communityVO.getBad();

    }

    @PostMapping("/community/dislikeDown")
    @ResponseBody
    public int disresponseBody(CommunityBadDTO communitybadDTO) throws Exception{

        communityService.badDown(communitybadDTO.getBoardNum());

        communityService.dislikeDown(communitybadDTO);

        CommunityVO communityVO = communityService.read(communitybadDTO.getBoardNum());


        return communityVO.getBad();



    }

    @GetMapping("/community/jjimList")
    public void jjimlist(@RequestParam(defaultValue = "1")int meberIdx ,Model model){
        model.addAttribute("jjimList",communityService.jjimList(meberIdx));
    }

    @PostMapping("/community/report")
    @ResponseBody
    public int report(ReportDTO reportDTO) throws Exception{
        communityService.report(reportDTO);

        communityService.reportupdate(reportDTO.getBoardNum());

        CommunityVO communityVO = communityService.read(reportDTO.getBoardNum());



        return communityVO.getReport(); // 리포트 총 갯수. 


    }



    @GetMapping("/community/read")
    public String getRead(int boardNum, Model model, HttpSession httpSession, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {

        CommunityVO communityVO = communityService.read(boardNum);

        ReportDTO reportDTO = new ReportDTO();




        CommunityGoodDTO communityGoodDTO = new CommunityGoodDTO();


        communityGoodDTO.setBoardNum(communityVO.getBoardNum());

        String id;

        int idx;

        if((Member)httpSession.getAttribute("member")==null){
            id=null;
            idx=0;
        }
        else{id = ((Member)httpSession.getAttribute("member")).getId();

            idx =((Member)httpSession.getAttribute("member")).getIdx();


        }

        reportDTO.setBoardNum(boardNum);
        reportDTO.setReporter(id);

        int result = communityService.reportcheck(reportDTO);

        model.addAttribute("isreport", result);




        communityGoodDTO.setId(id);

        JjimDTO jjimDTO = new JjimDTO();

        jjimDTO.setBoardNum(communityVO.getBoardNum());

        jjimDTO.setMemberIdx(idx);




        CommunityBadDTO communityBadDTO = new CommunityBadDTO();

        communityBadDTO.setBoardNum(communityVO.getBoardNum());

        communityBadDTO.setId(id);









        model.addAttribute("good", communityService.goodCheck(communityGoodDTO)); //좋아요체크

        model.addAttribute("bad",communityService.badCheck(communityBadDTO));

        model.addAttribute("jjim", communityService.jjimCheck(jjimDTO));
        
        model.addAttribute("replyCount", communityVO.getReply());





        if(id!=null){
//      회원 로직처리
        Cookie oldCookie = null;
        Cookie[] cookies = httpServletRequest.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("postView")) {
                    oldCookie = cookie;
                }
            }
        }

        if (oldCookie != null) {
            if (!oldCookie.getValue().contains("[" + id.toString() + "]")) {
                communityService.views(boardNum); //조회수 증가
                oldCookie.setValue(oldCookie.getValue() + "_[" + id + "]");
                oldCookie.setPath("/");
                oldCookie.setMaxAge(60 * 60 * 24);
                httpServletResponse.addCookie(oldCookie);
            }
        } else {
            communityService.views(boardNum); //조회수 증가
            Cookie newCookie = new Cookie("postView","[" + id + "]");
            newCookie.setPath("/");
            newCookie.setMaxAge(60 * 60 * 24);
            httpServletResponse.addCookie(newCookie);
        }
        }
        else {
            // 비회원 처리 로직
            String sessionId = httpSession.getId(); // 세션 ID 가져오기

            Cookie oldCookie = null;
            Cookie[] cookies = httpServletRequest.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("postView")) {
                        oldCookie = cookie;
                    }
                }
            }

            if (oldCookie != null) {
                if (!oldCookie.getValue().contains("[" + sessionId + "]")) { // 세션 ID로 변경
                    communityService.views(boardNum); // 조회수 증가
                    oldCookie.setValue(oldCookie.getValue() + "_[" + sessionId + "]"); // 세션 ID로 변경
                    oldCookie.setPath("/");
                    oldCookie.setMaxAge(60 * 60 * 24);
                    httpServletResponse.addCookie(oldCookie);
                }
            } else {
                communityService.views(boardNum); // 조회수 증가
                Cookie newCookie = new Cookie("postView","[" + sessionId + "]"); // 세션 ID로 변경
                newCookie.setPath("/");
                newCookie.setMaxAge(60 * 60 * 24);
                httpServletResponse.addCookie(newCookie);
            }
        }






        List<CommunityVO> communityVOList = new ArrayList<>();
        communityVOList.add(communityVO);
        Time.calculateTimeDifference(communityVOList);



        model.addAttribute("communityVO", communityVO); // 게시물객체



        return "/community/read";
    }



    @GetMapping("/community/update")
    public void getUpdate(Model model,int boardNum) throws Exception{
        model.addAttribute("communityVO",communityService.read(boardNum));

        log.info("[getupdate]");



    }



    @PostMapping("/community/update")
    public String postUpdate(Model model,CommunityVO communityVO) throws Exception{

        int update = communityService.update(communityVO);

        return "redirect:/community/read?boardNum="+communityVO.getBoardNum();

    }

    @PostMapping("/community/delete")
    public String postDelete(int boardNum,Model model,HttpSession httpSession) throws Exception {

        CommunityVO communityVO = communityService.read(boardNum);


        communityService.delete(boardNum);

        model.addAttribute("communityVO", communityVO);

        return "redirect:/community";

    }






    @GetMapping("/community")
    public String getList(Model model,@RequestParam (defaultValue = "1")int num,
                          @RequestParam(defaultValue = "title") String searchType,
                          @RequestParam(defaultValue = "") String keyword)  throws Exception {


        Page page = new Page();

        page.setNum(num);
        page.setCount(communityService.count( searchType, keyword));

        page.setSearchTypeKeyword(searchType,keyword);




        List<CommunityVO> list = communityService.list(page.getDisplayPost(),page.getPostNum(), searchType, keyword);

        Time.calculateTimeDifference(list);


        log.info("[list] " + list);
        model.addAttribute("boardList",list);

        model.addAttribute("page", page);

        model.addAttribute("select", num);

        model.addAttribute("searchType", searchType);

        model.addAttribute("keyword", keyword);

        return "/community/list";

    }




}

