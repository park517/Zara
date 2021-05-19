package com.project.zara.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;


import com.project.zara.model.Test;
@Mapper
public interface TestMapper {
	public List<Test> getTest();
}
