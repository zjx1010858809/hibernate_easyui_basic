<%@ page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<form action="index" method="post">
<input name="txt"><button type="submit">查询</button>
</form>

<c:forEach items="${requestScope.list}" var="r">
${r.name}---- ${r.info.name}   <a href="delete?id=${r.id}">del</a>  ||<a href="edit?id=${r.id}">edit</a> <br>
</c:forEach>
<a href="add">add</a> 
</body>
</html>