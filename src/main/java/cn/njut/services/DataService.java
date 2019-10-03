package cn.njut.services;

import cn.njut.domain.Datal;

import java.util.List;

/**
 * @author Bijiaqin
 * @date 2019/7/2 16:33
 */
public interface DataService  {

    //查询数据库中保存的数据
    public List<Datal> dataQuery();

    //查询数据库中保存的数据
    public List<Datal> dataQueryByUser(String username);
}
