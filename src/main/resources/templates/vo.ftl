package ${genVo.packageName}.vo;

<#compress>
<#list colList as col>
<#if col.data_type == 'date'>import java.util.Date;<#break></#if>
<#if col.data_type == 'datetime'>import java.util.Date;<#break></#if>
<#if col.data_type == 'time'>import java.util.Date;<#break></#if>
<#if col.data_type == 'timestamp'>import java.util.Date;<#break></#if>
</#list>
<#list colList as col>
	<#if col.nullable == 'NO'>
		<#if col.data_type == 'char'>import org.hibernate.validator.constraints.NotEmpty;<#break></#if>
		<#if col.data_type == 'blob'>import org.hibernate.validator.constraints.NotEmpty;<#break></#if>
		<#if col.data_type == 'text'>import org.hibernate.validator.constraints.NotEmpty;<#break></#if>
		<#if col.data_type == 'varchar'>import org.hibernate.validator.constraints.NotEmpty;<#break></#if>
		<#if col.data_type == 'date'>import org.hibernate.validator.constraints.NotEmpty;<#break></#if>
		<#if col.data_type == 'datetime'>import org.hibernate.validator.constraints.NotEmpty;<#break></#if>
		<#if col.data_type == 'time'>import org.hibernate.validator.constraints.NotEmpty;<#break></#if>
		<#if col.data_type == 'timestamp'>import org.hibernate.validator.constraints.NotEmpty;<#break></#if>
	</#if>
</#list>
</#compress>


/**
 * <pre>
 * Class Name  : ${genVo.className}Vo.java
 * Description : ${genVo.description}
 * Modification Information
 *
 *    수정일　　　 　        수정자　　　        수정내용
 *    -------------   ----------   ---------------------------
 *    ${.now?string('yyyy. MM. dd.')}    ${genVo.authorName}         최초생성
 * </pre>
 *
 * @author ${genVo.authorName}
 * @since ${.now?string('yyyy. MM. dd.')}
 * @version 1.0
 *
 * Copyright (C) ${.now?string('yyyy')} by VAKHA All right reserved.
 */
@lombok.Getter @lombok.Setter
public class ${genVo.className}Vo extends ${genVo.className}DefaultVo {

    private static final long serialVersionUID = 1L;
	<#compress>
	<#list colList as col>
	// ${col.column_comment}
	<#if col.nullable == 'NO'>
		<#if col.data_type == 'char'>@NotEmpty(message = "${col.column_comment}은 {field.required}")</#if>
		<#if col.data_type == 'blob'>@NotEmpty(message = "${col.column_comment}은 {field.required}")</#if>
		<#if col.data_type == 'text'>@NotEmpty(message = "${col.column_comment}은 {field.required}")</#if>
		<#if col.data_type == 'varchar'>@NotEmpty(message = "${col.column_comment}은 {field.required}")</#if>
		<#if col.data_type == 'date'>@NotEmpty(message = "${col.column_comment}은 {field.required}")</#if>
		<#if col.data_type == 'datetime'>@NotEmpty(message = "${col.column_comment}은 {field.required}")</#if>
		<#if col.data_type == 'time'>@NotEmpty(message = "${col.column_comment}은 {field.required}")</#if>
		<#if col.data_type == 'timestamp'>@NotEmpty(message = "${col.column_comment}은 {field.required}")</#if>
	</#if>
	<#if col.data_type == 'int'>private Integer ${col.GENERATOR_COL};</#if>
	<#if col.data_type == 'smallint'>private Integer ${col.GENERATOR_COL};</#if>
	<#if col.data_type == 'char'>private String ${col.GENERATOR_COL};</#if>
	<#if col.data_type == 'blob'>private String ${col.GENERATOR_COL};</#if>
	<#if col.data_type == 'text'>private String ${col.GENERATOR_COL};</#if>
	<#if col.data_type == 'varchar'>private String ${col.GENERATOR_COL};</#if>
	<#if col.data_type == 'date'>private Date ${col.GENERATOR_COL};</#if>
	<#if col.data_type == 'datetime'>private Date ${col.GENERATOR_COL};</#if>
	<#if col.data_type == 'time'>private Date ${col.GENERATOR_COL};</#if>
	<#if col.data_type == 'timestamp'>private Date ${col.GENERATOR_COL};</#if>
	<#if col.data_type == 'double'>private Double ${col.GENERATOR_COL};</#if>
	<#if col.data_type == 'float'>private Double ${col.GENERATOR_COL};</#if>
	</#list>
	</#compress>

}