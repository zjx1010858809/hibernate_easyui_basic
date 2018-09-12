package utils;

public class SearchInfo {
	
	
	private int page = -1;
	public void setPage(int page) {
		this.page = page;
	}
	public int getPage() {
	    return page;
	}

	String where="";
	Object[] objs= {};

	
	public void setObjs(String where ,Object... objs) {
		this.objs = objs;
		this.where=where;
	}
	
	
	
	public Object[] getObjs() {
		return objs;
	}
	public void setObjs(Object[] objs) {
		this.objs = objs;
	}
	public String getWhere() {
		return where;
	}

	public void setWhere(String where) {
		this.where = where;
	}

	public Integer getNext() {
		return page+1;
	}
	
	public Integer getPrev() {
		return page>1?page-1:1;
	}
	
}
