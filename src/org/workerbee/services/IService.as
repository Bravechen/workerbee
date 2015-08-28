package org.workerbee.services
{
	/**
	 * 服务类接口
	 * <p>服务类接口提供和规定了服务类及其子类应遵守的基本接口内容</p>
	 *
	 * @productversion workbee 1.0
	 * @author	晨光熹微<br />
	 * date		2012.11
	 */
	public interface IService
	{
		/**是否正在执行某项服务**/
		function get executing():Boolean;
	}
}