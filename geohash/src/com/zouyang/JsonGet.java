package com.zouyang;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JsonGet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	public JsonGet() {
		super();
	}
	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println("获取JsonGet");
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        String address = request.getParameter("address");
        address = new String(address.getBytes("iso8859-1"),"utf-8");
        String key = request.getParameter("key");
		String geturl = "http://api.map.baidu.com/geocoder?address="+address+"&output=json&key="+key;
		URL url = new URL(geturl);
	    StringBuffer buffer = new StringBuffer();
	 // http协议传输
        HttpURLConnection httpUrlConn = (HttpURLConnection) url.openConnection();
        httpUrlConn.setDoOutput(true);
        httpUrlConn.setDoInput(true);
        httpUrlConn.setUseCaches(false);
        httpUrlConn.connect();
        // 将返回的输入流转换成字符串
        InputStream inputStream = httpUrlConn.getInputStream();
        InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
        BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
        String str = null;
        while ((str = bufferedReader.readLine()) != null) {
            buffer.append(str);
        }
        bufferedReader.close();
        inputStreamReader.close();
        // 释放资源
        inputStream.close();
        inputStream = null;
        httpUrlConn.disconnect();
	    System.out.println(buffer.toString());
        String json = buffer.toString();
        JSONObject getObject = JSONObject.fromObject(json);
        System.out.println(getObject.get("status"));
        String result = getObject.get("result").toString();
        JSONObject resultObject = JSONObject.fromObject(result);
        System.out.println(resultObject.get("precise")+"--"+resultObject.get("confidence")+"--"+resultObject.get("level"));
        String location = resultObject.get("location").toString();
        JSONObject locationObject = JSONObject.fromObject(location);
        System.out.println(locationObject.get("lng")+"--"+locationObject.get("lat"));

        PrintWriter writer = response.getWriter();
//			System.out.println(listDevice.get(i).getId()+"--"+listDevice.get(i).getName()+"--"+listDevice.get(i).getType()+"--"+listDevice.get(i).getStatus());
			//if(i==0){
				jsonObject.put("id", 123);
				jsonObject.put("name", "test");
				//System.out.println(jsonObject);
				//writer.println(listDevice.get(i).g	etId()+"--"+listDevice.get(i).getName()+"--"+listDevice.get(i).getType()+"--"+listDevice.get(i).getStatus()+"--"+canshu+second+":获取当前机器ip"+request.getRemoteAddr()+"真实ip："+ipAddress);
				jsonArray.add(buffer.toString());
				//writer.print(jsonObject);
				
			//}

		writer.print(jsonArray);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
}
