package org.workerbee.core
{
	import flash.events.EventDispatcher;

	/**
	 * 事件转发者
	 * <p>事件转发者主要用于在IInteractive和IService对象之间做一些必要的间接交互工作,交互类，服务类可以创建转发者。
	 * 事件转发者可以有效的在多个部分之间建立沟通关系，例如：在多个IInteractive之间,或者多个IService之间。并且保持松散耦合。<br />
	 * 但是过度的使用转发者却是不可取的，因为一方面他是单例模式，一个与某次交互不相关的对象却可以通过它来接受事件是不对的。<br />
	 * 另一方面，过多的类使用转发者破坏了原有层级的上报机制，加强了系统结构中相距较远的对象之间的关系，间接推高了耦合性。不利于维护和扩展。<br />
	 * 事件转发者是一个单例。
	 * </p>
	 *
	 * @productversion workbee 1.0
	 * @author	晨光熹微<br />
	 * date		2012.11
	 */
	public final class EventTransporter extends EventDispatcher
	{
		private static var instance:EventTransporter;
		public function EventTransporter(pvt:ETPrivateClass)
		{
		}
		/**实例化对象的方法
		 * @param	clientType 用户类型
		 * @return	EventTransporter实例
		 * **/
		public static function getInstance():EventTransporter
		{			
			if(EventTransporter.instance==null)
			{
				EventTransporter.instance = new EventTransporter(new ETPrivateClass());
			}
			return EventTransporter.instance;
		}
	}
}
/**配合单例模式的包外类**/
class ETPrivateClass
{
	public function ETPrivateClass():void
	{
	}
}