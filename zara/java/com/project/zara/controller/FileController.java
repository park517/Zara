package com.project.zara.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.zara.model.FileVO;
import com.project.zara.service.FileService;
import com.project.zara.util.FileUtil;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/file")
public class FileController {
	
	
	@Autowired
	FileService fileService;
	
	
	@PostMapping(value ="/upload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE) 
	@ResponseBody
	public ResponseEntity<List<FileVO>> fileUpload(MultipartFile[] files , @RequestParam("table_name") String table_name) throws IllegalStateException, IOException
	{	
		FileUtil fileUtil = new FileUtil();
		List<FileVO> fileList = fileUtil.setFiles(files,table_name);
		
		return new ResponseEntity<>(fileList, HttpStatus.OK);
	}
	
	
	
	@RequestMapping("/down/{no}/{index}/{table_name}")
    private void fileDown(@PathVariable int no, @PathVariable int index, 
    		 @PathVariable String table_name,
    		HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        request.setCharacterEncoding("UTF-8");
        Map<String,Object> map = new HashMap<>();
        map.put("no", no);
        map.put("table_name", table_name);
        List<FileVO> fileVO = fileService.getFile(map);
        
        //파일 업로드된 경로 
        try{
            String fileUrl = fileVO.get(index).getFile_path();
            fileUrl += "/";
            String savePath = fileUrl;
            String fileName = fileVO.get(index).getFile_name();
            
            //실제 내보낼 파일명 
            String oriFileName = fileVO.get(index).getFile_real_name();
            InputStream in = null;
            OutputStream os = null;
            File file = null;
            boolean skip = false;
            String client = "";
            
            //파일을 읽어 스트림에 담기  
            try{
                file = new File(savePath, fileName);
                in = new FileInputStream(file);
            } catch (FileNotFoundException fe) {
                skip = true;
            }
            
            client = request.getHeader("User-Agent");
            
            //파일 다운로드 헤더 지정 
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");
            
            if (!skip) {
                // IE
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                    // IE 11 이상.
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                    // 한글 파일명 처리
                    response.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader("Content-Length", "" + file.length());
                os = response.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
            	PrintWriter out = response.getWriter();
                response.setContentType("text/html;charset=UTF-8");
                out.print("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
            }
            in.close();
            os.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }
        
    }
}
