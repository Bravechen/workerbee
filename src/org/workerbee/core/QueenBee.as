package org.workerbee.core
{
	import flash.events.EventDispatcher;
	
	import org.workerbee.manager.IInteractiveManager;
	import org.workerbee.manager.IServiceManager;
	import org.workerbee.manager.InteractiveManager;
	import org.workerbee.manager.ServiceManager;

	use namespace wb_internal;
	/**
	 * 用来登录所用用到的interactive和service
	 * IMaster拥有最高控制权，通常只有一个。
	 * **/
	public class QueenBee extends EventDispatcher implements IMaster
	{
		protected var eventTransporter:EventTransporter;
		
		wb_internal var _serviceManager:IServiceManager;
		
		public function get serviceManager():IServiceManager
		{
			return _serviceManager;
		}

		wb_internal var _interactiveManager:IInteractiveManager;

		public function get interactiveManager():IInteractiveManager
		{
			return _interactiveManager;
		}
		
		public function registerServices():void
		{
			//override by subclass
		}

		public function registerInteractives():void
		{
			//override by subclass
		}
		
		public function QueenBee():void
		{
			eventTransporter = EventTransporter.getInstance();
		}
		
		wb_internal function initialize():void
		{
			_serviceManager = new ServiceManager();
			_interactiveManager = new InteractiveManager();
			InteractiveManager(_interactiveManager).queenBee = this;
			registerInteractives();
			registerServices();
		}
	}
}
