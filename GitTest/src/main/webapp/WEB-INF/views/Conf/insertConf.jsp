<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Join</title>
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
<!--[if lt IE 9]> <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
<!--[if lt IE 9]> <script src="dist/html5shiv.js"></script> <![endif]-->

<script type="text/javascript" src="resources/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

// var oTbl;
// //Row 추가
// function insRow() {
//   oTbl = document.getElementById("addTable");
//   var oRow = oTbl.insertRow();
//   oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
//   var oCell = oRow.insertCell();

//   //삽입될 Form Tag
//   var frmTag = "<input type=text name=subtitle class=form-control bottom15> ";
//   frmTag += "<input type=button value='삭제' onClick='removeRow()' class=form-control bottom15>";
//   oCell.innerHTML = frmTag;
// }
// //Row 삭제
// function removeRow() {
//   oTbl.deleteRow(oTbl.clickedRowIndex);
// }

// function frmCheck()
// {
//   var frm = document.form;
  
//   for( var i = 0; i <= frm.elements.length - 1; i++ ){
//      if( frm.elements[i].name == "addText" )
//      {
//          if( !frm.elements[i].value ){
//              alert("텍스트박스에 값을 입력하세요!");
//                  frm.elements[i].focus();
// 	 return;
//           }
//       }
//    }
//  }


var arrInput = new Array(0);
var arrInputValue = new Array(0);
 
function addInput() {
  arrInput.push(arrInput.length);
  arrInputValue.push("");
  display();
}
 
function display() {
  document.getElementById('parah').innerHTML="";
  for (intI=1;intI<arrInput.length;intI++) {
    document.getElementById('parah').innerHTML+="<input type='text' name='subtitle' class = 'form-control bottom15' >";
  }
}
 
function saveValue(intId,strValue) {
  arrInputValue[intId]=strValue;
}  
 
 
function deleteInput() {
  if (arrInput.length > 0) { 
     arrInput.pop(); 
     arrInputValue.pop();
  }
  display(); 
}

</script>

</head>
<body>
<form action="insertConf" method="post">
	<div class="form-group">
		<div class="col-sm-10">
			제목 : <input name="title" class="form-control input-lg bottom15" type="text">
			참여 명단 : <input name="employee_nums" type="text">, <input name="employee_nums" type="text">, <input name="employee_nums" type="text"><br>
			회의 날짜 : <input name="conf_date2" type="hidden" value="${conf_date}"  >${conf_date}
			<select name="time">
				<option value="9" >9시</option>
				<option value="10" >10시</option>
				<option value="11" >11시</option>
				<option value="13" >13시</option>
				<option value="14" >14시</option>
				<option value="15" >15시</option>
				<option value="16" >16시</option>
				<option value="17" >17시</option>
			</select><br><br>
			안건 : <input name="subtitle" class="form-control bottom15" type="text">
		<div id="parah"></div>
			<input type="hidden" name="writer" value="${user.employee_num }">
			<input name="addButton" type="button" onClick="addInput();" value="안건 추가">
			<input type="button" value="삭제" onclick="deleteInput();">
			<input type="submit" value="등록" onClick="frmCheck();">
		</div>
	</div>
</form>
</body>
</html>