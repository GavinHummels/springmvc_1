<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		1. 为什么使用 form 标签
		可以更快速地开发出表单页面，而且可以更方便地进行表单值的回显
		2. 可以通过 modelAttribute 属性指定绑定的模型属性，若没有指定该属性，则默认从 request 域对象中读取
		command 的表单 bean，如果该属性值也不存在，则会发生错误。
	 -->
	<form:form action="emp" method="POST" modelAttribute="employee">
		<!-- path 属性对应 html 表单标签的 name 属性值 -->
	 	LastName: <form:input path="lastName" />
		<br><br>
	 	Email: <form:input path="email" />
		<br><br>
		<%
	 		Map<String,String> genders = new HashMap();
			genders.put("1","Male");
			genders.put("0","Female");
			request.setAttribute("genders", genders);
	 	%>
	 	Gender: <form:radiobuttons path="gender" items="${genders }" />
	 	<br><br>
	 	Department: <form:select path="department.id" items="${departments }" 
	 	itemLabel="departmentName" itemValue="id"></form:select>
	 	<br><br>
	 	<input type="submit" value="Submit">
	</form:form>

</body>
</html>