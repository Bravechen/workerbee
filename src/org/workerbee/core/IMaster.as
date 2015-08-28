package org.workerbee.core
{
	import flash.events.IEventDispatcher;
	
	import org.workerbee.manager.IInteractiveManager;
	import org.workerbee.manager.IServiceManager;
	
	public interface IMaster extends IEventDispatcher
	{
		/**服务类管理类**/
		function get serviceManager():IServiceManager;
		/**交互类管理类**/
		function get interactiveManager():IInteractiveManager;
		/**注册用到的服务类**/
		function registerServices():void;
		/**注册用到的交互类**/
		function registerInteractives():void;
	}
}