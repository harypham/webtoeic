package com.webtoeic.entities;


public enum VaiTro {

	ROLE_MEMBER(1), ROLE_ADMIN(2);
	
	private int value;
	
	VaiTro(int value) {
		this.value = value;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}
	
    public static VaiTro findByAbbr(int item) {
        for (VaiTro object : values()) {
            if (object.value == item) {
                return object;
            }
        }
        return null;
    }
	
	
}
