package com.gen.table.repository;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TableRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<?> selectTableList() throws Exception {
		// ORACLE
		//return jdbcTemplate.queryForList("SELECT * FROM USER_TAB_COMMENTS WHERE table_name like 'TB_%' OR table_name LIKE 'TQ_%' ORDER BY table_name ASC");
		// MYSQL
		return jdbcTemplate.queryForList("SELECT * FROM INFORMATION_SCHEMA.tables WHERE table_name like 'TB_%' OR table_name LIKE 'TQ_%' ORDER BY table_name ASC");
	}

	public List<?> selectTableColumnList(String tableNm) {
		// ORACLE
//		return jdbcTemplate.queryForList("SELECT a.column_name, a.data_type, a.data_length, a.data_precision, a.data_scale, a.nullable, a.data_default, b.INDEX_NAME, c.comments " + 
//				", '#{'||LOWER(SUBSTR(REPLACE(INITCAP(a.column_name),'_'),1,1))||SUBSTR(REPLACE(INITCAP(a.column_name),'_'),2)||'}' as column_ex " +
//				"FROM ALL_TAB_COLUMNS a " + 
//				"LEFT OUTER JOIN ALL_IND_COLUMNS b " +
//				"ON a.TABLE_NAME = b.TABLE_NAME " + 
//				"AND a.COLUMN_NAME = b.COLUMN_NAME " +
//				"LEFT OUTER JOIN USER_COL_COMMENTS c " +
//				"ON a.column_name = c.column_name " +
//				"AND a.table_name = c.table_name " +
//				"WHERE a.TABLE_NAME = '" + tableNm +"'");
		// MYSQL
		return jdbcTemplate.queryForList("SELECT column_name, data_type, character_octet_length AS data_length, is_nullable AS nullable, column_default AS data_default " +
				"FROM INFORMATION_SCHEMA.COLUMNS " +
				"WHERE TABLE_SCHEMA = '" + tableNm +"'");
	}
	
	public List<?> selectTablePkColumnList(String tableNm) {
		return jdbcTemplate.queryForList("SELECT ucc.column_name " +
	              ", '#{'||LOWER(SUBSTR(REPLACE(INITCAP(ucc.column_name),'_'),1,1))||SUBSTR(REPLACE(INITCAP(ucc.column_name),'_'),2)||'}' as column_ex " +
				  "FROM USER_CONS_COLUMNS UCC INNER JOIN USER_CONSTRAINTS UC " +
				  "ON UCC.CONSTRAINT_NAME = UC.CONSTRAINT_NAME " +
				  "WHERE UC.CONSTRAINT_TYPE = 'P' " +
				  "AND ucc.table_name = '" + tableNm +"'");
	}
}
