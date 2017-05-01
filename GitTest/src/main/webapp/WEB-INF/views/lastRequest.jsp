<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="resources/jquery-3.1.1.min.js"></script>
<script>
	$(function(){
		$.ajax({
			 type : "get"
		     , url : "getlastRequest"
		     , success : function(data) {
		    	 location.href = data;
		     }
		});
	});
</script>	
</head>
<body>

</body>
</html>