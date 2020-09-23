package com.project.car.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

import net.coobird.thumbnailator.Thumbnails;

public class UploadFileUtils {
	 static final int THUMB_WIDTH = 300;
	 static final int THUMB_HEIGHT = 300;
	 
	 public static String fileUpload(String path_upload,
	         String fileName,
	         byte[] fileData, String ymdPath) throws Exception {

	  UUID uid = UUID.randomUUID();
	  
	  String newFileName = uid + "_" + fileName;
	  String imgPath = path_upload + ymdPath;
	  
	  File target = new File(imgPath, newFileName);
	  
	  String thumbFileName = "s_" + newFileName;
	  File img = new File(imgPath + File.separator + newFileName);
	  File imgPathDir = new File(imgPath);
	  File thumbnail = new File(imgPath + File.separator + thumbFileName);
	  if (!imgPathDir.exists()) {
		  imgPathDir.mkdirs();
	  }
	  FileCopyUtils.copy(fileData, target);
	  Thumbnails.of(img).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
	  
	  return newFileName;
	 }

	 public static String calcPath(String path_upload) {
	  Calendar cal = Calendar.getInstance();
	  String yearPath = File.separator + cal.get(Calendar.YEAR);
	  String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	  String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

	  makeDir(path_upload, yearPath, monthPath, datePath);
	  makeDir(path_upload, yearPath, monthPath, datePath + "\\s");

	  return datePath;
	 }

	 private static void makeDir(String path_upload, String... paths) {

	  if (new File(paths[paths.length - 1]).exists()) { return; }

	  for (String path : paths) {
	   File dirPath = new File(path_upload + path);

	   if (!dirPath.exists()) {
	    dirPath.mkdir();
	   }
	  }
	 }
}
