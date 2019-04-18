package ${p.basePackage}.entity.${p.bizPackage};
import java.util.Date;
import java.math.BigDecimal;
import org.springframework.format.annotation.DateTimeFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import javax.validation.constraints.NotNull;
import lombok.Data;
/**
 *
 * 描述:${p.code_name}</br>
 * 功能：${p.code_name}实体表实体po</br>
 * 作者：lingyuwang</br>
 * 时间:${.now}</br>
 */
@Data
@ApiModel(value="${p.code_name}",description="${p.code_name}")
public class ${p.className} implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
<#list p.gci_columns as u>

 	<#if u.column_javatype == 'java.util.Date'>
 	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
 	</#if>
 	@ApiModelProperty(value="${u.column_comment}",name="${u.javaColumnFileNameCode}")
   	private ${u.column_javatype} ${u.javaColumnFileNameCode};
</#list>


}

