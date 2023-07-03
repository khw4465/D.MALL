package com.fastcampus.ch3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.*;

//파일 업로드 컨트롤러 구현. 파일과 매개변수를 같이 전송하므로 Map을 사용.
//매개변수의 name/value를 다시 map의 key/value로 저장. 파일이름을 ArrayList에 저장한후 다시 map에 kay/value 로 저장.
@Controller
public class FileUploadController {
    private static final String CURR_IMAGE_REPO_PATH = "/Users/sanghoon/file_repo";

    @RequestMapping(value = "/form")
    public String form() {
        return "uploadForm";
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public ModelAndView upload(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
            throws Exception {
        multipartRequest.setCharacterEncoding("utf-8");
        Map map = new HashMap();
        Enumeration enu = multipartRequest.getParameterNames();

        //전송된 매개변수 값을 key/value로 map에 저장.
        while (enu.hasMoreElements()) {
            String name = (String) enu.nextElement();
            String value = multipartRequest.getParameter(name);
            map.put(name, value);
        }

        //파일을 업로드한 후 반환된 파일 이름이 저장된 fileList를 다시 map에 저장.
        List fileList = fileProcess(multipartRequest);
        map.put("fileList", fileList);
        ModelAndView mav = new ModelAndView();
        //map을 결과창으로 포워딩
        mav.addObject("map", map);
        mav.setViewName("result");
        return mav;
    }

    private List<String> fileProcess(MultipartHttpServletRequest multipartRequest)
            throws Exception {
        List<String> fileList = new ArrayList<String>();
        Iterator<String> fileNames = multipartRequest.getFileNames(); //첨부된 파일 이름을 가져옴.
        while (fileNames.hasNext()) {
            String fileName = fileNames.next();
            MultipartFile mFile = multipartRequest.getFile(fileName); //파일 이름에 대한 multipartRequest객체를 가져옴.
            String originalFileName = mFile.getOriginalFilename(); //실제 파일 이름을 가져옴.
            fileList.add(originalFileName); //파일 이름을 하나씩 fileList에 저장.
            File file = new File(CURR_IMAGE_REPO_PATH + "/" + fileName);
            if (mFile.getSize() != 0) { //첨부된 파일이 있으면 실행
                if (!file.exists()) { //경로에 파일이 없으면 그 경로에 해당하는 디렉토리를 만든 후 파일을 생성.
                    if (file.getParentFile().mkdirs()) {
                        file.createNewFile();
                    }
                }
                //임시로 저장된 multipartFile을 실제 파일로 전송.
                mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "/" + originalFileName));
            }
        }
        return fileList; //첨부한 파일이름이 저장된 fileList를 반환.
    }
}