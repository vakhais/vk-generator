package ${genVo.packageName}.vo;

import zet.framework.spring.vo.PaginationVo;

/**
 * <pre>
 * Class Name  : ${genVo.className}DefaultVo.java
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
public class ${genVo.className}DefaultVo extends PaginationVo {

    private static final long serialVersionUID = 1L;

    /** 검색조건 */
    private String searchCondition = "";

    /** 검색 Keyword */
    private String searchKeyword = "";

    /** 검색 사용여부 */
    private String searchUseYn = "";

}