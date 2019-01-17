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
function fnCmdSourceGenerator() {
	$('#listForm').attr('action', 'SourceGen.do').submit();
}
</script>
</head>
<body>
	<div class="container">
		<h2>${param.tableNm} - 컬럼정보</h2>
		<hr />
		<button class="btn btn-success btn-sm" data-target="#module-config-modal" data-toggle="modal">소스생성</button>
		
		<form id="listForm" name="listForm" method="get" class="form-horizontal">
		<input type="hidden" name="tableNm" id="tableNm" value="${param.tableNm}">
		
		<div class="row">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>NO</th>
						<th>컬럼 명</th>
						<th>데이터 타입</th>
						<th>길이</th>
						<th>NULL</th>
						<th>기본값</th>
						<th>인덱스</th>
						<th>제약</th>
						<th>코멘트</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${colList}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${item.COL}</td>
							<td>${item.data_type}</td>
							<td>${item.data_length}</td>
							<td>${item.nullable}</td>
							<td>${item.data_default}</td>
							<td>${item.INDEX_NAME}</td>
							<td></td>
							<td>${item.column_comment}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="module-config-modal">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title">모듈 속성 설정</h4>
		            </div>
		            <div class="modal-body">
		
		                <div class="form-group">
		                    <label for="packageName" class="col-lg-2 control-label">패키지명</label>
		                    <div class="col-lg-10">
		                        <input type="text" id="packageName" name="packageName" value="com.edu.app.manager" class="form-control" placeholder="패키지명">
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label for="packageName" class="col-lg-2 control-label">클래스명</label>
		                    <div class="col-lg-10">
		                        <input type="text" id="className" name="className" value="" class="form-control" placeholder="클래스명">
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label for="description" class="col-lg-2 control-label">설명</label>
		                    <div class="col-lg-10">
		                        <input type="text" id="description" name="description" value="${param.tableComment}" class="form-control" placeholder="설명">
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label for="comments" class="col-lg-2 control-label">테이블 코멘트</label>
		                    <div class="col-lg-10">
		                        <input type="text" id="comments" name="comments" value="${param.tableComment}" class="form-control" placeholder="테이블 코멘트">
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label for="requestMappingUrl" class="col-lg-2 control-label">Mapping URL</label>
		                    <div class="col-lg-10">
		                        <input type="text" id="requestMappingUrl" name="requestMappingUrl" value="/" class="form-control" placeholder="Request Mapping URL">
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label for="authorName" class="col-lg-2 control-label">개발자명</label>
		                    <div class="col-lg-10">
		                        <input type="text" id="authorName" name="authorName" class="form-control" placeholder="개발자 명">
		                    </div>
		                </div>
		                <!--
		                <div class="form-group">
		                    <label for="createDate" class="col-lg-2 control-label">생성일</label>
		                    <div class="col-lg-10">
		                        <input type="text" id="createDate" name="createDate" class="form-control" placeholder="생성일">
		                    </div>
		                </div>
		                -->
		 
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn-default" data-dismiss="modal">Close</button>
		                <!-- <button type="button" class="btn-primary" onclick="fnCmdSourceDownload()">소스 다운로드</button> -->
		                <button type="button" class="btn-primary" onclick="fnCmdSourceGenerator()">소스 보기</button>
		            </div>
		        </div>
		        <!-- /.modal-content -->
		    </div>
		    <!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		</form>
	</div>
</body>
</html>