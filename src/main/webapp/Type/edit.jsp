<%@ page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>

<c:if test="${requestScope.info==null}">
<form action="insert" method="post">
</c:if>
<c:if test="${requestScope.info!=null}">
<form action="update" method="post">
<input name="id" type="hidden" value="${requestScope.info.id}">
</c:if>

<input name="name" value="${requestScope.info.name}">
<select name="parentid">
	<c:forEach items="${requestScope.sublist}" var="r">
	<c:if test="${r.id==requestScope.info.parentid}">
	<option selected="selected" value="${r.id}">${r.name}</option>
	</c:if>
	<c:if test="${r.id!=requestScope.info.parentid}">
	<option value="${r.id}">${r.name}</option>
	</c:if>
	
	</c:forEach>
</select>
<input type="submit" value="报讯">

</form>

</body>
</html>