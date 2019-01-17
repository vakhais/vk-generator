<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<!--
  Class Name  : ${genVo.className}Mapper.xml
  Description : ${genVo.description}
  Modification Information

    수정일            수정자         수정내용
   =============   ==========   ===========================
   ${.now?string('yyyy. MM. dd.')}    ${genVo.authorName}         최초생성

  @author ${genVo.authorName}
  @since ${.now?string('yyyy. MM. dd.')}
  @version 1.0

  Copyright (C) ${.now?string('yyyy')} by VAKHA All right reserved.
-->

<mapper namespace="${genVo.packageName}.mapper.${genVo.className}Mapper">
    <sql id="selectSearchWhere">

    </sql>

    <!-- ${genVo.description} 페이지 목록 -->
    <select id="selectList" resultType="dataMap">
        SELECT
        		<#list colList as col>
        		<#if col_index  &gt; 0>,</#if>${col.COL}  /* ${col.column_comment} */<#assign comma2=",">
        		</#list>
        FROM    ${genVo.tableNm}
        <include refid="selectSearchWhere" />
	</select>

    <!-- ${genVo.description} 전체 행 수 -->
    <select id="selectTotalCount" resultType="int">
        SELECT  COUNT(1)
        FROM    ${genVo.tableNm}
        <include refid="selectSearchWhere" />
    </select>

    <!-- ${genVo.description} 보기 -->
    <select id="select" resultType="dataMap">
        SELECT
        		<#list colList as col>
        		<#if col_index  &gt; 0>,</#if>${col.COL}        /* ${col.column_comment} */<#assign comma2=",">
        		</#list>
        FROM    ${genVo.tableNm}
        WHERE   1 = 1
        		<#list pkColList as pk>
        ${andd1!}${pk.COL} = ${pk.column_ex}<#assign andd1 = "AND ">
                </#list>
    </select>
    
    <!-- ${genVo.description} 입력 -->
    <insert id="insert">
        INSERT INTO ${genVo.tableNm} (
             <#list colList as col>
    		 <#if col_index  &gt; 0>,</#if>${col.COL}  /* ${col.column_comment} */
    		 </#list>
        ) VALUES (
             <#list colList as col>
    		 <#if col_index  &gt; 0>,</#if>${col.column_ex}
    		 </#list>
        )
    </insert>
    
    <!-- ${genVo.description} 수정 -->
    <update id="update">
    	UPDATE  ${genVo.tableNm}
    	SET     
    			<#list colList as col>
    			<#if col_index  &gt; 0>,</#if>${col.COL}  = ${col.column_ex}  /* ${col.column_comment} */<#assign comma2=",">
				</#list>
    	WHERE   1 = 1
    			<#list pkColList as pk>
        ${andd1!}${pk.COL} = ${pk.column_ex}<#assign andd1 = "AND ">
                </#list>	
    </update>
    
    <!-- ${genVo.description} 삭제 -->
    <delete id="delete">
        DELETE
        FROM    ${genVo.tableNm}
        WHERE
        		<#list pkColList as pk>
        		<#if pk_index  &gt; 0>AND </#if>${pk.COL} = ${pk.column_ex}
                </#list>
    </delete>

</mapper>