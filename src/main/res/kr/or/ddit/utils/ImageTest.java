package kr.or.ddit.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;

import kr.or.ddit.global.GlobalConstant;

public class ImageTest {

	public static File textToImage(String client, String free, String title){
		SimpleDateFormat mm = new SimpleDateFormat("MM");
		SimpleDateFormat dd = new SimpleDateFormat("dd");
		Date date = new Date();
		String text1 = client;
		String text2 = free;
		String text3 = title;
		String text4 = mm.format(date);
		String text5 = dd.format(date);
		// 저장할 파일명 생성
		title = title.replace('/', ' ');
		title = title.replace('.', ' ');
		File makeImage = new File(GlobalConstant.FILE_PATH  + "/" + "constract.jpg");
		// 문구 작성 할 이미지 불러오기
		File loadImage = new File(
				"D:/A_TeachingMaterial/sample.jpg");
		BufferedImage bi = null;
		try {
			bi = ImageIO.read(loadImage);
		} catch (IOException e) {
			e.printStackTrace();
		}

		Graphics2D g2 = null;

		g2 = bi.createGraphics();
		// text에 적용할 폰트 생성, 아래 폰트는 시스템에 설치 되어 있어야 사용할 수 있음
		Font font = new Font("a대한늬우스L", 0, 16);
		// 가운데 정렬하기 위해, text의 width구하기
		FontRenderContext frc = new FontRenderContext(null, true, true);
		// 입력하는 문자의 가용 넓이
		// 폰트 색상 설정
		g2.setColor(Color.black);
		// 폰트 종류 설정
		g2.setFont(font);
		// 이미지에 텍스트 사입. (text,x축,y축)
		g2.drawString(text1, 169, 246);
		g2.drawString(text2, 457, 246);
		g2.drawString(text3, 253, 378);
		g2.drawString(text1, 710, 1130);
		g2.drawString(text2, 710, 1190);
		g2.drawString(text4, 490, 1246);
		g2.drawString(text5, 564, 1246);
		g2.dispose();
		try {
			ImageIO.write(bi, "jpg", makeImage);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return makeImage;
	}

}
