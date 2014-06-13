package cn.framework.components
{
	import flash.events.Event;
	
	public class CustomEvent extends Event
	{
		public var data:Object;
		
		public function CustomEvent(type:String, mydata:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			data = mydata;
		}
	}
}