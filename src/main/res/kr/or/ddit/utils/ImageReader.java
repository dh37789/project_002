package kr.or.ddit.utils;

import java.io.File;
import java.io.FileOutputStream;

import org.apache.commons.codec.binary.Base64;
import kr.or.ddit.global.GlobalConstant;

public class ImageReader {
	//reference URL : http://www.dailycoding.com/posts/convert_image_to_base64_string_and_base64_string_to_image.aspx
	
		public static File makeFileWithString(String base64){

			byte decode[] = Base64.decodeBase64(base64);
			File file = null;
			FileOutputStream fos;
			try{
				file = new File(GlobalConstant.FILE_PATH + "/temp.jpg");
//				file.createNewFile();
				fos = new FileOutputStream(file);
				fos.write(decode);
				fos.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			return file;
		}
		
}
