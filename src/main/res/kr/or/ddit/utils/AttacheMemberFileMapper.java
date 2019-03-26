package kr.or.ddit.utils;

import java.io.File;
import java.util.UUID;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.MemberVO;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class AttacheMemberFileMapper {

	public String mapping(MultipartFile item, String mem_id){
		String saveFileName = "";
		if (item != null) {
			// item.getName() : d:\temp\a.png or a.png
			// a.png
			// 경로는 날리고 파일 이름만 반환한다.
			String fileName = mem_id + ".jpg";
			saveFileName = generateID(fileName);
			saveFile(saveFileName, item);
		}
		return saveFileName;
	}
	private static void saveFile(String fileSaveName, MultipartFile item) {
		File saveFile = new File(GlobalConstant.FILE_PATH, fileSaveName);
		try {
			item.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static String generateID(String fileName){
		// 파일이 중복될경우 날라가므로 파일 이름을 수정한다. 이름과 확장자 사이에 임의의 글자를 추가
		// a and png
		// a를 반환한다.
		String baseName = FilenameUtils.getBaseName(fileName);
		// png를 반환한다.
		String extension = FilenameUtils.getExtension(fileName);
		
		// a4684684654846.png
		// UUID는 음수도 반환하기 때문에 -를 없앤다.
		String genID = UUID.randomUUID().toString().replace("-", "");
		
		return baseName + genID + "." + extension;
	}
}
