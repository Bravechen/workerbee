package org.workerbee.core
{
	/**
	 * 框架的核心入口类
	 * 
	 * **/
	public interface IBeehive
	{
		/**
		 * 初始化框架
		 * @param queenBee 自定义的核心类。可以自定义扩展自<code>org.workerbee.core.QueenBee</code>类。框架默认创建QueenBee类的实例。
		 * **/
		function initialize(queenBee:IMaster=null):void;
	}
}