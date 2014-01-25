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
		public static const RUNSPEED:int = 1;// 130;
		public static const FRICTION:Number = 0.8;
		public static const SIZE:FlxPoint = new FlxPoint(51, 60); // size in pixels
		
		/**
		 * Constructor
		 * @param	X	X location of the entity
		 * @param	Y	Y location of the entity
		 */
		public function TopDownEntity(X:Number = 100, Y:Number = 100):void {
			super(X, Y);
			makeGraphic(SIZE.x, SIZE.y, 0xFFFF0000); // use this if you want a generic box graphic by default
			// movement
			maxVelocity = new FlxPoint(RUNSPEED, RUNSPEED);
			drag = new FlxPoint(RUNSPEED * 4, RUNSPEED * 4); // decelerate to a stop within 1/4 of a second
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
			acceleration.y = 0; // no gravity or drag by default
			
			velocity.x += acceleration.x;
			this.x += velocity.x;
			acceleration.x *= FRICTION;
			velocity.x *= FRICTION;
		}
		
		/**
		 * Move entity left
		 */
		public function moveLeft():void {
			facing = LEFT;
			acceleration.x = -RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
		}
		
		/**
		 * Move entity right
		 */
		public function moveRight():void {
			facing = RIGHT;
			acceleration.x = RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
		}
		
		/**
		 * Move entity up
		 */
		public function moveUp():void {
			facing = UP;
			acceleration.y = -RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
		}
		
		/**
		 * Move playe rdown
		 */
		public function moveDown():void {
			facing = DOWN;
			acceleration.y = RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
		}
	}
}
