package com.glut.dangjian.controller.party;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.other.PartyInfo;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewPartyinfo;
import com.glut.dangjian.service.party.PartyFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月21日 下午6:09:31
* @version 1.0
*/
@RestController
@CrossOrigin(methods = {RequestMethod.POST,RequestMethod.GET, RequestMethod.DELETE, RequestMethod.PUT})
@RequestMapping(value="mobile/party")
public class PartyFrontControll {

    @Autowired
    private PartyFrontService partyFrontService;

    /**
     * 获取自己的党籍信息
     * @param
     * @return
     */
    @RequestMapping(value="",method=RequestMethod.GET)
    public Result getParty(HttpSession session) {
       Yhb yhb = (Yhb) session.getAttribute("yhb");
       ViewPartyinfo viewPartyinfo = partyFrontService.getParty(yhb);
       return new Result(0, null, viewPartyinfo);
    }
    
    /**
     * 根据通知id查询党党籍信息
     * @param
     * @return
     */
    @RequestMapping(value="/getSinglePartyByNoticeId ",method=RequestMethod.GET)
    public Result getSinglePartyByNoticeId (@RequestParam("noticeId") String noticeId ,
            HttpSession session) {
       Yhb yhb = (Yhb) session.getAttribute("yhb");
       ViewPartyinfo viewPartyinfo = partyFrontService.getSinglePartyByNoticeId(noticeId);
       return new Result(0, null, viewPartyinfo);
    }
    
    /**
     * 申请转入党籍
     * @return
     */
    @RequestMapping(value="",method=RequestMethod.POST)
    public Result saveParty(PartyInfo partyInfo,HttpSession session) {
        //1.获取当前用户
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        //2。存入
        partyInfo.setYhdm(yhb);
        ViewPartyinfo party = partyFrontService.getParty(yhb);
        if (party != null) {
            return new Result(1, "党籍已存在", null);
        }
       partyFrontService.saveParty(partyInfo); 
       return new Result(0, null, null);
    }
    
    /**
     * 转入党籍（党籍已存在）
     * @param partyInfo
     * @param session
     * @return
     */
    @RequestMapping(value="updateComeNoParty",method=RequestMethod.POST)
    public Result comeParty(PartyInfo partyInfo,HttpSession session) {
        //1.获取当前用户
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        //2。存入
        partyInfo.setYhdm(yhb);
        ViewPartyinfo party = partyFrontService.getParty(yhb);
        if (partyInfo.getId() != null) {
            return new Result(1, "党籍不存在", null);
        }
        partyInfo.setResult(0);
        partyInfo.setZt(1);
        partyFrontService.updateParty(partyInfo);
        return new Result(0, null, null);
    }
    
    /**
     * 转出党籍
     * @param partyInfo
     * @return
     */
    @RequestMapping(value="/updateParty",method=RequestMethod.POST)
    public Result updateParty(PartyInfo partyInfo,HttpSession session) {
        //1.获取当前用户
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        //2。存入
        partyInfo.setYhdm(yhb);
        partyInfo.setZt(2);
       partyFrontService.updateParty(partyInfo);
       return new Result(0, null, null);
    }
   
    
}
