<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%--
  Class Name  : ${genVo.className}List.jsp
  Description : ${genVo.description} 목록 페이지
  Modification Information
   
       수정일　　　 　　     수정자　　　      수정내용
    -------------   ----------   ---------------------------
    ${.now?string('yyyy. MM. dd.')}    ${genVo.authorName}         최초생성
  
   * @author  ${genVo.authorName}
   * @since   ${.now?string('yyyy. MM. dd.')}
  version 1.0
   
  Copyright (C) ${.now?string('yyyy')} by VAKHA All right reserved.
--%>

<%@ include file="/WEB-INF/jsp/common/include/CommonTags.jspf" %>

<script type="text/javascript" defer="defer">
$(function() {
    $('#searchKeyword').keydown(function (event){
        if (event.keyCode == 13) {
            fnCmdSearch();
            return;
        }
    });
});

function fnCmdInsertForm(groupCd) {
    $.commandSubmit({
        commandUrl   : 'CodeManageInsertForm.do',
        commandForm  : 'listForm',
        onBeforeSubmit : function () {
            $('#groupCd').val(groupCd);
        }
    });
}
function fnCmdUpdateForm(groupCd, code) {
    $.commandSubmit({
        commandUrl   : 'CodeManageUpdateForm.do',
        commandForm  : 'listForm',
      	onBeforeSubmit : function () {
        	$('#groupCd').val(groupCd);
        	$('#code').val(code);
        }
    });
}
function fnCmdList() {
	$('#listForm input[name=pageIndex]').val(1);
	$.commandSubmit({
        commandUrl   : 'CodeGroupManageList.do',
        commandForm  : 'listForm'
    });   
}

</script>

<manager:contentLayout>
    <uc:form id="listForm">
        <uc:hidden id="groupCd" />
        <uc:hidden id="code" />
        <uc:hidden id="pageIndex"       value="${param.pageIndex}" />
    
    	<uc:dataGrid var="itmeGroup" items="${codeGroupList}"  emptyMessage="목록이 없습니다.">
    	    <uc:columns>
    	       	 	<uc:column fieldName="groupCd"      title="그룹 코드" width="300"  bCssClass="al"/>
                    <uc:column fieldName="groupNm"      title="그룹 명"   width="*%"  bCssClass="al"/>
    				<uc:column fieldName="autoCreateYn" title="코드 생성" width="100"/>
                    <uc:column fieldName="cnt"          title="코드 개수" width="100"/>
                    <uc:column fieldName="useYn"        title="사용 여부" width="100"/>
            </uc:columns>
    	</uc:dataGrid>
    	
    	<div class="btnCon">
    		<a href="#none" onclick="fnCmdList()" title="<uc:message code="그룹 목록" />" ><span><uc:message code="그룹 목록" /></span></a>
    	</div>
    	<div class="btnCon">
    		<a href="#none" onclick="fnCmdInsertForm('${itmeGroup.groupCd}')"  class="btn3 plus"  data-text-on="<uc:message code="코드 등록" />" ><span><uc:message code="코드 등록" /></span></a>
    	</div>
       	<uc:dataGrid var="item" items="${resultList}" emptyMessage="목록이 없습니다.">
    	    <uc:columns>
    	        <uc:rowNumColumn title="No"  width="55" />
                <uc:column       title="코드" width="200"   bCssClass="al">
    				<a href="javascript:fnCmdUpdateForm('${item.groupCd}' , '${item.code}')"><c:out value="${item.code}" /></a>
    			</uc:column> 
    			<uc:column title="코드 명" bCssClass="al" width="*%">
    				<a href="javascript:fnCmdUpdateForm('${item.groupCd}' , '${item.code}')"><c:out value="${item.codeNm}" /></a>
    			</uc:column> 
                   <uc:column fieldName="codeOrder"   title="순서"     width="100"/>
                   <uc:column fieldName="useYn"       title="사용 여부" width="100"/>
             	</uc:columns>
    	</uc:dataGrid>
    </uc:form>
</manager:contentLayout>
