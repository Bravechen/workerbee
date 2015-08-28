package org.workerbee.manager
{	
	import org.workerbee.services.IService;

	/**
	 * 服务管理类接口
	 * 
	 **/
	public interface IServiceManager
	{
		/**
		 * 注册服务类
		 * @param	className 类全名称
		 * @param	executant IService对象实例，默认为空。此时框架默认为当第一次使用该对象时创建对象，getService()方法将会检查对象是否可被创建。
		 * 特别的，只有当IService实例被创建出来后，框架才真正将他进行注册(isRegistered()会返回true)。
		 **/
		function registerService(className:String,executant:IService=null):void;
		/**
		 * 获取服务
		 * @param	className 类的全名称
		 * @return	IService类实例
		 **/
		function getService(className:String):IService;
		/**
		 * 服务是否已经注册
		 * @param	interfaceName 接口名
		 * @return	true/false
		 **/
		function isRegistered(className:String):Boolean;
	}
}