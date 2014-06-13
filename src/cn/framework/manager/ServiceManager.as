package cn.framework.manager
{
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ServiceManager
	{
		public var servletcontext:String = "";
		public var serviceURL:String = "servlet/dataexchange";
		
		public function ServiceManager()
		{
			
		}
		
		public function getDataByService(params:Object,handler:Function, method:String):void
		{
			var httpservice:HTTPService = new HTTPService;
			httpservice.url = serviceURL;
			httpservice.method = method;
			httpservice.resultFormat = "e4x";
			httpservice.addEventListener(ResultEvent.RESULT,handler);
			httpservice.addEventListener(FaultEvent.FAULT,errorhandler);
			httpservice.send(params);
		}
		
		private function errorhandler(event:FaultEvent):void
		{
			
		}
		
	}
}