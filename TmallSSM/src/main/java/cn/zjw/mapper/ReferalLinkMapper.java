package cn.zjw.mapper;

import cn.zjw.pojo.ReferalLink;
import cn.zjw.pojo.ReferalLinkExample;
import java.util.List;

public interface ReferalLinkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ReferalLink record);

    int insertSelective(ReferalLink record);

    List<ReferalLink> selectByExample(ReferalLinkExample example);

    ReferalLink selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ReferalLink record);

    int updateByPrimaryKey(ReferalLink record);
}