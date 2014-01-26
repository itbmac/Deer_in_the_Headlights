package tutorial 
{
	/**
	 * ...
	 * @author ...
	 */
	public class BackgroundPrototype extends ProceduralObjectProtoype 
	{
		
		public function BackgroundPrototype(graphic:Class, state:int = 0, movementStyle:int = 0, region:int = 0, 
			probability:Number=1, minY:int=0, yRange:int=0, scrollFactor:Number=1.0, scale:Number=1.0) 
		{
			super(graphic, state, movementStyle, region, probability, minY, yRange, scrollFactor, scale);
		}
		
		protected override function shouldMake(x : int, last : int) : Boolean
		{
			return last == -1;
		}
		
		protected override function adjust(go : GameObject) : void
		{
			go.x = 0;
		}
		
	}

}