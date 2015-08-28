package org.workerbee.manager
{
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	
	import org.workerbee.services.IService;
	import org.workerbee.services.Service;
	
	/**
	 * 服务管理类
	 * <p>
	 * 1.注册并创建服务类
	 * 2.可以获取服务类实例
	 * 服务类提供特定的服务，他可以被多个类使用。不必特意的创建新对象。
	 * 暂时约定，同类别的IService对象（类全名称相同）只能注册一个实例。
	 * </p>
	 * 
	 * @author 晨光熹微
	 * **/
	public final class ServiceManager implements IServiceManager
	{
		private var registerClassList:Dictionary;	//注册服务类的类名列表
		private var errorManager:ISystemErrorManager;
//=======================================================================================
		
		public function registerService(className:String,executant:IService=null):void
		{
			if(!className){
				errorManager.appendError("ServiceManager-createService() | the param of className is error");
				return;				
			}
			registerClassList[className] = !executant?createService(className):executant;
		}
		
		public function getService(className:String):IService
		{
			if(!className){
				errorManager.appendError("ServiceManager-getService() | the param of className is error");
				return null;				
			}
			return (isRegistered(className))?IService(registerClassList[className]):createService(className);
		}
		
		public function isRegistered(className:String):Boolean
		{
			return registerClassList[className]!=null;
		}

		public function ServiceManager()
		{
			registerClassList = new Dictionary();
			errorManager = SystemErrorManager.getInstance();
		}
//=============================================================================================
		/**
		 * 创建类实例
		 * @param	className 类全名
		 * @return	IService实例
		 **/
		private function createService(className:String):IService
		{		
			try{
				var serviceClass:Class = Class(getDefinitionByName(className));
				var service:IService = (new serviceClass()) as Service;
			}catch(error:Error){
				errorManager.appendError("ServiceManager-createService() | "+"\n"+error.message);
				return null;
			}
			if(!service){
				errorManager.appendError("ServiceManager-createService() | create error");
				return null;
			}
			if(!registerClassList[className]){
				registerClassList[className] = service;
			}
			return service;
		}
	}
}