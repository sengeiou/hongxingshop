package com.hongxing.shop.pojo;

public class AdminUser {
	private Integer id;

    private String aName;

    private String aPassword;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getaName() {
        return aName;
    }

    public void setaName(String aname) {
        this.aName = aname == null ? null : aname.trim();
    }

    public String getaPassword() {
        return aPassword;
    }

    public void setaPassword(String apassword) {
        this.aPassword = apassword == null ? null : apassword.trim();
    }

    public String getAnonymousName(){
        if(null==aName)
            return null;

        if(aName.length()<=1)
            return "*";

        if(aName.length()==2)
            return aName.substring(0,1) +"*";

        char[] cs =aName.toCharArray();
        for (int i = 1; i < cs.length-1; i++) {
            cs[i]='*';
        }
        return new String(cs);


    }
}