package com.model2.mvc.common.util;

public class CommonUtil {
	
	///Field
	
	///Constructor
	
	///Method
	
	/* public static�Ǿ �ܺο��� Ŭ�������� ���� �޼����� ���� :: ex) CommonUtil.null2str(org,converted);
	 * ���� ����� ���ȭ�Ǿ� �̰��� ��Ƶ� �� ���� */
	
	/* org�� null �̰ų� ���̰� 0�̸�(null String)�̸�  */
	public static String null2str(String org, String converted) {
		if (org == null || org.trim().length() == 0)
			return converted;
		else
			return org.trim();
	}
	
	public static String null2str(String org) {
		return CommonUtil.null2str(org, "");
	}
	
}
