package kr.or.ddit.utils;

import java.awt.*;  
import java.awt.image.*;  
import java.io.*;  

import javax.imageio.*;  

import kr.or.ddit.global.GlobalConstant;

public class ImageCompose {
	public static void contractSign(String conFile, String signFile, String iden) throws IOException {
		//배경이미지를 불러온다.  
		BufferedImage bg = ImageIO.read(new File(GlobalConstant.FILE_PATH + "\\" +conFile ) );  
		//그 위에 덮씌울 이미지를 불러온다.  
		BufferedImage front = ImageIO.read(new File(GlobalConstant.FILE_PATH + "\\" + signFile) );  
		//배경이미지의 크기대로 메모리이미지 크기를 구성한다.  
		int width = bg.getWidth();  
		int height = bg.getHeight();  
		BufferedImage tmp = new BufferedImage( width, height, bg.getType() );  
		//메모리이미지에서 Graphics2D를 얻어온다.  
		Graphics2D g = tmp.createGraphics();  
		//메모리이미지에 그림을 그리자. 으싸 으싸~  
		g.drawImage( bg, null, 0, 0 );  
		if (iden.equals("c")) {
			g.drawImage( front, 788, 1085, 80, 80, null );  
		}else{
			g.drawImage( front, 788, 1145, 80, 80, null );  
		}
		//메모리 이미지를 파일로 저장한다.  
		File file = new File(GlobalConstant.FILE_PATH + "\\" +conFile);  
		ImageIO.write(tmp, "jpeg", file);  
	}
}
