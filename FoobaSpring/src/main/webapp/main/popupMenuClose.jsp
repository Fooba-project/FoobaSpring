<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
opener.location.href='restaurantDetail?RSEQ='+${vo.RSEQ};
self.close();
</script>
</head>

<body>
</body>
</html>
