package com.hotel.util;

import java.io.IOException;
import java.util.Map;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class HttpClientService {
	@Autowired
	private CloseableHttpClient httpClient;
	@Autowired
	private RequestConfig requestConfig;
	
	
	public String doGet(String url,Map<String,String> params,String charset) {
		//1.判断字符集编码是否为空,如果为空则给定默认值utf-8
		if(StringUtils.isEmpty(charset)) {
			charset="utf-8";
		}
		//2.判断用户是否需要传递参数
		if(params!=null) {//参数拼接
			url+="?";
			for (Map.Entry<String,String> entry: params.entrySet()) {
				String key = entry.getKey();
				String value = entry.getValue();
				url+=key+"="+value+"&";
			}
			//去除尾部多余的&符号
			url=url.substring(0, url.length()-1);
		}
		
		//3.定义GET请求对象
		HttpGet httpGet = new HttpGet(url);
		//定义请求的超时时间
		httpGet.setConfig(requestConfig);
		String result=null;
		//4.发起http请求
		try {
			CloseableHttpResponse response = httpClient.execute(httpGet);
			if(response.getStatusLine().getStatusCode()==200) {
				result = EntityUtils.toString(response.getEntity(),charset);
			}else {
				System.out.println("错误状态码信息:"+response.getStatusLine().getStatusCode());
			}
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
		return result;
	}
	
	public String doGet(String url) {
		return doGet(url,null,null);
	}
	public String doGet(String url,Map<String,String> params) {
		return doGet(url,params,null);
	}
	public String doGet(String url,String charset) {
		return doGet(url,null,charset);
	}
}
