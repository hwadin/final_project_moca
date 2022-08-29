package net.koreate.moca.board.provider;

import org.apache.ibatis.jdbc.SQL;

import net.koreate.moca.common.utils.CafeSearchCriteria;

public class CafeBoardQueryProvider {

	public String searchSelectSQL(CafeSearchCriteria csri) {
		SQL sql = new SQL();
		sql.SELECT("R.*,C.name AS writer");
		sql.FROM("tbl_cafe_board AS R INNER JOIN tbl_cafe AS C ON R.cafe_no = C.no");
		getSearchWhere(csri, sql);
		sql.ORDER_BY("R.origin DESC, R.seq ASC");
		sql.LIMIT(csri.getPerPageNum());
		sql.OFFSET(csri.getStartRow());
		String query = sql.toString();
		return query;
	}

	private void getSearchWhere(CafeSearchCriteria csri, SQL sql) {
		String titleQuery = "title LIKE CONCAT('%','" + csri.getKeyword() + "','%')";
		String categoryQuery = "category LIKE CONCAT('%',#{keyword},'%')";
		String writerQuery = "C.name LIKE CONCAT('%',#{keyword},'%')";

		if (csri.getSearchType() != null && !csri.getSearchType().trim().equals("")
				&& !csri.getSearchType().trim().equals("n")) {
			if (csri.getSearchType().contains("c")) {
				sql.OR().WHERE(categoryQuery);
			}
			if (csri.getSearchType().contains("t")) {
				sql.OR().WHERE(titleQuery);
			}
			if (csri.getSearchType().contains("w")) {
				sql.OR().WHERE(writerQuery);
			}
		}
		sql.AND().WHERE("cafe_no = #{cafe_no}");
	}

	public String searchSelectCount(CafeSearchCriteria csri) {
		SQL sql = new SQL();
		sql.SELECT("count(*)");
		sql.FROM("tbl_cafe_board");
		getSearchWhere(csri, sql);
		String query = sql.toString();
//		System.out.println(query);
		return query;
	}

}
