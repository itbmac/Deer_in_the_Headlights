package tutorial 
{
	import org.flixel.*;
	import topdown.*;
	/**
	 * Player-controlled entity
	 * @author MacKenzie Bates
	 */
	public class Player extends TopDownEntity
	{
		/**
		 * Constructor
		 * @param	X	X location of the entity
		 * @param	Y	Y location of the entity
		 */
		
		
		public var state:int = 0;
		private var lastAnimFinished:Boolean = true;
		private var animSwitch:Boolean = false;
		private var lastAnimName:String = "";
		private var lastAnimFrameRate:int = 9;
		
		public function Player(X:Number=100, Y:Number=100):void {
			super(X, Y);
			createAnimations();
			loadGraphic(
						Assets.SPRITE_DEER, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						256, // width of each frame (in pixels)
						256 // height of each frame (in pixels)
					);
					
			health = 100;
		}
		public function getX():int {
			return this.x;
		}
		public function getY():int {
			return this.y;
		}
		
		public function setX(newx:int):void {
			x = newx;
		}
		public function setY(newy:int):void {
			y = newy;
		}
		/**
		 * Check for user input to control this entity
		 */
		override protected function updateControls():void {
			super.updateControls();
			// check keys
			// NOTE: this accounts for someone pressing multiple arrow keys at the same time (even in opposite directions)
			
		}
		/**
		 * Create the animations for this entity
		 * NOTE: these will be different if your art is different
		 */
		override protected function createAnimations():void {
			addAnimation("walk_right_9",  [0, 1, 2, 3, 4, 5, 6, 7, 8], 9,  false);
			addAnimation("walk_right_10", [0, 1, 2, 3, 4, 5, 6, 7, 8], 7,  false);
			addAnimation("walk_right_11", [0, 1, 2, 3, 4, 5, 6, 7, 8], 10, false);
			addAnimation("walk_right_12", [0, 1, 2, 3, 4, 5, 6, 7, 8], 13, false);
			
			addAnimation("walk_left_9",   [9, 10, 11, 12, 13, 14, 15, 16, 17], 9,  false);
			addAnimation("walk_left_10",  [9, 10, 11, 12, 13, 14, 15, 16, 17], 7,  false);
			addAnimation("walk_left_11",  [9, 10, 11, 12, 13, 14, 15, 16, 17], 10, false);
			addAnimation("walk_left_12",  [9, 10, 11, 12, 13, 14, 15, 16, 17], 13, false);
			
			addAnimation("sprint_right_9",   [18, 19, 20, 21, 22, 23, 24, 25, 26], 9,  false);
			addAnimation("sprint_right_10",  [18, 19, 20, 21, 22, 23, 24, 25, 26], 7,  false);
			addAnimation("sprint_right_11",  [18, 19, 20, 21, 22, 23, 24, 25, 26], 10, false);
			addAnimation("sprint_right_12",  [18, 19, 20, 21, 22, 23, 24, 25, 26], 13, false);
			
			addAnimation("sprint_left_9",  [27, 28, 29, 30, 31, 32, 33, 34, 35], 9,  false);
			addAnimation("sprint_left_10", [27, 28, 29, 30, 31, 32, 33, 34, 35], 7,  false);
			addAnimation("sprint_left_11", [27, 28, 29, 30, 31, 32, 33, 34, 35], 10, false);
			addAnimation("sprint_left_11", [27, 28, 29, 30, 31, 32, 33, 34, 35], 13, false);
			
			addAnimation("idle_right_9",  [36,37,38,39,40,41,42,43,44], 9,  false);
			addAnimation("idle_right_10", [36,37,38,39,40,41,42,43,44], 7,  false);
			addAnimation("idle_right_11", [36,37,38,39,40,41,42,43,44], 10, false);
			addAnimation("idle_right_12", [36,37,38,39,40,41,42,43,44], 13, false);
			
			addAnimation("idle_left_9",  [45,46,47,48,49,50,51,52,53], 9,  false);
			addAnimation("idle_left_10", [45,46,47,48,49,50,51,52,53], 7,  false);
			addAnimation("idle_left_11", [45,46,47,48,49,50,51,52,53], 10, false);
			addAnimation("idle_left_12", [45,46,47,48,49,50,51,52,53], 13, false);
		}
		override protected function updateAnimations():void 
		{
			var curAnimName:String;
			if (velocity.x > (RUNSPEED * .85))
			{
				curAnimName = "sprint_right_";
			}
			else if (velocity.x < (RUNSPEED * -.85))
			{
				curAnimName = "sprint_left_";
			}
			else if (velocity.x > 0) 
			{
				curAnimName = "walk_right_";
			}
			else if (velocity.x < 0) 
			{
				curAnimName = "walk_left_";
			}
			else if (facing == RIGHT)
			{
				curAnimName = "idle_right_";
			}
			else if (facing == LEFT)
			{
				curAnimName = "idle_left_";
			}
			
			if ((curAnimName == lastAnimName) && animSwitch)
			{
				lastAnimFrameRate++;
				if (lastAnimFrameRate > 12)
					lastAnimFrameRate = 9;
				play(lastAnimName + lastAnimFrameRate);
				animSwitch = false;
				//trace("same anim diff framerate \n");
				//trace("." + lastAnimName + lastAnimFrameRate + ".");
			}
			else if ((curAnimName == lastAnimName) && !animSwitch)
			{
				play(lastAnimName + lastAnimFrameRate);
				//trace("same anim same framerate \n");
				//trace("." + lastAnimName + lastAnimFrameRate + ".");
			}
			else
			{
				play(curAnimName + lastAnimFrameRate);
				lastAnimName = curAnimName;
				if (animSwitch)
					animSwitch = false;
				//trace("diff anim \n");
				//trace(curAnimName + lastAnimFrameRate);
			}
		}
		
		override public function update():void {
			angle = 0; // (Math.atan2(FlxG.mouse.y - (y + 25), FlxG.mouse.x - (x + 25)) * 180 / Math.PI) +90;
			
			
			if (this.finished) // && !lastAnimFinished)
				animSwitch = true;
			
			lastAnimFinished = this.finished;
			
			super.update();
		}
	}
}
