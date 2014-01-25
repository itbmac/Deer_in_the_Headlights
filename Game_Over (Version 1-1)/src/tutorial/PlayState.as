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
		public static var LEVEL_SIZE:FlxPoint = new FlxPoint(10000, 1000); // (8215, 700); // level size (in pixels) 
		
		/**
		 * Current level
		 * NOTE: "public static" allows us to get info about the level from other classes
		 */
		public static var LEVEL:TopDownLevel = null;
		
		/**
		 * Create state
		 */
		override public function create():void {
			//FlxG.mouse.show();
			
			FlxG.playMusic(Assets.musicLoop, 0.3);
			
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
