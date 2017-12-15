package com.awsoft.core.exceptions;

import com.awsoft.core.base.AjaxAndJson;
import com.awsoft.core.util.ConvertUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by AllenWish on 2017-12-11.
 */
public class CustomExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        boolean isajax = isAjax(request,response);
        Throwable deepestException = deepestException(ex);
        return processException(request, response, handler, deepestException, isajax);
    }
    /**
     * 判断当前请求是否为异步请求.
     */
    private boolean isAjax(HttpServletRequest request, HttpServletResponse response){
        return ConvertUtils.isNotEmpty(request.getHeader("X-Requested-With"));
    }

    /**
     * 获取最原始的异常出处，即最初抛出异常的地方
     */
    private Throwable deepestException(Throwable e){
        Throwable tmp = e;
        int breakPoint = 0;
        while(tmp.getCause()!=null){
            if(tmp.equals(tmp.getCause())){
                break;
            }
            tmp=tmp.getCause();
            breakPoint++;
            if(breakPoint>1000){
                break;
            }
        }
        return tmp;
    }

    /**
     * 处理异常.
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @param isajax
     * @return
     */
    private ModelAndView processException(HttpServletRequest request,
                                          HttpServletResponse response, Object handler,
                                          Throwable ex, boolean isajax) {
        //步骤一、异常信息记录到日志文件中.
       // log.error("全局处理异常捕获:", ex);
        //步骤二、异常信息记录截取前50字符写入数据库中.
        //logDb(ex);
        //步骤三、分普通请求和ajax请求分别处理.
        Enumeration<String> s=request.getParameterNames();
        if(isajax){
            //ajax请求后再次请求，此刻依旧是为true，从参数中判断是否请求的为页面
            for(Enumeration<String> e=s;e.hasMoreElements();){
                String thisName=e.nextElement().toString();
                // String thisValue=request.getParameter(thisName);
                //System.out.println(thisName+"--------------"+thisValue);
                if(thisName.equals("rows")){
                    return processNotAjax(request,response,handler,ex);
                }
            }
            return processAjax(request,response,handler,ex);
        }else{
            return processNotAjax(request,response,handler,ex);
        }
    }

    /**
     * ajax异常处理并返回.
     * @param request
     * @param response
     * @param handler
     * @param deepestException
     * @return
     */
    private ModelAndView processAjax(HttpServletRequest request,
                                     HttpServletResponse response, Object handler,
                                     Throwable deepestException){
        ModelAndView empty = new ModelAndView();
        //response.setContentType("application/json");
        response.setHeader("Cache-Control", "no-store");
        Map<String,Object> map = new HashMap<>();
        map.put("flag",false);
        map.put("msg",deepestException.getMessage());
        AjaxAndJson ajaxAndJson = new AjaxAndJson();
        ajaxAndJson.setFlag(false);
        ajaxAndJson.setMsg(deepestException.getMessage());
        ajaxAndJson.setData(map);
        PrintWriter pw = null;
        try {
            pw=response.getWriter();
            pw.write(new ObjectMapper().writeValueAsString(map));
            pw.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            if (pw!=null) {
                pw.close();
            }
        }
        empty.clear();
        return empty;
    }
    /**
     * 普通页面异常处理并返回.
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @return
     */
    private ModelAndView processNotAjax(HttpServletRequest request,
                                        HttpServletResponse response, Object handler, Throwable ex) {
        String exceptionMessage = getThrowableMessage(ex);
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("exceptionMessage", exceptionMessage);
        model.put("ex", ex);
        return new ModelAndView("common/error", model);
    }
    /**
     * 返回错误信息字符串
     *
     * @param ex
     *            Exception
     * @return 错误信息字符串
     */
    public String getThrowableMessage(Throwable ex) {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        ex.printStackTrace(pw);
        return sw.toString();
    }
}
