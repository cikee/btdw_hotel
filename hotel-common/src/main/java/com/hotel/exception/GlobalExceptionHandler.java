package com.hotel.exception;

import org.apache.shiro.ShiroException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.hotel.vo.JsonResult;

/**
 * 当控制层对象出现异常后：
 * 1)检测控制层对象内部有没有@ExceptionHandler描述异常处理方法
 * 2)检测Spring容器中是否有对象使用了@ControllerAdvice注解修饰
 * 假如有，则使用类中的@ExceptionHandler描述的异常处理方法，对
 * 特定异常进行处理。
 * @author Administrator
 */
//@ResponseBody
//@ControllerAdvice
@RestControllerAdvice
public class GlobalExceptionHandler {
	   /**
	    * @ExceptionHandler 描述的方法为异常处理方法
	    * 其中注解内部指定的异常类型，为此方法可处理的异常
	    * @param e
	    * @return
	    */
	   @ExceptionHandler(RuntimeException.class)
	   //@ResponseBody
	   public JsonResult doHandleRuntimeException(
			   RuntimeException e) {
		   e.printStackTrace();
		   return new JsonResult(e);
	   }
	   @ExceptionHandler(ShiroException.class)
	   public JsonResult doHandleShiroException(
				ShiroException e,Model model) {
			JsonResult r=new JsonResult();
			r.setState(0);
			if(e instanceof UnknownAccountException) {
				
				model.addAttribute("UnknowException", "账户不存在");
				r.setMessage("账户不存在");
			}else if(e instanceof LockedAccountException) {
				model.addAttribute("LockedAccountException", "账户已被禁用");
				r.setMessage("账户已被禁用");
			}else if(e instanceof IncorrectCredentialsException) {
				model.addAttribute("IncorrectCredentialsException", "密码不正确");
				r.setMessage("密码不正确");
			}else if(e instanceof AuthorizationException) {
				r.setMessage("没有此操作权限");
			}else {
				model.addAttribute("excuption", "系统维护中");
				r.setMessage("系统维护中");
			}
			e.printStackTrace();
			return r;
		}
}
