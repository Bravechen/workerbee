package org.workerbee.core
{
	import org.workerbee.manager.ISystemErrorManager;
	import org.workerbee.manager.SystemErrorManager;
	
	use namespace wb_internal;

	/**workerBee框架建立的入口**/
	public final class Beehive implements IBeehive
	{
		private var queenBee:IMaster;
		private var errorManager:ISystemErrorManager;
		
		public function initialize(queenBee:IMaster=null):void
		{
			if(!queenBee){
				queenBee = new QueenBee();
			}
			this.queenBee = queenBee;
			if(this.queenBee is QueenBee){
				QueenBee(this.queenBee).initialize();
			}			
		}
		//=============================================================
		static private var instance:IBeehive;
		public function Beehive(prvt:BeehivePrivateClass)
		{
			errorManager = SystemErrorManager.getInstance();
		}
		
		static public function getInstance():IBeehive
		{
			if(!Beehive.instance){
				instance = new Beehive(new BeehivePrivateClass());
			}
			return instance;
		}
	}
}
class BeehivePrivateClass{
	public function BeehivePrivateClass():void
	{
		
	}
}