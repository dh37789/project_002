package kr.or.ddit.utils;

import java.util.List;

import kr.or.ddit.vo.WorkVO;

public class GanttChartDTO {
	public static String getDtoCode(List<WorkVO> workList){
//		['Hockey', 'Hockey Season', 'sports',
//	     new Date(2019, 9, 8), new Date(2019, 9, 21), null, 89, null]
		workList = setPriority(workList);
		workList = newDate(workList);
		
		String code = "";
		for (int i = 0; i < workList.size(); i++) {
			code += "['" + workList.get(i).getRnum() + "','" + workList.get(i).getWork_title() + "','" 
					+ workList.get(i).getWork_priority() + "'," + workList.get(i).getWork_start()
					+ "," + workList.get(i).getWork_end() + ", null, "
					+ workList.get(i).getWork_progress() + ",";
			if (workList.get(i).getWork_order() == null) {
				code += workList.get(i).getWork_order() + "]";
			}else{
				code += "'" + workList.get(i).getWork_order() + "']";
			}
			if (!(i == workList.size()-1)) {
				code += ",";
			}
		}
		return code;
	}
	public static List<WorkVO> setPriority(List<WorkVO> workList){
		for (int i = 0; i < workList.size(); i++) {
			String res = workList.get(i).getWork_priority();
			if (res.equals("0")) {
				workList.get(i).setWork_priority("상");
			}else if(res.equals("1")){
				workList.get(i).setWork_priority("중");
			}else{
				workList.get(i).setWork_priority("하");
			}
		}
		return workList;
	}
	public static List<WorkVO> newDate(List<WorkVO> workList){
		for (int i = 0; i < workList.size(); i++) {
			String year = workList.get(i).getWork_start().substring(0, 4);
			String month = workList.get(i).getWork_start().substring(5, 7);
			String day = workList.get(i).getWork_start().substring(8, 10);
			workList.get(i).setWork_start("new Date(" + year + "," + month + "," + day + ")");
		}
		for (int i = 0; i < workList.size(); i++) {
			String year = workList.get(i).getWork_end().substring(0, 4);
			String month = workList.get(i).getWork_end().substring(5, 7);
			String day = workList.get(i).getWork_end().substring(8, 10);
			workList.get(i).setWork_end("new Date(" + year + "," + month + "," + day + ")");
		}
		return workList;
	}

}
