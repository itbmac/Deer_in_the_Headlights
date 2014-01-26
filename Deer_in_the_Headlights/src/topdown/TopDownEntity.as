package topdown
{
	import org.flixel.*;
	
	/**
	 * A moveable object in the game (player, enemy, NPC, etc)
	 * @author MacKenzie Bates
	 */
	public class TopDownEntity extends FlxSprite
	{
		/**
		 * Constants
		 */
		public static const WALKSPEED:int = 100;
		public static const RUNSPEED:int =  400;
		public static const FRICTION:Number = 5;
		public static const SIZE:FlxPoint = new FlxPoint(51, 60); // size in pixels
		public var sprint:Boolean = false;
		
		public static const MIN_Y:int = 635;
		public static const MAX_Y:int = 735;//635;
		public var RANGE_Y:int = MAX_Y - MIN_Y;
		public static const NORM_SCALE :Number = .6;
		public var curScale :Number = .35;
		
		public var desiredMaxSpeed:Number = 130;
		private const maxSpeedAccel:Number = 1;
		
		/**
		 * Constructor
		 * @param	X	X location of the entity
		 * @param	Y	Y location of the entity
		 */
		public function TopDownEntity(X:Number = 100, Y:Number = 100):void {
			super(X, Y);
			makeGraphic(SIZE.x, SIZE.y, 0xFFFF0000); // use this if you want a generic box graphic by default
			// movement
			maxVelocity = new FlxPoint(WALKSPEED, WALKSPEED*.3);
			drag = new FlxPoint(WALKSPEED*.6, WALKSPEED*.6); // decelerate to a stop within 1/4 of a second
			// animations
			createAnimations();
		}
		
		/**
		 * Create the animations for this entity
		 * NOTE: these will be different if your art is different
		 */
		protected function createAnimations():void {
			addAnimation("idle", [1]);
			addAnimation("walk", [1,2,3,4,5,6,7,8]);
		}

		/**
		 * Update each timestep
		 */
		public override function update():void {
			updateControls();
			updateAnimations();
			super.update();
		}
		
		/**
		 * Based on current state, show the correct animation
		 * FFV: use state machine if it gets more complex than this
		 */
		protected function updateAnimations():void {
		}
		
		/**
		 * Check keyboard/mouse controls
		 */
		protected function updateControls():void {
			//acceleration.y = 0; // no gravity or drag by default
			
			if (sprint)
				desiredMaxSpeed = RUNSPEED;
			else
				desiredMaxSpeed = WALKSPEED;
			
			if ((desiredMaxSpeed - this.maxVelocity.x) > 1)
				this.maxVelocity.x++;
			else if ((this.maxVelocity.x - desiredMaxSpeed) > 1)
				this.maxVelocity.x--;
			
			updateMotion();
			
			if (y <= MIN_Y)
			{
				y = MIN_Y;
			}
			else if (y >= MAX_Y)
			{
				y = MAX_Y;
			}
			
			curScale = NORM_SCALE + (((y - MIN_Y) / RANGE_Y) * 0.2);
			scale = new FlxPoint(curScale, curScale);
			
			//trace(scale.x + " ;;; " + scale.y);
		}
		
		/**
		 * Move entity left
		 */
		public function moveLeft():void {
			facing = LEFT;
			acceleration.x = -RUNSPEED * .5; // accelerate to top speed in 1/4 of a second
		}
		
		/**
		 * Move entity right
		 */
		public function moveRight():void {
			facing = RIGHT;
			acceleration.x = RUNSPEED * .5; // accelerate to top speed in 1/4 of a second
		}
		
		/**
		 * Move entity up
		 */
		public function moveUp():void {
			if (y >= MIN_Y)
			{
				facing = UP;
				acceleration.y = -RUNSPEED * .5; // accelerate to top speed in 1/4 of a second
			}
		}
		
		/**
		 * Move playe rdown
		 */
		public function moveDown():void {
			if (y <= MAX_Y)
			{
				facing = DOWN;
				acceleration.y = RUNSPEED * .5; // accelerate to top speed in 1/4 of a second
			}
		}
		
		/**
		 * Move playe rdown
		 */
		public function moveSprint():void {
			sprint = true;
			if (facing == RIGHT)
				acceleration.x = RUNSPEED * .5;
			if (facing == LEFT)
				acceleration.x = -RUNSPEED * .5;
		}
		
		public function changeDirection() : void {
			if (facing == RIGHT)
				facing = LEFT;
			else if (facing == LEFT)
				facing = RIGHT;
		}
	}
}

