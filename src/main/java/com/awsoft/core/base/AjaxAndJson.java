package com.awsoft.core.base;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by AllenWish on 2017-12-15.
 */
public class AjaxAndJson implements Serializable {
    private String msg;
    private boolean flag;
    private Map<String,Object> data = new HashMap<>();


    public AjaxAndJson() {
        this.flag=true;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }
}
