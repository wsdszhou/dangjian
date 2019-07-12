import cn.zjw.mapper.CategoryMapper;
import cn.zjw.pojo.Category;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class testMybatis {

    @Autowired
    CategoryMapper categoryMapper;

    @Test
    public void test(){
        System.out.println("失败");
        Category category = new Category();
        category.setName("分类1");
        categoryMapper.insert(category);
    }
}
