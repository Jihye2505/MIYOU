<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>confSummary</title>
</head>
<body>
<form action="">
	회의제목: ${conf_mng.title }
	세부내용: 
	<table class="table table-hover ">
                      <thead>
                        <tr>
                          <th>  </th>
                          <th> 안건 </th>
                          <th> 담당자 </th>
                          <th> 진행상황 </th>
                        </tr>
                      </thead>
                      <tbody>
                          	<c:forEach var="conf_topic" items="${list_topic }">
								<tr>
									<td></td>
									<td>${conf_topic.subtitle }</td>
									<td>${conf_topic.employee_num }</td>
									<td>
									<div class="progress progress-striped">
                    					<div style="width: ${conf_topic.process }%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="${conf_topic.process }" role="progressbar" class="progress-bar progress-bar-success"> <span class="sr-only"> 40% Complete (success) </span> </div>
                  					</div>
									</td>
								</tr>
							</c:forEach>
                      </tbody>
                    </table>
                    
	<input type="button" value="닫기" onclick="javascript:window.close('this')">
</form>
</body>
</html>