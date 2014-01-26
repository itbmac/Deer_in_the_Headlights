package tutorial 
{
	import Math;
	import org.flixel.FlxPoint;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ProceduralObjectProtoype 
	{
		private var state : int;
		private var graphic : Class;
		private var movementStyle : int;
		private var region : int;
		public var width : int;
		
		private var probability : Number; // probability a given column will contain a building
		private var minY : int;
		private var yRange : int;
		private var scrollFactor : Number;
		private var scale : Number;
		// TODO:
		//private var sameTypeSeparation : int;
		//private var differentTypeSeparation : int;
		
		public function ProceduralObjectProtoype(graphic : Class, state : int = 0, movementStyle : int = 0, region : int = 0,
												probability : Number = 0.0005, minY : int = 0, yRange : int = 0,
												scrollFactor : Number = 1.0, scale : Number = 1.0, width : Number = 0.0) 
		{
			this.state = state;
			this.graphic = graphic;
			this.movementStyle = movementStyle
			this.region = region;
			if (width == 0.0)
				width = (new graphic).bitmapData.width;
				
			this.width = width;
			
			this.minY = minY;
			this.yRange = yRange;
			this.probability = probability;
			this.scrollFactor = scrollFactor;
			this.scale = scale;
		}
		
		protected function shouldMake(x : int, last : int) : Boolean
		{
			return (last == -1 || last + width < x) &&  Math.random() <= probability;
		}
		
		protected function make(x : int) : GameObject
		{
			var y : int = PlayState.randomIntBetween(minY, minY + yRange);
			return new GameObject(x, y, null, 0, state, graphic, "", 0, movementStyle);
		}
		
		protected function adjust(go : GameObject) : void
		{
			
		}
		
		public function request(x : int, last : int) : GameObject
		{
			// TODO: change order of GameObject parameters to eliminate duplicating defaults
			// TODO: use region
			if (shouldMake(x, last))
			{
				var go : GameObject = make(x);
				go.scrollFactor = new FlxPoint(scrollFactor, 1.0);
				go.scale = new FlxPoint(scale, scale);
				adjust(go);
				
				return go;
			} else
			{
				return null;
			}
		}
	}
}