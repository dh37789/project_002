package kr.or.ddit.scheduler.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;











import javax.servlet.http.HttpSession;

import kr.or.ddit.frProjectMeeting.service.MeetingService;
import kr.or.ddit.scheduler.service.ScheduleService;
import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SchduleCalVO;
import kr.or.ddit.vo.SchduleVO;
import kr.or.ddit.vo.WorkVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lowagie.text.pdf.PRAcroForm;

@RequestMapping("/scheduler/")
@Controller
public class SchedulerController {

   @Autowired
   private ScheduleService schedulerService;
   
    @RequestMapping("frScheduler")
   public ModelAndView frScheduler(ModelAndView andview, String mem_id, Map<String, String> param) throws Exception {
      
       param.put("mem_id", mem_id);
       
       Gson gson = new Gson();
       List<ProjectVO> list = this.schedulerService.getEvent(param);
       List<SchduleCalVO> scList = new ArrayList<SchduleCalVO>();
       SchduleCalVO scVo = null;
       int cnt = 0;
       String[] color = {"rgb(227, 244, 252)", "rgb(250, 233, 232)", "rgb(252, 247, 230)", "rgb(235, 245, 223)", "rgb(225, 237, 231)", "rgb(237, 224, 235)"};
       for (int i = 0; i < list.size(); i++) {
//         int a = (int)(Math.random()*3);
         scVo = new SchduleCalVO();
         scVo.setStart((list.get(i).getPr_start().substring(0,10)));
         scVo.setEnd((list.get(i).getPr_end().substring(0,10)));
         scVo.setNo((list.get(i).getPr_num()+""));
         scVo.setTitle((list.get(i).getPr_title()));
         scVo.setTextColor("black");
         if(i>5){
            scVo.setBackgroundColor(color[cnt]);
            scVo.setBorderColor(color[cnt]);
            cnt++;
         if(cnt>5){
            cnt=0;
          }
         
         }else{
            scVo.setBackgroundColor(color[i]);
            scVo.setBorderColor(color[i]);
         }
          scList.add(scVo);
       }
       
       String jsonPlace = gson.toJson(scList);
      andview.addObject("mem_id", mem_id);
      andview.addObject("scList", jsonPlace);
      andview.setViewName("user/calendar/frScheduler");
      
      return andview;
   }
    
    @RequestMapping("prSchedule")
    public ModelAndView prSchedule(ModelAndView andview, String mem_id, String pr_num, 
          Map<String, String> param, Map<String, String> params, HttpSession session) throws Exception {
       if (pr_num == null || pr_num.equals("")) {
         pr_num = (String) session.getAttribute("pnum");
      }
       param.put("mem_id", mem_id);
       params.put("pr_num", pr_num);
       
       Gson gson = new Gson();
       List<MeetingVO> list = this.schedulerService.meetSchedule(param);
       List<WorkVO> worklist = this.schedulerService.workSchedule(params);
       List<SchduleCalVO> scList = new ArrayList<SchduleCalVO>();
       SchduleCalVO scVo = null;
       for (int i = 0; i < list.size(); i++) {
//         int a = (int)(Math.random()*3);
         scVo = new SchduleCalVO();
         scVo.setStart((list.get(i).getMt_date().substring(0,10)));
         scVo.setNo((list.get(i).getMt_num()+""));
         scVo.setTitle(("미팅상대 : " + list.get(i).getMt_to()));
         scVo.setTextColor("black");
         scVo.setBackgroundColor("rgb(252, 247, 230)");
         scVo.setBorderColor("rgb(252, 247, 230)");
          scList.add(scVo);
       }
       
       
       int cnt = 0;
       String[] color = {"rgb(227, 244, 252)", "rgb(235, 245, 223)", "rgb(250, 233, 232)"};
       for (int i = 0; i < worklist.size(); i++) {
//         int a = (int)(Math.random()*3);
          scVo = new SchduleCalVO();
          scVo.setStart((worklist.get(i).getWork_start().substring(0,10)));
          scVo.setEnd((worklist.get(i).getWork_end().substring(0,10)));
          scVo.setNo((worklist.get(i).getWork_num()+""));
          scVo.setTitle((worklist.get(i).getWork_title()));
          scVo.setTextColor("black");
          if(i>2){
             scVo.setBackgroundColor(color[cnt]);
             scVo.setBorderColor(color[cnt]);
             cnt++;
          if(cnt>2){
             cnt=0;
          }
          
          }else{
             scVo.setBackgroundColor(color[i]);
             scVo.setBorderColor(color[i]);
          }
          scList.add(scVo);
       }
       
       
       String jsonPlace = gson.toJson(scList);
       andview.addObject("scList", jsonPlace);
       andview.addObject("mem_id", mem_id);
       if (session.getAttribute("ADMIN_LOGININFO") != null) {
    	   andview.setViewName("adm/calendar/prScheduler");
       }else{
    	   andview.setViewName("user/calendar/prScheduler");
       }
       
       return andview;
    }
     
}