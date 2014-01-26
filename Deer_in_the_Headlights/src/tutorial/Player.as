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
		
		public function Player(X:Number=100, Y:Number=100):void {
			super(X, Y);
			createAnimations();
			loadGraphic(
						Assets.SPRITE_DEER, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						512, // width of each frame (in pixels)
						512 // height of each frame (in pixels)
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
			addAnimation("walk_right", [0, 1, 2, 3, 4, 5, 6, 7, 8], 12, true);
			addAnimation("walk_left",  [9, 10, 11, 12, 13, 14, 15, 16, 17], 12, true);
			addAnimation("sprint_right",  [0, 1, 2, 3, 4, 5, 6, 7, 8], 12, true);
			addAnimation("sprint_left", [9, 10, 11, 12, 13, 14, 15, 16, 17], 12, true);
			addAnimation("idle_right", [0], 12, true);
			addAnimation("idle_left", [9], 12, true);
		}
		override protected function updateAnimations():void 
		{
			if (velocity.x > (RUNSPEED * 4))
				play("sprint_right");
			else if (velocity.x < (RUNSPEED * -4))
				play("sprint_left");
			else if (velocity.x > 0) 
				play("walk_right");
			else if (velocity.x < 0) 
				play("walk_left");
			else if (facing == RIGHT)
				play("idle_right");
			else if (facing == LEFT)
				play("idle_left");
			
			//= (velocity.x > 0);
		}
		
		override public function update():void {
			angle = 0; // (Math.atan2(FlxG.mouse.y - (y + 25), FlxG.mouse.x - (x + 25)) * 180 / Math.PI) +90;
			
			
			switch (state) 
			{
				case STATE_FREE_ROAM:
					break;
				case 1:
					break;
				case 2:
					break;
				case 3:
					break;
				case 4:
					break;
				default:
			}
			
			lastAnimFinished = this.finished;
			
			super.update();
		}
	}
}
