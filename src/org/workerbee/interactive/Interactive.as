package org.workerbee.interactive
{
	import flash.events.EventDispatcher;
	
	import org.workerbee.core.EventTransporter;
	import org.workerbee.core.IClearableObject;
	import org.workerbee.core.IMaster;
	import org.workerbee.core.wb_internal;

	/**
	 * 交互类，抽象类，对交互类可以使用的对外接口进行了限定，并提供了基本的属性和功能<br />
	 * 
	 * @productversion workerbee 1.0
	 * @author	晨光熹微 <br />
 	 * date		2012.7<br />
	 * */
	public class Interactive extends EventDispatcher implements IInteractive,IClearableObject
	{
		protected var eventTranspartor:EventTransporter;
		
		private var _queenBee:IMaster;

		public function get queenBee():IMaster
		{
			return _queenBee;
		}
		/**
		 * @private 
		 * queenBee对象，在此交互类被注册时会注入进来。
		 * **/
		wb_internal function set wb_queenBee(value:IMaster):void
		{
			_queenBee = value;
		}

		public function Interactive()
		{
			initialize();
		}
		
		public function termiClear():void
		{
			eventTranspartor = null;
			_queenBee = null;
		}

		public function clearDone():void
		{
		}
		
		public function resetNode():void
		{
		}

		/**
		 * 初始化交互对象
		 * **/
		protected function initialize():void
		{
			eventTranspartor = EventTransporter.getInstance();
		}
	}
}