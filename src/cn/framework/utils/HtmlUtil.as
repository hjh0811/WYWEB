package cn.framework.utils
{
	import flash.external.ExternalInterface;

	public class HtmlUtil
	{
		public function HtmlUtil()
		{
		}
		
		public static function iframeShow(iframeID:String):void
		{
			ExternalInterface.call("function iframeshow(){document.getElementById('" + iframeID + "0" + "').style.zIndex=\"1\";}")
		}
		
		
		public static function iframeHide(iframeID:String):void
		{
			ExternalInterface.call("function iframehide(){document.getElementById('" + iframeID + "0" + "').style.zIndex=\"-1\";}");
		}
	}
}