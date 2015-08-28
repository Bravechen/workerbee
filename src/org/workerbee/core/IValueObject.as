package org.workerbee.core
{
	/**
	 * value object数据类型接口
	 * 
	 * @productversion workerbee 1.0
	 * @author	晨光熹微<br />
	 * date		2013.5
	 * **/
	public interface IValueObject
	{
		/**
		 * 用于在调试过程中输出vo对象信息
		 * @return String
		 * **/
		function output():String;
	}
}