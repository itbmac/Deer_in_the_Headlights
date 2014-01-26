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
		
		public var zoomOnStop : Boolean ;
		public var shortCircuit : Boolean; // simply zoom out after stopping
		public var flipDirectionOnRun : Boolean;
		
		public function TriggerPrototype(graphic:Class, relX:int, relY:int, proximityThreshold:Number = 250, xProximityOffset:Number = 0,
			yProximityOffset:Number = 0,zoomOnStop : Boolean = true, shortCircuit : Boolean = false, flipDirectionOnRun : Boolean = true,
			scale:Number = 1.0, state:int = 0, movementStyle:int = 0, region:int = 0, scrollFactor:Number = 1.0) 
		{
			super(graphic, relX, relY, scale, state, movementStyle, region, scrollFactor);
			
			this.zoomOnStop = zoomOnStop;
			this.shortCircuit = shortCircuit;
			this.flipDirectionOnRun = flipDirectionOnRun;
			
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
			go.zoomOnStop = zoomOnStop;
			go.shortCircuit = shortCircuit;
			go.flipDirectionOnRun = flipDirectionOnRun;
			
			return go;
		}
		
	}

}