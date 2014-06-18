package cn.framework.utils.charts
{
	import com.amcharts.AmPieChart;
	
	public class PieChart extends AmPieChart
	{
		public function PieChart()
		{
			//TODO: implement function
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