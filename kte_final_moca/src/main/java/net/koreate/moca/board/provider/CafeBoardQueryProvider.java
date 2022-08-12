package net.koreate.moca.board.provider;

import org.apache.ibatis.jdbc.SQL;

import net.koreate.common.utils.SearchCriteria;

public class CafeBoardQueryProvider {
	
	public String searchSelectSQL(SearchCriteria cri) {
		SQL sql = new SQL();
		sql.SELECT("R.*,C.name AS writer");
		sql.FROM("tbl_cafe_board AS R INNER JOIN tbl_cafe AS C ON R.cafe_no = C.no");
		getSearchWhere(cri,sql);
		sql.ORDER_BY("R.origin DESC, R.seq ASC");
		sql.LIMIT(cri.getPerPageNum());
		sql.OFFSET(cri.getStartRow());
		String query = sql.toString();
		System.out.println(query);
		return query;
	}
	
	private void getSearchWhere(SearchCriteria cri,SQL sql) {
		String titleQuery ="title LIKE CONCAT('%','"+cri.getKeyword()+"','%')";
		String contentQuery ="content LIKE CONCAT('%',#{keyword},'%')";
		String writerQuery ="U.uname LIKE CONCAT('%',#{keyword},'%')";
		
		if(cri.getSearchType() != null 
				&&
			   !cri.getSearchType().trim().equals("") 
			    && 
			   !cri.getSearchType().trim().equals("n")) {
				if(cri.getSearchType().contains("t")) {
					sql.OR().WHERE(titleQuery);
				}
				if(cri.getSearchType().contains("c")) {
					sql.OR().WHERE(contentQuery);
				}
				if(cri.getSearchType().contains("w")) {
					sql.OR().WHERE(writerQuery);
				}
			}
	}
	
	public String searchSelectCount(SearchCriteria cri) {
		SQL sql = new SQL();
		sql.SELECT("count(*)");
		sql.FROM("tbl_cafe_board AS R NATURAL JOIN tbl_cafe AS C");
		getSearchWhere(cri, sql);
		String query = sql.toString();
		System.out.println(query);
		return query;
	}
}
