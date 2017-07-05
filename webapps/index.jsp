<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href="springmvc/testViewAndViewResolver">Test ViewAndViewResolver</a>
	<br><br>

	<!-- 
		模拟修改操作
		1. 原始数据为： 1,  Tom, 123456, 123@qq.com, 23
		2. 密码不能被修改
		3. 表单回显，模拟操作直接在表单填写对应的属性值
	 -->
	<form action="springmvc/testModelAttribute" method="post">
		<input type="hidden" name="id" value="3">
		username: <input type="text" name="username" value="Tom">
		<br>
		email: <input type="text" name="email" value="123@qq.com">
		<br>
		age: <input type="text" name="age" value="25">
		<br>
		<input type="submit" value="submit">
	</form>
	<br><br>

	<a href="springmvc/testSessionAttribute">Test SessionAttribute</a>
    <br><br>
	
	<a href="springmvc/testMap">Test Map</a>
    <br><br>
	
	<a href="springmvc/testModelAndView">Test ModelAndView</a>
    <br><br>

	<a href="springmvc/testServletAPI">Test ServletAPI</a>
    <br>

	<a href="helloworld">Hello World</a>
	
	<br>
	<a href="springmvc/testRest/1">TestRest Get</a>
	
	<br>
	<form action="springmvc/testRest" method="post">
		<input type="submit" value="TestRest Post"/>
	</form>
	
	<br>
	<form action="springmvc/testRest/1" method="post">
		<input type="hidden" name="_method" value="Delete"/>
		<input type="submit" value="TestRest Delete"/>
	</form>
	
	<br>
	<form action="springmvc/testRest/1" method="post">
		<input type="hidden" name="_method" value="PUT"/>
		<input type="submit" value="TestRest PUT"/>
	</form>
	
	<br>
	<a href="springmvc/testRequestParam?username=wqy">Test RequestParam</a>
	
	<br>
	<a href="springmvc/testCookieValue">Test CookieValue</a>
	
	<br>
	<form action="springmvc/testPojo" method="post">
		username: <input type="text" name="username"/>
		<br>
		password: <input type="password" name="password"/>
		<br>
		email: <input type="text" name="email">
		<br>
		age: <input type="text" name="age">
		<br>
		city: <input type="text" name="address.city">
		<br>
		province: <input type="text" name="address.province">
		<br>
		<input type="submit" value="Submit">
	</form>
	
</body>
</html>