package ${genVo.packageName}.service;

import ${genVo.packageName}.vo.${genVo.className}DefaultVo;
import ${genVo.packageName}.vo.${genVo.className}Vo;
import zet.framework.spring.dataaccess.util.DataMap;
import zet.framework.spring.service.GenericService;

/**
 * <pre>
 * Class Name  : ${genVo.className}Service.java
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
public interface ${genVo.className}Service extends GenericService<DataMap, ${genVo.className}Vo, ${genVo.className}DefaultVo> {
}