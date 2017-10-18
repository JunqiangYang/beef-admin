package com.code;

import codeGenerate.def.FtlDef;
import codeGenerate.factory.CodeGenerateFactory;


public class CodeUtil {

	/**

	CREATE TABLE `sys_user` (
			`id` int(11) NOT NULL auto_increment COMMENT 'id主键',
			`email` varchar(50) NOT NULL COMMENT '邮箱也是登录帐号',
			`pwd` varchar(50) default NULL COMMENT '登录密码',
			`nickName` varchar(50) default NULL COMMENT '昵称',
			`state` int(1) NOT NULL default '0' COMMENT '状态 0=可用,1=禁用',
			`loginCount` int(11) default NULL COMMENT '登录总次数',
			`loginTime` datetime default NULL COMMENT '最后登录时间',
			`deleted` int(1) NOT NULL default '0' COMMENT '删除状态 0=未删除,1=已删除',
			`createTime` datetime default NULL COMMENT '创建时间',
			`updateTime` datetime default NULL COMMENT '修改时间',
			`createBy` int(11) default NULL COMMENT '创建人',
			`updateBy` int(11) default NULL COMMENT '修改人',
			`superAdmin` int(1) NOT NULL default '0' COMMENT '是否超级管理员 0= 不是，1=是',
		PRIMARY KEY  (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	 创建表一定要有: comment

	 */


	public static void main(String[] args) {
		 /** 此处修改成你的 表名 和 中文注释***/
		 String tableName="t_goods_kind"; //
		 String codeName ="tGoodsKind";//中文注释  当然你用英文也是可以的
		 String entityPackage ="goodsKind";//实体包
		 String keyType = FtlDef.KEY_TYPE_01;//主键生成方式 01:UUID  02:自增
		CodeGenerateFactory.codeGenerate(tableName, codeName,entityPackage,keyType);
	}
}
