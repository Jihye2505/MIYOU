<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Conf List</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- morris -->
<link href="resources/assets/css/morris.css" rel="stylesheet">
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

<script type="text/javascript" src="resources/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$.ajax({
		 type : "get"
	     , url : "logoutCheck"
	     , success : function(data) {
	    	 if(data != "true") {
	    		 location.href = "login";
	    	 }
	     }
	});
});

$(function(){
	$.ajax({
		 type : "get"
	     , url : "lockCheck"
	     , success : function(data) {
	    	 if(data != "true") {
	    		 location.href = "lockscreen";
	    	 }
	     }
	});
});

function pagingForSubmit(currentPage){
	var form = document.getElementById("pagingForm");
	var page = document.getElementById("page");
	page.value = currentPage;
	form.submit();
	
}

function countPerPage() {
	var countPerPage = document.getElementById("countPerPage").value;
	alert(countPerPage)	
	location.href('boardList?countPerPage=20');
}

</script>
</head>

<body class="page-header-fixed ">
	<%@ include file="../header.jspf"%>
	<div class="clearfix"></div>
	<div class="page-container">
		<%@ include file="../side.jspf"%>
	  <div class="page-content-wrapper">
	    <div class="page-content">
	    <div class="wrapper-content ">
	        <div class="row">
	          <div class="col-lg-12">
	            <div class="ibox float-e-margins">
	              <div class="ibox-title">
	                <h3>Conference List</h3>
	              </div>
	              <div class="ibox-content collapse in">
	                <div class="widgets-container">
	                  <form  id="pagingForm" action="confList" method="get">
		                  <table class="table">
		                  <tr>
		                  <td style="border-top: none;">
		                  <div class="col-md-3 input-group">
							<select class=" _select js-states form-control" name="searchTitle">
	                        	<option value="title" ${searchTitle == 'title' ? 'selected':''}>Title</option>
								<option value="subtitle" ${searchTitle == 'subtitle' ? 'selected':''}>Contents</option>
								<option value="employee_nums" ${searchTitle == 'employee_nums' ? 'selected':''}>Participant</option>
								<option value="employee_num" ${searchTitle == 'employee_num' ? 'selected':''}>Manager</option>
	                        </select>
						  </div>
						  </td>
						  <td style="border-top: none;">
		                <div class="col-md-6 input-group pull-right">
		                  <input class="form-control input-sm" name="searchText" value="${searchText }" placeholder="Search Text" type="text">
		                  <input type="hidden" name="page" id="page">
		                  <div class="input-group-btn">
		                    <input class="btn btn-sm aqua" type="button" onclick="pagingForSubmit(1)" value="Search">
		                  </div>
	                  	</div>
	                  	</td>
	                  	</tr>
	                  	</table>
              		</form>
<div class="borderedTable">
                  <div class="table-scrollable">
                    <table class="table table-hover">
<!-- 
	                    <table id="example" class="table  responsive nowrap table-bordered" cellspacing="0" width="100%">
-->
	                      <thead>
	                        <tr>
	                          <th>&ensp;&ensp;&ensp;No.&ensp;&ensp;&ensp;</th>
							  <th>Title</th>
							  <th>Participant</th>
							  <th>Created date</th>
							  <th>Conf date</th>
	                        </tr>
	                      </thead>
	                      <tbody>
	                        <c:forEach var="conf" items="${confList }">
								<tr>
									<td>${conf.conf_num }</td>
									<td><a href="selectConf?conf_num=${conf.conf_num }">${conf.title }</a></td>
									<td>${conf.employee_nums }</td>
									<td>${conf.viewTodate }</td>
									<td>${conf.viewConf_date }</td>
								</tr>
							</c:forEach>
	                      </tbody>
	                    </table>
	                    <br>
<!-- 페이징 -->
<div class="text-center">
	<div class="btn-group">
	<c:forEach var="page" begin="${navi.startPageGroup }" end="${navi.endPageGroup }">
		<a class="btn btn-white" name="btn1" href="javascript:pagingForSubmit(${page })">${page }</a>
	</c:forEach>
	</div>
</div>
	                  </div>
	                </div>
	            </div>
	          </div>
	        </div>
	       </div>
<%-- 
<div>
<h2>[ 회의 목록 ]</h2>
<a href="main">처음으로</a>
<!-- 검색 -->
<form id="pagingForm" action="confList" method="get">
	<select name="searchTitle">
		<option value="title" ${searchTitle == 'title' ? 'selected':''}>제목</option>
		<option value="subtitle" ${searchTitle == 'subtitle' ? 'selected':''}>내용</option>
		<option value="employee_nums" ${searchTitle == 'employee_nums' ? 'selected':''}>참여자</option>
		<option value="employee_num" ${searchTitle == 'employee_num' ? 'selected':''}>담당자</option>
	</select> 
	<input type="hidden" name="page" id="page">
	<input type="text" name="searchText" value="${searchText }"> 
	<input type="button" onclick="pagingForSubmit(1)" value="검색">
</form>
<br />
<table border="1">
	<tr>
		<th>회의번호</th>
		<th>제목</th>
		<th>참여자</th>
		<th>작성일</th>
		<th>회의날짜</th>
	</tr>
	<c:forEach var="conf" items="${confList }">
		<tr>
			<td>${conf.conf_num }</td>
			<td><a href="selectConf?conf_num=${conf.conf_num }">${conf.title }</a></td>
			<td>${conf.employee_nums }</td>
			<td>${conf.todate }</td>
			<td>${conf.conf_date }</td>
		</tr>
	</c:forEach>
</table>
</div>

<div class="mail-tools tooltip-demo ">
	<div class="btn-group pull-right">
		<button class="btn btn-white btn-sm"><i class="fa fa-arrow-left"></i></button>
		<button class="btn btn-white btn-sm"><i class="fa fa-arrow-right"></i></button>
	</div>
	<button title="" data-placement="left" data-toggle="tooltip" class="btn btn-white btn-sm" data-original-title="Refresh inbox"><i class="fa fa-refresh"></i> Refresh</button>
	<button title="" data-placement="top" data-toggle="tooltip" class="btn btn-white btn-sm" data-original-title="Mark as read"><i class="fa fa-eye"></i> </button>
	<button title="" data-placement="top" data-toggle="tooltip" class="btn btn-white btn-sm" data-original-title="Mark as important"><i class="fa fa-exclamation"></i> </button>
	<button title="" data-placement="top" data-toggle="tooltip" class="btn btn-white btn-sm" data-original-title="Move to trash"><i class="fa fa-trash-o"></i> </button>
</div>


<div>
<c:if test="${navi.startPageGroup != 1 }" >
	<a href="javascript:pagingForSubmit(${navi.startPageGroup-1 })" >◁◁</a>
</c:if>
<c:if test="${navi.currentPage > 1 }" >
	<a href="javascript:pagingForSubmit(${navi.currentPage-1 })" >◀</a>
</c:if>
<c:forEach var="page" begin="${navi.startPageGroup }" end="${navi.endPageGroup }">
	<a href="javascript:pagingForSubmit(${page })">${page }</a>
</c:forEach>
<c:if test="${navi.currentPage<navi.totalPageCount }" >
	<a href="javascript:pagingForSubmit(${navi.currentPage+1 })" >▶</a>
</c:if>
<c:if test="${navi.endPageGroup<navi.totalPageCount }" >
	<a href="javascript:pagingForSubmit(${navi.endPageGroup+1 })" >▷▷</a>
</c:if>
</div>
 --%>

<!-- start footer -->
				<%@ include file="../footer.jspf"%>
			</div>
		</div>
	</div>
	</div>
	</div>
	<!-- Go top -->
	<a href="#" class="scrollup"><i class="fa fa-chevron-up"></i></a>
	<!-- Go top -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="resources/assets/js/vendor/jquery.min.js"></script>
	<!-- bootstrap js -->
	<script src="resources/assets/js/vendor/bootstrap.min.js"></script>
	<!-- icheck -->
	<script src="resources/assets/js/vendor/icheck.js"></script>
	<!-- slimscroll js -->
	<script type="text/javascript"
		src="resources/assets/js/vendor/jquery.slimscroll.js"></script>
	<!-- main js -->
	<script src="resources/assets/js/main.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							var callbacks_list = $('.demo-callbacks ul');
							$('input.iCheck')
									.on(
											'ifCreated ifClicked ifChanged ifChecked ifUnchecked ifDisabled ifEnabled ifDestroyed',
											function(event) {
												callbacks_list
														.prepend('<li><span>#'
																+ this.id
																+ '</span> is '
																+ event.type
																		.replace(
																				'if',
																				'')
																		.toLowerCase()
																+ '</li>');
											}).iCheck({
										checkboxClass : 'icheckbox_square-red',
										radioClass : 'iradio_square-grey',
										increaseArea : '20%'
									});
						});
		
  $(document).ready(function(){
            var callbacks_list = $('.demo-callbacks ul');
            $('input.iCheck').on('ifCreated ifClicked ifChanged ifChecked ifUnchecked ifDisabled ifEnabled ifDestroyed', function(event){
              callbacks_list.prepend('<li><span>#' + this.id + '</span> is ' + event.type.replace('if', '').toLowerCase() + '</li>');
            }).iCheck({
              checkboxClass: 'icheckbox_square-red',
              radioClass: 'iradio_square-grey',
              increaseArea: '20%'
            });
  });
  
  
  $(document).on("click","a[name=btn1]",function(){
  		  /* $(this).addClass("active"); */
  		$(this).attr('class','btn btn-white active');
  });
	</script>
</body>
</html>

