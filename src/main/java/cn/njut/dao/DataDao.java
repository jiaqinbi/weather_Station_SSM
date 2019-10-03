package cn.njut.dao;

import cn.njut.domain.Datal;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Bijiaqin
 * @date 2019/7/2 16:37
 */
@Repository
public interface DataDao {


    @Select("select * from datalist")
    public List<Datal> dataQuery();

    @Select("select * from datalist where username=#{username}")
    public List<Datal> dataQueryByUser();

}
