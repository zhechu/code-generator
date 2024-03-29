package com.wise.framework.core.commom;

import java.util.HashMap;
import java.util.Map;
/**
 * mysql中的类型在mybatis中配置文件的配置对应关系
 * @author 方坚
 */
public class GciCodeTypeMap {
	    //构造函数初始化的时候静态加载
		//mybatis 配置文件中使用的jdbcType
		//<result column="password" property="password" jdbcType="VARCHAR" />
		public static  Map<String, String> getMySqlTypeBySqlType(){
			//Map(mysqlType,JdbcType)根式Map(int,Integer);
		    Map<String, String> tp = new HashMap<String, String>();
		    tp.put("int", "INTEGER");
		    tp.put("double", "NUMERIC");
		    tp.put("date", "DATE");
		    tp.put("long", "REAL");
		    tp.put("char", "CHAR");
		    tp.put("datetime", "TIMESTAMP");
		    tp.put("varchar", "VARCHAR");
		    tp.put("float", "REAL");
		    tp.put("bigint", "BIGINT");
		    tp.put("tinyint", "BIT");
		    tp.put("blob", "BLOB");
		    tp.put("decimal", "DECIMAL");
		    tp.put("timestamp", "TIMESTAMP");
		    tp.put("enum", "VARCHAR");
		    tp.put("text", "VARCHAR");//所有text格式mybatis都进行特殊处理，新增和查看都按照string类型处理。by 2017-4-13 fangjian
		    tp.put("", "VARCHAR");
			return tp;
		}
		//构造函数初始化的时候静态加载
		//get set方法中的java类型
		public static  Map<String, String> getJavaTypeBySqlType(){
			//Map(mysqlType,JdbcType)根式Map(int,Integer);
		    Map<String, String> tp = new HashMap<String, String>();
		    tp.put("int", "Integer");
		    tp.put("double", "Double");
		    tp.put("date", "java.util.Date");
		    tp.put("long", "Float");
		    tp.put("bigint", "long");
		    tp.put("char", "Character");
		    tp.put("datetime", "java.util.Date");
		    tp.put("varchar", "String");
		    tp.put("float", "Double");
		    tp.put("blob", "com.mysql.jdbc.Blob");
		    tp.put("decimal", "BigDecimal");
		    tp.put("tinyint", "boolean");
		    tp.put("timestamp", "java.util.Date");
		    tp.put("text", "String");
		    tp.put("enum", "String");
		    tp.put("", "String");
			return tp;
		}
		
		/**
		 * 获取jsValidate的验证类型
		 * @return
		 */
		public static  Map<String, String> getValidateDateType(){
		    Map<String, String> tp = new HashMap<String, String>();
		    tp.put("int", "Integer");
		    tp.put("double", "Double");
		    tp.put("date", "Date");
		    tp.put("datetime", "Date");
		    tp.put("timestamp", "Date");
		    tp.put("long", "Integer");
		    tp.put("char", "Chinese");
		    tp.put("varchar", "Require");
		    tp.put("float", "Double");
		    tp.put("blob", "Chinese");
		    tp.put("bigint", "Integer");
		    tp.put("tinyint", "Integer");
		    tp.put("decimal", "Double");//货币格式
		    tp.put("enum", "Require");
		    tp.put("text", "Require");
		    tp.put("", "Require");
			return tp;
		}
}
