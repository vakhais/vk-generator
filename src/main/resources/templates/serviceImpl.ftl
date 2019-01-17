package ${genVo.packageName}.service.impl;

import ${genVo.packageName}.vo.${genVo.className}DefaultVo;
import ${genVo.packageName}.vo.${genVo.className}Vo;
import ${genVo.packageName}.mapper.${genVo.className}Mapper;
import ${genVo.packageName}.service.${genVo.className}Service;
import org.springframework.stereotype.Service;
import zet.framework.spring.dataaccess.util.DataMap;
import zet.framework.spring.service.impl.GenericServiceImpl;

/**
 * <pre>
 * Class Name  : ${genVo.className}ServiceImpl.java
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
 @Service(value = "${genVo.className?uncap_first}Service")
public class ${genVo.className}ServiceImpl extends
        GenericServiceImpl<${genVo.className}Mapper, DataMap, ${genVo.className}Vo, ${genVo.className}DefaultVo> implements
        ${genVo.className}Service {
}