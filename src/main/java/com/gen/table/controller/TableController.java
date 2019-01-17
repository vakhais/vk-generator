package com.gen.table.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gen.table.mapper.TableMapper;
import com.gen.table.repository.TableRepository;
import com.gen.table.vo.GenVo;

import freemarker.cache.ClassTemplateLoader;
import freemarker.cache.TemplateLoader;
import freemarker.core.ParseException;
import freemarker.template.Configuration;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateNotFoundException;

@Controller
public class TableController {

	@Autowired
	private TableMapper tableMapper;
	
	@RequestMapping(value = "/")
	public String root (ModelMap model) throws Exception {
		
		List<Map> list = (List<Map>) tableMapper.selectTableList();
		
		model.addAttribute("tableList", list);
		
		return "viewTest";
	}
	
	@RequestMapping(value = "TableColumnList.do")
	public String tableColumnList(@RequestParam("tableNm") String tableNm, @RequestParam("tableComment") String tableComment,
			ModelMap model) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("tableNm", tableNm);
		param.put("fix", "#");
		
		List<Map> list = (List<Map>) tableMapper.selectTableColumnList(param);
		model.addAttribute("colList", list);
		
		return "tableColumnList";
	}
	
	@RequestMapping(value = "SourceGen.do")
	public String SourceGen(GenVo genVo, ModelMap model) throws Exception {
		Map map = new HashMap();
		Map param = new HashMap();
		Configuration cfg = new Configuration();
		cfg.setClassForTemplateLoading(this.getClass(), "/templates/");
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tableNm", genVo.getTableNm());
		params.put("fix", "#");
		
		List<Map> list = (List<Map>) tableMapper.selectTableColumnList(params);
		List<Map> pkList = (List<Map>) tableMapper.selectTablePkColumnList(params);
		param.put("genVo", genVo);
		param.put("colList", list);
		param.put("pkColList", pkList);
		
		System.out.println("COL SIZE :" + list.size());

		//XML 생성
		Template temp = cfg.getTemplate("mapperXml.ftl");
		String text = FreeMarkerTemplateUtils.processTemplateIntoString(temp, param);
		map.put("name", genVo.getClassName() + "Mapper.xml");
		map.put("source", text);
		model.addAttribute("mapperXml", map);
		
		//DEFAULT VO 생성
		map = new HashMap();
		Template temp2 = cfg.getTemplate("defalutVo.ftl");
		String text2 = FreeMarkerTemplateUtils.processTemplateIntoString(temp2, param);
		map.put("name", genVo.getClassName() + "DefaultVo.java");
		map.put("source", text2);
		model.addAttribute("defaultVo", map);
		
		//VO 생성
		map = new HashMap();
		Template temp3 = cfg.getTemplate("Vo.ftl");
		String text3 = FreeMarkerTemplateUtils.processTemplateIntoString(temp3, param);
		map.put("name", genVo.getClassName() + "Vo.java");
		map.put("source", text3);
		model.addAttribute("Vo", map);
		
		//MapperJava 생성
		map = new HashMap();
		Template temp4 = cfg.getTemplate("mapper.ftl");
		String text4 = FreeMarkerTemplateUtils.processTemplateIntoString(temp4, param);
		map.put("name", genVo.getClassName() + "Mapper.java");
		map.put("source", text4);
		model.addAttribute("mapper", map);
		
		//Service 생성
		map = new HashMap();
		Template temp5 = cfg.getTemplate("service.ftl");
		String text5 = FreeMarkerTemplateUtils.processTemplateIntoString(temp5, param);
		map.put("name", genVo.getClassName() + "Service.java");
		map.put("source", text5);
		model.addAttribute("service", map);
		
		//ServiceImpl 생성
		map = new HashMap();
		Template temp6 = cfg.getTemplate("serviceImpl.ftl");
		String text6 = FreeMarkerTemplateUtils.processTemplateIntoString(temp6, param);
		map.put("name", genVo.getClassName() + "ServiceImpl.java");
		map.put("source", text6);
		model.addAttribute("serviceImpl", map);
		
		//Controller 생성
		map = new HashMap();
		Template temp7 = cfg.getTemplate("controller.ftl");
		String text7 = FreeMarkerTemplateUtils.processTemplateIntoString(temp7, param);
		map.put("name", genVo.getClassName() + "Controller.java");
		map.put("source", text7);
		model.addAttribute("controller", map);
		
		return "resultSource";
	}
}
