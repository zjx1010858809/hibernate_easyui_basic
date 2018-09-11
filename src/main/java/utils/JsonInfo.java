package utils;

public  class JsonInfo{
	int status;
	String text;
	
	public JsonInfo(int status, String text) {
		super();
		this.status = status;
		this.text = text;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
}