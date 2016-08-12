<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@
page import="org.json.*"%><%@
page import="aes.*"%><%

String cid = request.getParameter("cid");
String userId = request.getParameter("user-id");

System.out.println("userId: " + userId);
StringEncrypter stringEncrypter = new StringEncrypter("s3PWlU5D8oLlFWkCs3PWlU5D8oLlFWkC", "0123456789abcdef");

JSONObject job = new JSONObject();

job.put("user_id", userId);
//job.put("oid", "error");
job.put("oid", "test");
job.put("cid", "DEMO" + cid);

String cont1 = stringEncrypter.encrypt(job.toString());
out.print("{\"cont1\":\""+cont1+"\"}");

%>
