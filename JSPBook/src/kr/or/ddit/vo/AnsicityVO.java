package kr.or.ddit.vo;

public class AnsicityVO {
	private int memId;
	private String memName;
	private String memAlias;
	
	public AnsicityVO() {}

	public AnsicityVO(int memId, String memName, String memAlias) {
		this.memId = memId;
		this.memName = memName;
		this.memAlias = memAlias;
	}

	public int getMemId() {
		return memId;
	}
	public void setMemId(int memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemAlias() {
		return memAlias;
	}
	public void setMemAlias(String memAlias) {
		this.memAlias = memAlias;
	}
	
}
