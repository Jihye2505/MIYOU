<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<div>

		<table>
			<tr>
				<td>Employee Number</td>
				<td><input type="text" name="emplyee_num"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="password" id="password1"></td>
			</tr>
			<tr>
				<td>Password check</td>
				<td><input type="text" id="password2"></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email" id="email"></td>
			</tr>
			<tr>
				<td>Language</td>
				<td><input type="text" name="language" id="language"></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><input type="text" name="phone" id="password2"></td>
			</tr>
			<tr>
				<td>Department</td>
				<td>
				<!--   이 부분은 부서테이블 에서 목록을 가져올 예정 -->
					<select>
						<optgroup label="영업부">
							<option>영업 1팀</option>
							<option>영업 2팀</option>
						</optgroup>
						<optgroup label="개발부">
							<option>개발 1팀</option>
							<option>개발 2팀</option>
						</optgroup>
					</select>
				<!--   이 부분은 부서테이블 에서 목록을 가져올 예정 -->	
				</td>
			</tr>
			<tr>
				<td>Job</td>
				<td>
				<!--   이 부분은 부서테이블 에서 목록을 가져올 예정 -->
					<select>
							<option>사장</option>
							<option>부장</option>
							<option>차장</option>
							<option>과장</option>
							<option>대리</option>
							<option>사원</option>
					</select>
				<!--   이 부분은 부서테이블 에서 목록을 가져올 예정 -->	
				</td>
			</tr>
		</table>

	</div>
</body>
</html>