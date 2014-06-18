package cn.framework.utils.charts
{
	import com.amcharts.AmSerialChart;
	
	public class ColumnChart extends AmSerialChart
	{
		public function ColumnChart()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			if(this._amchartsLink)
			{
				this._amchartsLink.visible=false;
				this._amchartsLink.width =0;
				this._amchartsLink.height =0;
				this._amchartsLink.alpha=0;
			}
		}
	}
}