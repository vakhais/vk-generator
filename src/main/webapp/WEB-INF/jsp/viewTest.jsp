<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<title>Insert title here</title>

<script type="text/javascript">
function fnCmdColumnList(tableNm, tableComment) {
	$('#tableNm').val(tableNm);
	$('#tableComment').val(tableComment);
	$('#listForm').attr('action', 'TableColumnList.do').submit();
}
</script>
</head>
<body>
	<form id="listForm" name="listForm" method="get" class="form-horizontal">
		<input type="hidden" name="tableNm" id="tableNm">
		<input type="hidden" name="tableComment" id="tableComment">
	
		<div class="container">
			<div class="row">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>NO</th>
							<th>테이블 명</th>
							<th>테이블 타입</th>
							<th>테이블 코멘트</th>
							<th>기능</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${tableList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${item.TABLE_NAME}</td>
								<td>${item.TABLE_TYPE}</td>
								<td>${item.TABLE_COMMENT}</td>
								<td><button class="btn btn-primary btn-sm" type="button" onclick="fnCmdColumnList('${item.TABLE_NAME}', '${item.TABLE_COMMENT}')">컬럼정보</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</form>
</body>
</html>