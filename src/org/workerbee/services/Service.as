package org.workerbee.services
{	
	import flash.events.EventDispatcher;
	
	import org.workerbee.core.EventTransporter;
	import org.workerbee.core.IClearableObject;
	
	/**
	 * 服务类
	 * <p>Service完成类似mvc中model层任务，权限低于容器类和interactive类。<br />
	 * 服务类负责与数据、资源相关的任务，例如：http请求，获取flashvars，和js交互，加载本地资源，文件，图片和swf等。也做一些数据处理保存，为流程控制提供数据等任务。<br />
	 * 创建service类同样需要权限，只有核心容器类，文档类，交互类可以直接创建服务类。<br />
	 * Service的重点在于提供而不在于控制。可以加工数据和资源，并且提供数据，但不应对流程的管理加以影响。</p>
	 * <p>
	 * 		Service也是一个功能模块的入口。当设计一个具有一定功能的模块时，可以通过继承Service类和实现IService接口，提供可以接入框架的接口。
	 * 在具体使用中，创建相应模块或者类库的Service或IService的子类使用模块的功能。
	 * </p>
	 *
	 * @productversion workbee 1.0
	 * @author	晨光熹微<br />
	 * date		2012.11
	 */
	public class Service extends EventDispatcher implements IService,IClearableObject
	{
		protected var _executing:Boolean = false;

		public function get executing():Boolean
		{
			return _executing;
		}
		
		protected var eventTranspartor:EventTransporter;
		
		public function Service()
		{
			initService();
		}

		public function termiClear():void
		{
			eventTranspartor = null;
		}
		public function clearDone():void
		{
		}
		
		public function resetNode():void
		{			
		}

		override public function toString():String
		{
			return "##"+"Service"+"##";
		}
		/**
		 * 初始化服务类
		 */
		protected function initService():void
		{
			eventTranspartor = EventTransporter.getInstance();
		}
	}
}