package tutorial 
{
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author ...
	 */
	public class TriggerPrototype extends FixedObjectPrototype 
	{
		private var xProximityOffset : Number;
		private var yProximityOffset : Number;
		private var proximityThreshold : Number;
		
		public function TriggerPrototype(graphic:Class, relX:int, relY:int, proximityThreshold:Number=250, xProximityOffset:Number = 0, yProximityOffset:Number = 0,
			scale:Number = 1.0, state:int = 0, movementStyle:int = 0, region:int = 0, scrollFactor:Number = 1.0) 
		{
			super(graphic, relX, relY, scale, state, movementStyle, region, scrollFactor);
			
			this.yProximityOffset = yProximityOffset;
			var g = (new graphic).bitmapData;
			if (xProximityOffset == -1)
				this.xProximityOffset = g.width / 2;
			else
				this.xProximityOffset = xProximityOffset;
				
			var g = (new graphic).bitmapData;
			if (yProximityOffset == -1)
				this.yProximityOffset = g.height / 2;
			else
				this.yProximityOffset = yProximityOffset;
				
			this.proximityThreshold = proximityThreshold;
		}
		
		override public function make(base : FlxPoint) : GameObject
		{
			var go : Trigger = new Trigger(base.x + relX, base.y + relY, null, 0, state, graphic, "", 0, movementStyle);
			go.scale = new FlxPoint(scale, scale);
			go.scrollFactor = new FlxPoint(scrollFactor, 1);
			go.proximityThreshold = proximityThreshold;
			go.xProximityOffset = xProximityOffset;
			go.yProximityOffset = yProximityOffset;
			
			return go;
		}
		
	}

}