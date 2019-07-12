package cn.zjw.service.impl;

import cn.zjw.mapper.ReferalLinkMapper;
import cn.zjw.pojo.ReferalLink;
import cn.zjw.pojo.ReferalLinkExample;
import cn.zjw.service.ReferalLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReferalLinkServiceImpl implements ReferalLinkService {

    @Autowired
    ReferalLinkMapper referalLinkMapper;

    @Override
    public List<ReferalLink> list() {
        ReferalLinkExample referalLinkExample = new ReferalLinkExample();
        List<ReferalLink> referalLinks = referalLinkMapper.selectByExample(referalLinkExample);
        return referalLinks;
    }

    @Override
    public void update() {

    }
}
