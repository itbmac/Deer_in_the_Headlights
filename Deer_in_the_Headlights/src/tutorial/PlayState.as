package tutorial
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	import topdown.*;

	/**
	 * State for actually playing the game
	 * @author MacKenzie Bates
	 */
	
	public class PlayState extends FlxState
	{
		/**
		 * Constants
		 */
		public static var LEVEL_SIZE:FlxPoint = new FlxPoint(LevelArea.DEFAULT_WIDTH*3, 1000); // (8215, 700); // level size (in pixels) 
		
		/**
		 * Current level
		 * NOTE: "public static" allows us to get info about the level from other classes
		 */
		public static var LEVEL:TopDownLevel = null;
		
		public static function randomIntBetween(min:int, max:int):int {
			return Math.floor(Math.random() * (max - min + 1) + min);
		}
		
		/**
		 * Create state
		 */
		override public function create():void {
			//FlxG.mouse.show();
			
			// load level
			LEVEL = new IndoorHouseLevel(this, LEVEL_SIZE);
			this.add(LEVEL);
		}
		override public function update():void
		{
			//Here we are loading and playing the embedded sound.mp3
			// whenever the user presses the space bar.
			
			super.update();
		}
	}
}
