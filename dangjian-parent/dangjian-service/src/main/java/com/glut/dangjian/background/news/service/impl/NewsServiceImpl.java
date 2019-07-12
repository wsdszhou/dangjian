package com.glut.dangjian.background.news.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.approval.service.ApprovalProjectService;
import com.glut.dangjian.background.news.service.NewsService;
import com.glut.dangjian.config.ApprovalTypeConfig;
import com.glut.dangjian.config.UrlConfig;
import com.glut.dangjian.entity.approval.SpLcxmb;
import com.glut.dangjian.entity.approval.SpSpjdb;
import com.glut.dangjian.entity.approval.SpSplcb;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.news.XwQtwjb;
import com.glut.dangjian.entity.news.XwTpb;
import com.glut.dangjian.entity.news.XwZtb;
import com.glut.dangjian.entity.news.Xwb;
import com.glut.dangjian.entity.news.view.ViewNewsComment;
import com.glut.dangjian.entity.notice.NoticeObject;
import com.glut.dangjian.entity.notice.view.ViewMyselfNotice;
import com.glut.dangjian.entity.other.Lmb;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;
import com.glut.dangjian.mapper.approval.ApprovalNodeMapper;
import com.glut.dangjian.mapper.approval.ApprovalProcessMapper;
import com.glut.dangjian.mapper.approval.ApprovalProcessProjectMapper;
import com.glut.dangjian.mapper.background.news.NewsMapper;
import com.glut.dangjian.mapper.background.news.NewsStateMapper;
import com.glut.dangjian.mapper.background.news.OtherFileMapper;
import com.glut.dangjian.mapper.background.picture.XwTpbMapper;
import com.glut.dangjian.mapper.news.view.ViewNewsCommentMapper;
import com.glut.dangjian.mapper.notice.view.ViewMyselfNoticeMapper;
import com.glut.dangjian.mapper.system.view.ViewYhxxMapper;
import com.glut.dangjian.utils.FileOpreateUtiles;
import com.glut.dangjian.utils.StringTools;

/**
 * 
 * @author XuLanKong
 *
 */
@Service("NewsService")
@Transactional
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsMapper newsMapper;
    
    @Autowired 
    private XwTpbMapper xwTpbMapper;
    
    @Autowired
    private OtherFileMapper otherFileMapper;
    
    @Autowired
    private ViewYhxxMapper viewYhxxMapper;
    
    @Autowired
    private ApprovalProjectService approvalProjectService;
    
    @Autowired
    private ApprovalProcessMapper approvalProcessMapper;
    
    @Autowired
    private ApprovalProcessProjectMapper approvalProcessProjectMapper;
    
    @Autowired
    private ApprovalNodeMapper approvalNodeMapper;
    
    @Autowired
    private ViewMyselfNoticeMapper viewMyselfNoticeMapper;
    
    @Autowired
    private ViewNewsCommentMapper viewNewsCommentMapper;
    
    /**
     * 根据栏目id获取指定的新闻列表
     */
    @Override
    @Cacheable(value="newsCache", key="'#root.methodName'+'#p0'"  )
    public List<Xwb> getNewsTitleAndIdListByLmId(Integer lmId) {

        return newsMapper.getNewsTitleAndIdListByLmId(lmId);
    }

    /**
     * 获取所有的新闻列表
     */
    @Override
    @Cacheable(value="newsCache", key="#root.methodName"  )
    public List<Xwb> getNewsAllTitleAndIdList() {
        return newsMapper.getNewsAllTitleAndIdList();
    }

    /**
     * 分页查询新闻列表
     * @param pageNum  当前页
     * @param pageSize 每页显示多条数据
     * @param xwb 新闻对象，用户模糊查询
     * @return
     */
    @Override
    public PageInfo<Xwb> getNewsPageList(Integer pageNum, Integer pageSize, Xwb xwb) {
        PageHelper.startPage(pageNum, pageSize);
        List<Xwb> xwbs = newsMapper.getNewsPageList(xwb);
        PageInfo<Xwb> pageInfo = new PageInfo<Xwb>(xwbs);
        return pageInfo;
    }

    @Override
    @Transactional(propagation=Propagation.NESTED)
    @CacheEvict(value="newsCache", allEntries=true)
    public void saveNews(Xwb xwb, String pictureId, String otherFile, Yhb yhb) {

        String newsId = StringTools.getUUID();
        xwb.setXwId(newsId); 
        // 关联图片信息
        if ( pictureId != null ) {
            String[] pictureIds = pictureId.split(",");
            List<XwTpb> list = new ArrayList<>();
            for(String id : pictureIds) {
                XwTpb picture = xwTpbMapper.getTpbByTpId(id);
                picture.setTpLmdm( xwb.getXwLmdm() );
                picture.setXwb(xwb);
                list.add(picture);
            }
            xwTpbMapper.updateBranch(list);
        }
        // 关联其他文件信息
        if ( otherFile != null ) {
            String[] otherFiles = otherFile.split(",");
            List<XwQtwjb> list = new ArrayList<>();
            for(String id : otherFiles) {
                XwQtwjb xwQtwjb = otherFileMapper.selectByPrimaryKey(id);
                xwQtwjb.setJqwjLmdm(xwb.getXwLmdm());
                xwQtwjb.setJqwjXwdm(xwb);
                list.add(xwQtwjb);
            }
            otherFileMapper.updateBranch(list);
        }
        ViewYhxx viewYhxx = viewYhxxMapper.getViewYhxxByUserId(yhb.getUserId());
        /**
         * 维护新闻信息
         */
        xwb.setXwFbrdm( new Yhb( viewYhxx.getUserId() ));
        if (xwb.getXwXwztdm() ==null) {
            xwb.setXwXwztdm(new XwZtb(1));
        }
        xwb.setXwYdrs(0);
        xwb.setXwBmdm( new Bmb( viewYhxx.getBmId() ) );
        xwb.setXwXgsj(new Date());
        SpSplcb splcbId = approvalProcessMapper.getSpprovalProcessMapperIdByName(ApprovalTypeConfig.NEWSAPPROVAL);
        xwb.setSplc(splcbId);
        // 获取审批节点id
        int nodeId = approvalNodeMapper.getFirstNodeIdByApprovalProcessId(xwb.getSplc().getSplcId());
        /**
         * 封装审批项目对象
         */
        SpLcxmb spLcxmb =  new SpLcxmb(
                StringTools.getUUID(), 
                xwb.getSplc().getSplcMc(), 
                xwb.getSplc(), 
                viewYhxx.getYhxxXm() + "请求审批“"+ xwb.getXwBt() +"”", // 描述格式为：xxx请求审批+“xxx文章”
                new SpSpjdb(nodeId),  // 审批节点对象
                0, 
                0, 
                new Date(),
                newsId   // 审批对象id
                );
        // 添加通知新闻审批
        approvalProjectService.addApprovalProject(spLcxmb, yhb,  xwb.getXwYhm(), xwb.getXwYxj() );
        // 保持新闻信息
        newsMapper.insertIfNot(xwb);
    }

    /**
     * 修改新闻
     * @param xwb
     * @param pictureIds
     */
    @Override
    @Transactional(propagation=Propagation.NESTED)
    @CacheEvict(value="newsCache", allEntries=true)
    public void updateNews(Xwb xwb,Yhb yhb, String pictureId) {
        // 关联图片信息
        if ( pictureId != null ) {
            String[] pictureIds = pictureId.split(",");
            for(String id : pictureIds) {
                XwTpb picture = xwTpbMapper.getTpbByTpId(id);
                picture.setTpLmdm(new Lmb(xwb.getXwLmdm().getLmId()));
                xwTpbMapper.updateByTpIdIfNull(picture);
            }
        }
        // 维护新闻信息 
        if (xwb.getXwXwztdm() ==null) {
            xwb.setXwXwztdm(new XwZtb(1));
        }
        SpSplcb splcbId = approvalProcessMapper.getSpprovalProcessMapperIdByName(ApprovalTypeConfig.NEWSAPPROVAL);
        xwb.setSplc(splcbId);
        xwb.setXwXgsj( new Date());
        // 获取用户视图
        ViewYhxx viewYhxx = viewYhxxMapper.getViewYhxxByUserId(yhb.getUserId());
        // 获取审批节点id
        int nodeId = approvalNodeMapper.getFirstNodeIdByApprovalProcessId(xwb.getSplc().getSplcId());
        
        // 获取审批项目对象
        SpLcxmb spLcxmb =  approvalProcessProjectMapper.getApprovalProjectByObjectId(xwb.getXwId());
        
        spLcxmb.setLcxmMc(xwb.getSplc().getSplcMc());
        spLcxmb.setLcxmSplcdm(xwb.getSplc());
        spLcxmb.setLcxmXmms(viewYhxx.getYhxxXm() + "请求审批“"+ xwb.getXwBt() +"”");
        spLcxmb.setSplbDqjddm(new SpSpjdb(nodeId));
        spLcxmb.setSplbXgsj(new Date());
        spLcxmb.setSplbResulte(0);
        spLcxmb.setSplbDqspzt(0);
        // 修改审批与通知
        approvalProjectService.updateApprovalProject(spLcxmb, yhb,  xwb.getXwYhm(), xwb.getXwYxj(),  xwb.getXwId());
        // 保持新闻信息
        newsMapper.updateNews(xwb);
    }

    /**
     * 批量删除新闻
     * @param newsIds
     */
    @Override
    @CacheEvict(value="newsCache", allEntries=true)
    public void deleteNewsBatch( HttpServletRequest request, String[] newsIds) {
        for(String newsId : newsIds) {
            List<String> picturnUrls =  xwTpbMapper.getPicturnUrlByNewsId(newsId);
            FileOpreateUtiles.deleteFile(request, picturnUrls + UrlConfig.NEWS);
        }
        newsMapper.deleteNewsById(newsIds);
    }

    /**
     * 开启评论
     */
    @Override
    public void openCommentByNewId(String newId) {
        
        newsMapper.openCommentByNewId(newId);
    }

    /**
     * 关闭评论
     */
    @Override
    public void closeComment(String newId) {
        
        newsMapper.closeComment(newId);
    }

    /**
     * 根据id获取新闻对
     */
    @Override
    @Cacheable(value="newsCache", key="'#root.methodName'+'#p0'"  )
    public Xwb getNewsById(String id) {
        return newsMapper.getNewsById(id);
    }

    /**
     * 是否审批
     */
    @Override
    public  List<NoticeObject> isApproval(String xwId) {
        
        return newsMapper.isApproval(xwId);
    }

    /**
     * 通过通知id获取新闻对象
     */
    @Override
    public Xwb getNewsByNoticeId(String id) {
        
        return newsMapper.getNewsByNoticeId( id);
    }

    /**
     * 判断是否已经审批
     */
    @Override
    public int getJudeIsApprovalByNoticeId(String noticeId, String userId) {
        
        ViewMyselfNotice viewMyselfNotice = viewMyselfNoticeMapper.getNotApprovalNoticeObjectByNoticeId(noticeId, userId);
        if (viewMyselfNotice != null) {
            if ( userId.equals(viewMyselfNotice.getTzFbrdm())) {
                return 0;
            }else {
                return 1;
            }
        }else {
            return 0;
        }
    }

    /**
     * 审批结束
     */
    @Override
    public void approvalEnd(Xwb xwb) {
        newsMapper.updateNews(xwb);
    }

    /**
     * 根据评论id获取评论视图
     */
    @Override
    @Cacheable(value="newsCache", key="'#root.methodName'+'#p0'"  )
    public ViewNewsComment getViewNewsComment(String commentId) {
        
        return viewNewsCommentMapper.getViewNewsCommentByCommentId(commentId);
    }

    /**
     * 根据noticeI的获取评论内容
     */
    @Override
    public ViewNewsComment getViewNewsCommentByNoticeIId(String noticeId) {
        
        return viewNewsCommentMapper.getViewNewsCommentByNoticeIId(noticeId);
    }

}
