package com.ch.winer.controller;

import java.io.FileOutputStream;

import org.springframework.web.multipart.MultipartFile;

public class Filewriter {
	
	private FileOutputStream fos;
    
    public void writeFile(MultipartFile file, String path, String fileName){
         
        try{
         
            byte fileData[] = file.getBytes();
             
            fos = new FileOutputStream(path + "\\" + fileName);
             
            fos.write(fileData);
         
        }catch(Exception e){
             
            e.printStackTrace();
             
        }finally{
             
            if(fos != null){
                 
                try{
                    fos.close();
                }catch(Exception e){}
                 
                }
        }// try end;
         
    }// wirteFile() end;
	
}
