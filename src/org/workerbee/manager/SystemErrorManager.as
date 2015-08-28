package org.workerbee.manager
{	
	import org.workerbee.core.wb_internal;
	
	use namespace wb_internal;
	
	/**
	 * 处理系统错误和警告
	 * SystemErrorManager是一个单例。
	 * SystemErrorManager会将错误信息保存在一个列表当中。
	 * 
	 * **/
	public final class SystemErrorManager implements ISystemErrorManager
	{
		private var _errorList:Vector.<String>;

		public function get errorList():Vector.<String>
		{
			return _errorList;
		}

		private var errorMsg:String;

		public function appendError(msg:String):void
		{
			_errorList ||= new Vector.<String>();
			_errorList.push((new Date).toLocaleString() + " | " +msg);
			errorMsg += "\n"+(new Date).toLocaleString() + " | " +msg;
		}

		public function outputErrorMessage():String
		{
			return errorMsg;
		}

		/**
		 * 输出错误信息
		 * @param	errorType 错误类型
		 * @param	fromName 来源对象名称
		 * @param	errorDescribe 错误详细内容
		 * */
		wb_internal function traceErrorMsg(errorType:String,fromName:String,errorDescribe:String):void
		{
			//要加入条件编译
			trace("["+errorType+"]*["+"from:"+fromName+"]*["+"errorDescribe:"+errorDescribe+"]");
		}
//========================================================================================		
		static private var instance:ISystemErrorManager;
		
		static public function getInstance():ISystemErrorManager
		{
			if(!SystemErrorManager.instance){
				instance = new SystemErrorManager(new WBErrorPrivateClass());
			}
			return instance;
		}
		
		public function SystemErrorManager(prvt:WBErrorPrivateClass)
		{			
		}		
	}
}
class WBErrorPrivateClass{
	public function WBErrorPrivateClass():void
	{
	}
}