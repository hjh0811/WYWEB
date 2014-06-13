package cn.framework.utils
{
	import flash.events.Event;
	
	import mx.binding.utils.ChangeWatcher;
	import mx.collections.ArrayCollection;
	import mx.controls.TextInput;
	
	import spark.components.TextInput;

	/**
	 * 双向绑定辅助类
	 *
	 */
	public class BindingUtil
	{
		public function BindingUtil()
		{
		}

		public var watchers:ArrayCollection=new ArrayCollection();

		/**绑定方法*/
		public function bind(obj1:Object, prop1:String, obj2:Object, prop2:String):void
		{

			/**是否在改变标志，类似 数据同步机制*/
			var flag:Boolean=false;

			var tempwatcher1:ChangeWatcher=ChangeWatcher.watch(obj1, prop1, function(event:Event):void
				{
					if (!flag)
					{
						/**锁定对象*/
						flag=true;
						obj2[prop2]=obj1[prop1];
						/**解锁对象*/
						flag=false;
					}
				});

			var tempwatcher2:ChangeWatcher=ChangeWatcher.watch(obj2, prop2, function(event:Event):void
				{
					if (!flag)
					{
						/**锁定对象*/
						flag=true;
						obj1[prop1]=obj2[prop2];
//						if(obj1 is mx.controls.TextInput)
//						{
//							(obj1 as mx.controls.TextInput).text = obj2[prop2];
//						}
//						else if(obj1 is spark.components.TextInput)
//						{
//							(obj1 as spark.components.TextInput).text = obj2[prop2];
//						}
						/**解锁对象*/
						flag=false;
					}
				});

			this.watchers.addItem(tempwatcher1);
			this.watchers.addItem(tempwatcher2);
		}

		/**解除绑定*/
		public function unbind():void
		{
			for (var i:int=0; i < this.watchers.length; i++)
			{
				ChangeWatcher(this.watchers.getItemAt(i)).unwatch();
			}
		}
	}
}
