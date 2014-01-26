package tutorial 
{
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
		// TODO:
		//private var sameTypeSeparation : int;
		//private var differentTypeSeparation : int;
		
		public function ProceduralObjectProtoype(graphic : Class, state : int = 0, movementStyle : int = 0, region : int = 0,
												probability : Number = 0.0005, minY : int = 0, yRange : int = 0) 
		{
			this.state = state;
			this.graphic = graphic;
			this.movementStyle = movementStyle
			this.region = region;
			this.width = (new graphic).bitmapData.width;
			
			this.minY = minY;
			this.yRange = yRange;
			this.probability = probability;
		}
		
		private function randomIntBetween(min:int, max:int):int {
			return Math.floor(Math.random() * (max - min + 1) + min);
		}
		
		public function make(x : int, last : int) : GameObject
		{
			// TODO: change order of GameObject parameters to eliminate duplicating defaults
			// TODO: use region
			if ((last == -1 || last + width < x) &&  Math.random() <= probability)
			{
				var y : int = randomIntBetween(minY, minY + yRange);
				trace("At " + x + "," + y);
				
				return new GameObject(x, y, null, 0, state, graphic, "", 0, movementStyle);;
			} else
			{
				return null;
			}
		}
	}

}