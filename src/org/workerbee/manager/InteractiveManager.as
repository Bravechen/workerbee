package org.workerbee.manager
{
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	
	import org.workerbee.core.IMaster;
	import org.workerbee.core.wb_internal;
	import org.workerbee.interactive.IInteractive;
	import org.workerbee.interactive.Interactive;

	use namespace wb_internal;
	
	/**
	 * 交互类管理类
	 * <p>
	 * 1.注册并创建交互类
	 * 2.可以获取交互类实例
	 * 暂时约定，同类别的IInteractive对象（类全名称相同）只能注册一个实例。
	 * </p>
	 * 
	 * @author 晨光熹微
	 * **/
	public final class InteractiveManager implements IInteractiveManager
	{
		private var registerClassList:Dictionary;	//注册服务类的类名列表
		private var errorManager:ISystemErrorManager;
		
		wb_internal var queenBee:IMaster;
		//====================================================================
		public function InteractiveManager()
		{
			registerClassList = new Dictionary();
			errorManager = SystemErrorManager.getInstance();
		}
		
		public function registerInteractive(className:String,executant:IInteractive=null):void
		{
			if(!className){
				errorManager.appendError("InteractiveManager-createInteractive() | the param of className is error");
				return;				
			}
			registerClassList[className] = !executant?createInteractive(className):executant;
			if(registerClassList[className]is Interactive){
				Interactive(registerClassList[className]).wb_queenBee = this.queenBee;
			}				
		}
		
		public function getInteractive(className:String):IInteractive
		{
			if(!className){
				errorManager.appendError("InteractiveManager-getInteractive() | the param of className is error");
				return null;				
			}
			return (isRegistered(className))?IInteractive(registerClassList[className]):createInteractive(className);
		}
		
		public function isRegistered(className:String):Boolean
		{
			return registerClassList[className]!=null;
		}
		//================================================================
		/**
		 * 创建类实例
		 * @param	className 类全名
		 * @return	IInteractive实例
		 **/
		private function createInteractive(className:String):IInteractive
		{
			try{
				var InteractiveClass:Class = Class(getDefinitionByName(className));
				var interactive:IInteractive = (new InteractiveClass()) as Interactive;
			}catch(error:Error){
				errorManager.appendError("ServiceManager-createService() | "+"\n"+error.message);
				return null;
			}
			if(!interactive){
				errorManager.appendError("ServiceManager-createService() | create error");
				return null;
			}
			if(!registerClassList[className]){
				registerClassList[className] = interactive;
			}
			return interactive;
		}
	}
}