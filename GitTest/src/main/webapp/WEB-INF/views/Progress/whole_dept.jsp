<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Team Process</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- icheck -->
<link href="resources/assets/css/skins/all.css" rel="stylesheet">
<!-- slimscroll -->
<link href="resources/assets/css/jquery.slimscroll.css" rel="stylesheet">
<!-- Fontes -->
<link href="resources/assets/css/font-awesome.min.css" rel="stylesheet">
<link href="resources/assets/css/simple-line-icons.css" rel="stylesheet">
<!-- all buttons css -->
<link href="resources/assets/css/buttons.css" rel="stylesheet">
<!-- adminbag main css -->
<link href="resources/assets/css/main.css" rel="stylesheet">
<!-- aqua black theme css -->
<link href="resources/assets/css/aqua-black.css" rel="stylesheet">
<!-- media css for responsive  -->
<link href="resources/assets/css/main.media.css" rel="stylesheet">

<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.0/themes/cupertino/jquery-ui.css" rel="stylesheet">
<link href="resources/assets/css/inputosaurus.css" rel="stylesheet">

</head>
<body class="page-header-fixed ">
	<%@ include file="../header.jspf"%>
	<div class="clearfix"></div>
	<div class="page-container">
		<%@ include file="../side.jspf"%>
		<!-- Start page content wrapper -->
		<div class="page-content-wrapper">
			<div class="page-content">
			
				<div class="wrapper-content ">
			<div class="row wrapper border-bottom page-heading">
				      <div class="col-lg-12">
						<h1>Progress of whole department</h1>
				      </div>
     		 </div>
					<div class="row">
<%-- 					
<table border="1">
	<tr>
		<td>부서</td><td>진행상황</td>
	</tr>
	<c:forEach var="i" items="${whole}">
		<tr>
			<td><a href="selected_team_process?dept_id=${i.DEPT_ID}">${i.DEPT_NAME}</a></td>
			<td align="right">${i.AVER}%
				<div class="progress progress-mini">
					<div class="progress-bar" style="width: ${i.AVER}%;">
					</div>
				</div> 
			</td>
		</tr>
	</c:forEach>
</table>
&nbsp;&nbsp;
<a href="javascript:history.back();">뒤로가기</a>
 --%>
 		<div class="list-widget white-bg borderedTable" >
        			<table class="table table-hover borderedTable">
                      <thead>
                        <tr>
                          <th>Department</th>
                          <th>Progress</th>
                        </tr>
                      </thead>
                      <tbody>
                          	<c:forEach var="i" items="${whole}">
                          	<tr>
                          	<td><a href="selected_team_progress?dept_id=${i.DEPT_ID}">${i.DEPT_NAME}</a></td>
							<td align="right">${i.AVER}%
								<div class="progress progress-striped">
                    				<div style="width: ${i.AVER}%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="${i.AVER}" role="progressbar" class="progress-bar progress-bar-success">  </div>
                  				</div>
							</td>
							</tr>
							</c:forEach>
                      </tbody>
                    </table>
        </div>
 
				</div>
				</div>
				<!-- start footer -->
				<%@ include file="../footer.jspf"%>
			</div>
		</div>
	</div>
	
	<a href="#" class="scrollup"><i class="fa fa-chevron-up"></i></a>
	<script src="resources/assets/js/vendor/jquery.min.js"></script>
	<script src="resources/assets/js/vendor/bootstrap.min.js"></script>
	<script src="resources/assets/js/vendor/icheck.js"></script>
	<script type="text/javascript" src="resources/assets/js/vendor/jquery.slimscroll.js"></script>
	<script src="resources/assets/js/main.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
   	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
   
  	<script src="resources/assets/js/inputosaurus.js"></script>
</body>
</html>