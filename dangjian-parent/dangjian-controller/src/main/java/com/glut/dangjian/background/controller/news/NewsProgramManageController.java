
package com.glut.dangjian.background.controller.news;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.annotation.JSONField;
import com.glut.dangjian.background.news.service.LmService;
import com.glut.dangjian.entity.other.Lmb;
import com.glut.dangjian.utils.Msg;

/**
 * 新闻管理->栏目管理
 */
@Controller
@RequestMapping("/newsProgramManage")
public class NewsProgramManageController {

    //定义模块视图根目录
    private final static String ROOT = "background/news/";

    @Autowired
    private LmService lmbService;

    /**
     * 栏目列表
     */
    @RequestMapping("")
    public String index(){
        return ROOT+"programa";
    }

    /**
     * 获取栏目列表
     */
    @ResponseBody
    @RequestMapping("/getlist")
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    public List<Lmb> list(){
        List<Lmb> list = lmbService.getLmbList();
        return lmbService.getChildGroup(list,0);
    }

    /**
     * 添加栏目
     */
    @ResponseBody
    @RequestMapping(value = "/addProgram",method = RequestMethod.POST)
    public Map addProgram(String lmMc, int lmFid, String lmMs){

    	Lmb lmb = new Lmb();
    	lmb.setLmFid(lmFid);
    	lmb.setLmMc(lmMc);
    	lmb.setLmMs(lmMs);

    	if(lmbService.addLmb(lmb)){
			return Msg.msg(Msg.OK,"保存成功！");
		}else {
			return Msg.msg(Msg.ERROR,"保存失败！");
		}
    }

	/**
	 * 根据id删除栏目以及该栏目下的子栏目
	 * @param lmId
	 * @return
	 */
    @RequestMapping(value = "/deleteProgram",method = RequestMethod.POST)
	@ResponseBody
    public Map deleteProgram(@RequestParam("lmId") String lmId){

		String[] lids =  lmId.split(",");
		for ( String s : lids){
			lmbService.deleteLmbById(Integer.parseInt(s));
		}
    	return Msg.ok();
	}


	/**
	 * 更新栏目
	 * @param lmMc
	 * @param lmId
	 * @param lmMs
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/updateProgram",method = RequestMethod.POST)
	public Map updateProgram(String lmMc, int lmId, String lmMs){

		Lmb lmb = new Lmb();
		lmb.setLmId(lmId);
		lmb.setLmMc(lmMc);
		lmb.setLmMs(lmMs);
		System.out.println(lmb);

		if(lmbService.updateLmb(lmb)){
			return Msg.msg(Msg.OK,"保存成功！");
		}else {
			return Msg.msg(Msg.ERROR,"保存失败！");
		}
	}

}
