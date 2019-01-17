package ${genVo.packageName}.web;

import java.util.List;
import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import ${genVo.packageName}.vo.${genVo.className}DefaultVo;
import ${genVo.packageName}.vo.${genVo.className}Vo;
import ${genVo.packageName}.service.${genVo.className}Service;

import zet.framework.spring.dataaccess.util.DataMap;
import zet.framework.spring.validator.ValidationHelper;
import zet.framework.spring.validator.ValidationResponse;
import zet.framework.spring.web.AbstractController;

/**
 * <pre>
 * Class Name  : ${genVo.className}Controller.java
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
@RequestMapping(value = "${genVo.requestMappingUrl}")
@Controller(value = "${genVo.className?uncap_first}Controller")
public class ${genVo.className}Controller extends AbstractController {

	@Resource(name = "${genVo.className?uncap_first}Service")
    private ${genVo.className}Service ${genVo.className?uncap_first}Service;
    
    /**
     * ${genVo.description} 의 목록을 조회합니다.
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     * @author ${genVo.authorName}
     */
    @RequestMapping(value = "${genVo.className}List.do")
    public String select${genVo.className}List(@ModelAttribute("searchVo") ${genVo.className}DefaultVo searchVo, ModelMap model) throws Exception {
        List<DataMap> ${genVo.className?uncap_first}List = this.${genVo.className?uncap_first}Service.selectList(searchVo);
        model.addAttribute("resultList", ${genVo.className?uncap_first}List);

        return "${genVo.requestMappingUrl}/${genVo.className}List";
    }
    
    /**
     * ${genVo.description} 등록 화면을 출력합니다.
     *
     * @param searchVo
     * @param model
     * @return
     * @throws Exception
     * @author ${genVo.authorName}
     */
    @RequestMapping(value = "${genVo.className}InsertForm.do")
    public String select${genVo.className}Form(@ModelAttribute("searchVo") ${genVo.className}DefaultVo searchVo, ModelMap model) throws Exception {
        model.addAttribute("resultMap", new DataMap());
        super.setCmd(model, Cmd.Insert);

        return "${genVo.requestMappingUrl}/${genVo.className}Form";
    }
    
    /**
     * ${genVo.description} 수정 화면을 출력합니다.
     *
     * @param searchVo
     * @param model
     * @return
     * @throws Exception
     * @author ${genVo.authorName}
     */
    @RequestMapping(value = "${genVo.className}UpdateForm.do")
    public String select${genVo.className}UpdateForm(@ModelAttribute("${genVo.className?uncap_first}Vo") ${genVo.className}Vo ${genVo.className?uncap_first}Vo, @ModelAttribute("searchVo") ${genVo.className}DefaultVo searchVo,
            ModelMap model) throws Exception {
        model.addAttribute("resultMap", this.${genVo.className?uncap_first}Service.select(${genVo.className?uncap_first}Vo));
        super.setCmd(model, Cmd.Update);

        return "${genVo.requestMappingUrl}/${genVo.className}Form";
    }
    
    /**
     * ${genVo.description} 을/를 입력 합니다.
     *
     * @param searchVo
     * @param ${genVo.className?uncap_first}Vo
     * @param bindingResult
     * @param status
     * @return
     * @throws Exception
     * @author ${genVo.authorName}
     */
    @ResponseBody
    @RequestMapping(value = "${genVo.className}Insert.do")
    public ValidationResponse insert${genVo.className}(@ModelAttribute("searchVo") ${genVo.className}DefaultVo searchVo, @Valid ${genVo.className}Vo ${genVo.className?uncap_first}Vo,
            BindingResult bindingResult, SessionStatus status) throws Exception {
        ValidationHelper validationHelper = new ValidationHelper(bindingResult);

        if (!validationHelper.hasErrors()) {
            this.${genVo.className?uncap_first}Service.insert(${genVo.className?uncap_first}Vo);

            status.setComplete();
            validationHelper.setResultMessage(super.baseMessageSource.getMessage("result.message.insert"));
        }

        return validationHelper.getValidationResponse();
    }
    
    /**
     * 선택된 ${genVo.description} 을/를 수정합니다.
     *
     * @param searchVo
     * @param ${genVo.className?uncap_first}Vo
     * @param bindingResult
     * @param model
     * @param status
     * @return
     * @throws Exception
     * @author ${genVo.authorName}
     */
    @ResponseBody
    @RequestMapping(value = "${genVo.className}Update.do")
    public ValidationResponse update${genVo.className}(@ModelAttribute("searchVo") ${genVo.className}DefaultVo searchVo, @Valid ${genVo.className}Vo ${genVo.className?uncap_first}Vo,
            BindingResult bindingResult, ModelMap model, SessionStatus status) throws Exception {
        ValidationHelper validationHelper = new ValidationHelper(bindingResult);

        if (!validationHelper.hasErrors()) {
            this.${genVo.className?uncap_first}Service.update(${genVo.className?uncap_first}Vo);
            status.setComplete();

            validationHelper.setResultMessage(super.baseMessageSource.getMessage("result.message.update"));
        }

        return validationHelper.getValidationResponse();
    }
    
    /**
     * 선택된 ${genVo.description} 을/를 삭제합니다.
     *
     * @param ${genVo.className?uncap_first}Vo
     * @param searchVo
     * @param status
     * @return
     * @throws Exception
     * @author ${genVo.authorName}
     */
    @ResponseBody
    @RequestMapping(value = "${genVo.className}Delete.do")
    public ValidationResponse delete${genVo.className}(${genVo.className}Vo ${genVo.className?uncap_first}Vo, @ModelAttribute("searchVo") ${genVo.className}DefaultVo searchVo, SessionStatus status) throws Exception {
        ValidationHelper validationHelper = new ValidationHelper();

        if (!validationHelper.hasErrors()) {
            this.${genVo.className?uncap_first}Service.delete(${genVo.className?uncap_first}Vo);
            status.setComplete();

            validationHelper.setResultMessage(super.baseMessageSource.getMessage("result.message.delete"));
        }

        return validationHelper.getValidationResponse();
    }

}