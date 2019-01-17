package ${genVo.packageName}.mapper;

import ${genVo.packageName}.vo.${genVo.className}DefaultVo;
import ${genVo.packageName}.vo.${genVo.className}Vo;
import zet.framework.spring.dataaccess.Mapper;
import zet.framework.spring.dataaccess.util.DataMap;
import zet.framework.spring.mapper.GenericMapper;

/**
 * <pre>
 * Class Name  : ${genVo.className}Mapper.java
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
@Mapper(value = "${genVo.className}Mapper")
public interface ${genVo.className}Mapper extends GenericMapper<DataMap, ${genVo.className}Vo, ${genVo.className}DefaultVo> {
}