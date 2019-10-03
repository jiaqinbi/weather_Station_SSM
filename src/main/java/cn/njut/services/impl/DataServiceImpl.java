package cn.njut.services.impl;

import cn.njut.dao.DataDao;
import cn.njut.domain.Datal;
import cn.njut.services.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Bijiaqin
 * @date 2019/7/2 16:35
 */
@Service("dataService")
public class DataServiceImpl implements DataService {

    @Autowired
    private DataDao dataDao;

    @Override
    public List<Datal> dataQuery() {
        //System.out.println("查询数据执行...");
        return dataDao.dataQuery();
    }

    @Override
    public List<Datal> dataQueryByUser(String username) {

        System.out.println("业务层：根据用户名查询数据...");
        return dataDao.dataQueryByUser();
    }
}
