package org.workerbee.manager
{
	import org.workerbee.interactive.IInteractive;

	public interface IInteractiveManager
	{
		/**
		 * 注册类
		 * @param	interfaceName 类识别标识
		 * @param	className 类全名称
		 **/
		/**
		 * 注册交互类
		 * @param	className 类全名称
		 * @param	executant IInteractive对象实例，默认为空。此时框架默认为当第一次使用该对象时创建对象，getInteractive()方法将会检查对象是否可被创建。
		 * 特别的，只有当IInteractive实例被创建出来后，框架才真正将他进行注册(isRegistered()会返回true)。
		 **/
		function registerInteractive(className:String,executant:IInteractive=null):void;
		/**
		 * 获取交互类
		 * @param	interfaceName 接口名
		 * @return 类实例
		 **/
		function getInteractive(className:String):IInteractive;
		/**
		 * 交互类是否已经注册
		 * @param	interfaceName 接口名
		 * @return	true/false
		 **/
		function isRegistered(className:String):Boolean;
	}
}