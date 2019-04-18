package ${p.basePackage}.web;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.anfachina.common.dto.*;
import com.anfachina.aflc.GlobalException.AflcErrorStatus;
import com.anfachina.aflc.GlobalException.ExceptionConditions;
import com.fangjian.framework.common.PageInfo;
import com.fangjian.framework.common.web.BaseMybatisController;
import com.anfachina.aflc.security.TokenService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import lombok.extern.slf4j.Slf4j;
import ${p.basePackage}.query.${p.bizPackage}.${p.className}Query;
import ${p.basePackage}.entity.${p.bizPackage}.${p.className};
import ${p.basePackage}.service.${p.bizPackage}.${p.className}Service;

/**
 *
 * @ClassName描述:${p.code_name}</br>
 * @Description：${p.code_name}实体表controller层核心代码</br>
 * @author：lingyuwang</br>
 * @date:${.now}</br>
 */
@Slf4j
@RestController
@RequestMapping("/${p.bizPackage}/${p.lowerName}/v1")
@Api(value = "/${p.bizPackage}/${p.lowerName}/v1", tags="${p.code_name}")
public class ${p.className}Controller extends BaseMybatisController{

	<#--private final static Logger log= Logger.getLogger(${p.className}Controller.class);-->

	//注入${p.code_name}服务service
	@Autowired(required=false)
	private ${p.className}Service ${p.lowerName}Service;

	@Autowired
	private TokenService tokenService;

	/**
	 * 根据${p.pkName}获取${p.code_name}
	 * @param ${p.pkName}
	 * @return vo
	 * @throws Exception
	 */
	@GetMapping(value = "/{${p.pkName}}")
	@ApiOperation(value = "根据${p.pkName}获取${p.code_name}", notes = "根据${p.pkName}获取${p.code_name}")
	@ApiImplicitParams({
      @ApiImplicitParam(paramType = "query", dataType = "string", name = "access_token", value = "授权token", required = true)
    })
	public HttpResultVo<${p.className}> find${p.className}(@PathVariable("${p.pkName}") String ${p.pkName})throws Exception{
		log.info("进入到controller");
		ExceptionConditions.checkNotNull(${p.pkName}, AflcErrorStatus.ILLEGAL_ARGUMENT,"参数不能为空! ");
		<#--HttpResultVo vo = new HttpResultVo();-->
		${p.className} po = this.${p.lowerName}Service.selectByPrimaryKey(${p.pkName});
		if(po==null){
			<#--vo.setStatus(AnfaCommonServiceStatus.STATUS_SUCCESS);-->
			<#--vo.setText("无任何返回值");-->
			<#--vo.setData(null);-->
			<#--vo.setErrorInfo("也许传输了错误的参数");-->
			return fail("也许传输了错误的参数");
		}else{
			<#--vo.setStatus(AnfaCommonServiceStatus.FAIL_SUCCESS);-->
			<#--vo.setText("success");-->
			<#--vo.setData(po);-->
			<#--vo.setErrorInfo(null);-->
			return successByData(po);
		}
		<#--return vo;-->
	}

	/**
	 * 根据条件查询获取${p.code_name}列表
	 * @param dto 查询对象
	 * @return vo
	 * @throws Exception
	 */
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ApiOperation(value = "获取${p.code_name}列表", notes = "根据条件获取${p.code_name}列表")
	@ApiImplicitParams({
      @ApiImplicitParam(paramType = "query", dataType = "string", name = "access_token", value = "授权token", required = true)
    })
	public HttpResultVo<BasePage<${p.className}>> getlist(@RequestBody BaseDto<${p.className}Query> dto) throws Exception{
		log.info("获取${p.code_name}-分页数据");
		List<${p.className}> list = this.${p.lowerName}Service.findPageListBySQL(dto.getCurrentPage(),dto.getPageSize(),dto.getVo());
		PageInfo pageInfo = ${p.lowerName}Service.findPageInfoBySQL(dto.getCurrentPage(), dto.getPageSize(), dto.getVo());

		BasePage<${p.className}> carrierPage = new BasePage<>();
        carrierPage.setCurrentPage(pageInfo.getCurrentPage());
        carrierPage.setPageSize(pageInfo.getPageSize());
        carrierPage.setList(list);
        carrierPage.setTotalCount(pageInfo.getTotalCount());
        carrierPage.setTotalPage(pageInfo.getTotalPage());

        <#--HttpResultVo vo = success();-->
        <#--vo.setData(carrierPage);-->
        return successByData(carrierPage);
	}

	/**
	 * 新增${p.code_name}
	 * @param model
	 * @return vo
	 * @throws Exception
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ApiOperation(value = "新增${p.code_name}", notes = "新增${p.code_name}")
	@ApiImplicitParams({
      @ApiImplicitParam(paramType = "query", dataType = "string", name = "access_token", value = "授权token", required = true)
		,@ApiImplicitParam(paramType = "header", dataType = "String", name = "user_token", value = "用户授权token", required = true)
    })
	public HttpResultVo<${p.className}> add${p.className}(@RequestBody ${p.className} model) {
		log.info("进入到controller");
		ExceptionConditions.checkNotNull(model, AflcErrorStatus.ILLEGAL_ARGUMENT,"参数不能为空! ");
		<#--HttpResultVo vo = new HttpResultVo();-->
        try {
            this.${p.lowerName}Service.insertReturnIdVlues(model);
            System.out.println(model.get${p.pk_name}());
            <#--vo.setStatus(AnfaCommonServiceStatus.STATUS_SUCCESS);-->
            <#--vo.setText("success");-->
            <#--vo.setData(model);-->
            <#--vo.setErrorInfo(null);-->
			return successByData(model);
        } catch (Exception e) {
            e.printStackTrace();
            <#--vo.setStatus(AnfaCommonServiceStatus.FAIL_SUCCESS);-->
            <#--vo.setText("无任何返回值");-->
            <#--vo.setData(null);-->
            <#--vo.setErrorInfo("也许传输了错误的参数");-->
			return fail("也许传输了错误的参数");
        }
		<#--return vo;-->
    }

    /**
	 * 修改${p.code_name}
	 * @param model
	 * @return vo
	 * @throws Exception
	 */
	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	@ApiOperation(value = "修改${p.code_name}", notes = "根据id修改${p.code_name}")
	@ApiImplicitParams({
      @ApiImplicitParam(paramType = "query", dataType = "string", name = "access_token", value = "授权token", required = true)
		,@ApiImplicitParam(paramType = "header", dataType = "String", name = "user_token", value = "用户授权token", required = true)
    })
	public HttpResultVo<${p.className}> update${p.className}(@RequestBody ${p.className} model){
		log.info("进入到controller");
		ExceptionConditions.checkNotNull(model, AflcErrorStatus.ILLEGAL_ARGUMENT,"参数不能为空! ");
		<#--HttpResultVo vo = new HttpResultVo();-->
		Integer i = this.${p.lowerName}Service.updateEntryByPrimaryKey(model);
		if(i>0){
			<#--vo.setStatus(AnfaCommonServiceStatus.STATUS_SUCCESS);-->
			<#--vo.setText("success");-->
			<#--vo.setData(model);-->
			<#--vo.setErrorInfo(null);-->
			return successByData(model);
		}else {
			<#--vo.setStatus(AnfaCommonServiceStatus.FAIL_SUCCESS);-->
			<#--vo.setText("无修改");-->
			<#--vo.setData(null);-->
			<#--vo.setErrorInfo("也许传输了错误的参数");-->
			return fail("也许传输了错误的参数");
		}
		<#--return vo;-->
	}

	/**
	 * 删除${p.code_name}
	 * @param ${p.pkName}
	 * @return vo
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete/{${p.pkName}}", method = RequestMethod.DELETE)
	@ApiOperation(value = "删除${p.code_name}", notes = "根据${p.pkName}删除${p.code_name}")
	@ApiImplicitParams({
      @ApiImplicitParam(paramType = "query", dataType = "string", name = "access_token", value = "授权token", required = true)
		,@ApiImplicitParam(paramType = "header", dataType = "String", name = "user_token", value = "用户授权token", required = true)
    })
	public HttpResultVo<Integer> delete${p.className}(@PathVariable("${p.pkName}") String ${p.pkName}){
		log.info("进入到controller");
		ExceptionConditions.checkNotNull(${p.pkName}, AflcErrorStatus.ILLEGAL_ARGUMENT,"参数不能为空! ");
		<#--HttpResultVo vo = new HttpResultVo();-->
		Integer i = this.${p.lowerName}Service.deleteEntryByPrimaryKey(${p.pkName});
		if(i>0){
			<#--vo.setStatus(AnfaCommonServiceStatus.STATUS_SUCCESS);-->
			<#--vo.setText("success");-->
			<#--vo.setData(i);-->
			<#--vo.setErrorInfo(null);-->
			return successByData(i);
		}else {
			<#--vo.setStatus(AnfaCommonServiceStatus.FAIL_SUCCESS);-->
			<#--vo.setText("无删除");-->
			<#--vo.setData(null);-->
			<#--vo.setErrorInfo("也许传输了错误的参数");-->
			return fail("也许传输了错误的参数");
		}
		<#--return vo;-->
	}

}
