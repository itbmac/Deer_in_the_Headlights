package tutorial 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author ...
	 */
	public class FixedObjectPrototype 
	{
		protected var state : int;
		protected var graphic : Class;
		protected var movementStyle : int;
		protected var region : int;
	
		protected var scrollFactor : Number;
		protected var scale : Number;
		protected var relX : int;
		protected var relY : int;
		protected var minOdeermeter : int;
		
		public function FixedObjectPrototype(graphic : Class, relX : int, relY : int, scale : Number = 1.0,
				state : int = 0,  minOdeermeter : int = 0, movementStyle : int = 0, region : int = 0, scrollFactor : Number = 1.0) 
		{
			this.state = state;
			this.graphic = graphic;
			this.movementStyle = movementStyle
			this.region = region;
			
			this.relX = relX;
			this.relY = relY;
			
			this.scrollFactor = scrollFactor;
			this.scale = scale;
			
			this.minOdeermeter = minOdeermeter;
		}
		
		public function make(base : FlxPoint, player : Player) : GameObject
		{
			if (player.odeermeter >= minOdeermeter)
			{
				var go : GameObject = new GameObject(base.x + relX, base.y + relY, player, 0, state, graphic, "", 0, movementStyle);
				go.scale = new FlxPoint(scale, scale);
				go.scrollFactor = new FlxPoint(scrollFactor, 1);
				
				return go;
			} else
			{
				return null;
			}
		}
	}

}