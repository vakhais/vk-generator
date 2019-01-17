package com.gen.table.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface TableMapper {

	public List<?> selectTableList() throws Exception;
	
	public List<?> selectTableColumnList(Map params) throws Exception;
	
	public List<?> selectTablePkColumnList(Map params) throws Exception;
}
