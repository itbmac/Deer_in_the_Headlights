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
		
		public var state:int = 0; // 0 - attached, 1 - leaving, 2 - free, 3 - arriving, 4 - arrived (add to log)
		private var lastAnimFinished:Boolean = true;
		
		public function Player(X:Number=100, Y:Number=100):void {
			super(X, Y);
			createAnimations();
			loadGraphic(
						Assets.SPRITE_DEER, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						231, // width of each frame (in pixels)
						226 // height of each frame (in pixels)
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
			addAnimation("walk", [0], 7, true);
			addAnimation("idle", [0], 7, true);
			addAnimation("expand", [0], 7, false);
			addAnimation("contract", [0], 7, false);
		}
		override protected function updateAnimations():void 
		{
			switch (state) 
			{
				case 0:
					this.visible = true;
					break;
				case 1:
					play("expand");
					break;
				case 2:
					if (Math.abs(velocity.x) > 0 || Math.abs(velocity.y) > 0) 
					{
						play("walk");
					}
					else {
						play("idle");
					}
					break;
				case 3:
					play("contract");
					break;
				case 4:
					visible = true;
					break;
				default:
			}
		}
		
		override public function update():void {
			angle = 0; // (Math.atan2(FlxG.mouse.y - (y + 25), FlxG.mouse.x - (x + 25)) * 180 / Math.PI) +90;
			
			
			switch (state) 
			{
				case 0:
					visible = true;
					break;
				case 1:
					visible = true;
					if (this.finished && !lastAnimFinished)
						state = 2;
					break;
				case 2:
					visible = true;
					break;
				case 3:
					visible = true;
					if (this.finished && !lastAnimFinished)
						state = 4;
					break;
				case 4:
					visible = true;
					break;
				default:
			}
			
			lastAnimFinished = this.finished;
			
			super.update();
		}
	}
}
