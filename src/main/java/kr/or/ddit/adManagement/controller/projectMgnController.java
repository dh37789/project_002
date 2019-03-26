package kr.or.ddit.adManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/projectMgn/")
public class projectMgnController {
	@RequestMapping("standbyPjList")
	public String standbyPjList() {
		return "admin/projectMgn/standbyPjList";
	}
	
	@RequestMapping("contractPjList")
	public String contractPjList() {
		return "admin/projectMgn/contractPjList";
	}
	
	@RequestMapping("progressPjList")
	public String progressPjList() {
		return "admin/projectMgn/progressPjList";
	}
	
	@RequestMapping("completePjList")
	public String completePjList() {
		return "admin/projectMgn/completePjList";
	}
	
	@RequestMapping("pjCondition")
	public String pjCondition() {
		return "admin/projectMgn/pjCondition";
	}
	
	@RequestMapping("ganttChart")
	public String ganttChart() {
		return "admin/projectMgn/ganttChart";
	}
	
	@RequestMapping("cloud")
	public String cloud() {
		return "admin/projectMgn/cloud";
	}
}
