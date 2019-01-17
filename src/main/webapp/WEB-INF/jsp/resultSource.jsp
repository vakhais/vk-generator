<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

<title>Insert title here</title>

<script type="text/javascript">
function fnCmdSourceGenerator() {
	$('#listForm').attr('action', 'SourceGen.do').submit();
}
</script>
</head>
<body>
	<div class="container">
		<h2>${param.tableNm} - 소스코드</h2>
		<hr />
		<button class="btn btn-default btn-sm" onclick="javascript:history.back();">테이블 목록</button>
		
		<form id="listForm" name="listForm" method="get" class="form-horizontal">
		<input type="hidden" name="tabelNm" id="tableNm" value="${param.tableNm}">
		
			<div id="accordion" role="tablist">
				<!-- Mapper.xml -->
				<div class="card">
				    <div class="card-header" role="tab" id="heading1">
				      <h5 class="mb-0">
				        <a data-toggle="collapse" href="#collapse1" aria-expanded="true" aria-controls="collapse1">
				          ${mapperXml.name}
				        </a>
				      </h5>
				    </div>
				
				    <div id="collapse1" class="collapse show" role="tabpanel" aria-labelledby="heading1" data-parent="#accordion">
				      <div class="card-body">
				        <textarea class="form-control" rows="15">${mapperXml.source}</textarea>
				      </div>
				    </div>
				</div>
				<!-- Default Vo -->
				<div class="card">
				    <div class="card-header" role="tab" id="heading2">
				      <h5 class="mb-0">
				        <a class="collapsed" data-toggle="collapse" href="#collapse2" aria-expanded="false" aria-controls="collapse2">
				          ${defaultVo.name}
				        </a>
				      </h5>
				    </div>
				    <div id="collapse2" class="collapse" role="tabpanel" aria-labelledby="heading2" data-parent="#accordion">
				      <div class="card-body">
				        <textarea class="form-control" rows="15">${defaultVo.source}</textarea>
				      </div>
				    </div>
				  </div>
				<!-- Vo -->
				<div class="card">
				    <div class="card-header" role="tab" id="heading3">
				      <h5 class="mb-0">
				        <a class="collapsed" data-toggle="collapse" href="#collapse3" aria-expanded="false" aria-controls="collapse3">
				          ${Vo.name}
				        </a>
				      </h5>
				    </div>
				    <div id="collapse3" class="collapse" role="tabpanel" aria-labelledby="heading3" data-parent="#accordion">
				      <div class="card-body">
				        <textarea class="form-control" rows="15">${Vo.source}</textarea>
				      </div>
				    </div>
				  </div>
				<!-- Mapper -->
				<div class="card">
				    <div class="card-header" role="tab" id="heading4">
				      <h5 class="mb-0">
				        <a class="collapsed" data-toggle="collapse" href="#collapse4" aria-expanded="false" aria-controls="collapse4">
				          ${mapper.name}
				        </a>
				      </h5>
				    </div>
				    <div id="collapse4" class="collapse" role="tabpanel" aria-labelledby="heading4" data-parent="#accordion">
				      <div class="card-body">
				        <textarea class="form-control" rows="15">${mapper.source}</textarea>
				      </div>
				    </div>
				  </div>
				<!-- Service -->
				<div class="card">
				    <div class="card-header" role="tab" id="heading5">
				      <h5 class="mb-0">
				        <a class="collapsed" data-toggle="collapse" href="#collapse5" aria-expanded="false" aria-controls="collapse5">
				          ${service.name}
				        </a>
				      </h5>
				    </div>
				    <div id="collapse5" class="collapse" role="tabpanel" aria-labelledby="heading5" data-parent="#accordion">
				      <div class="card-body">
				        <textarea class="form-control" rows="15">${service.source}</textarea>
				      </div>
				    </div>
				  </div>
				<!-- ServiceImpl -->
				<div class="card">
				    <div class="card-header" role="tab" id="heading6">
				      <h5 class="mb-0">
				        <a class="collapsed" data-toggle="collapse" href="#collapse6" aria-expanded="false" aria-controls="collapse6">
				          ${serviceImpl.name}
				        </a>
				      </h5>
				    </div>
				    <div id="collapse6" class="collapse" role="tabpanel" aria-labelledby="heading6" data-parent="#accordion">
				      <div class="card-body">
				        <textarea class="form-control" rows="15">${serviceImpl.source}</textarea>
				      </div>
				    </div>
				  </div>
				<!-- Controller -->
				<div class="card">
				    <div class="card-header" role="tab" id="heading7">
				      <h5 class="mb-0">
				        <a class="collapsed" data-toggle="collapse" href="#collapse7" aria-expanded="false" aria-controls="collapse7">
				          ${controller.name}
				        </a>
				      </h5>
				    </div>
				    <div id="collapse7" class="collapse" role="tabpanel" aria-labelledby="heading7" data-parent="#accordion">
				      <div class="card-body">
				        <textarea class="form-control" rows="15">${controller.source}</textarea>
				      </div>
				    </div>
				  </div>  
			</div>
		</form>
	</div>
</body>
</html>