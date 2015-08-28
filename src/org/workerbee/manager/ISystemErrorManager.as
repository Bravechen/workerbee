package org.workerbee.manager
{
	public interface ISystemErrorManager
	{
		function get errorList():Vector.<String>;
		
		function appendError(msg:String):void;
		
		function outputErrorMessage():String;
	}
}