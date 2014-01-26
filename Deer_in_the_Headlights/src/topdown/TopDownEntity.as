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
		public var sprint:Boolean = false;
		
		public static const MIN_Y:int = 530;
		public static const MAX_Y:int = 610;//635;
		public var RANGE_Y:int = MAX_Y - MIN_Y;
		public static const NORM_SCALE :Number = .35;
		public var curScale :Number = .35;
		
		/** Free Roam (Player has control only in this state) */
		public static const STATE_FREE_ROAM:int = 0;
		/** Trigger Approach Started (Player has caused a trigger to start and deer will slow to stop) */
		public static const STATE_TRIG_APRC_STRT:int = 1;
		/** Trigger Approach Stopped (Player has come to a stop and the approach is complete) */
		public static const STATE_TRIG_APRC_STOP:int = 2;
		/** Trigger Animation Started */
		public static const STATE_TRIG_ANIM_STRT:int = 3;
		/** Trigger Animation Stopped */
		public static const STATE_TRIG_ANIM_STOP:int = 4;
		/** Focus Mode started (slow zoom in, deer sprints, white fades in, music change?) */
		public static const STATE_FCUS_STRT:int = 5;
		/** Focus Mode in progress (zoomed, sprinting, white background) */
		public static const STATE_FCUS_PROG:int = 6;
		/** Focus Mode stopped */
		public static const STATE_FCUS_STOP:int = 7;
		
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
			//acceleration.y = 0; // no gravity or drag by default
			
			velocity.x += acceleration.x;
			this.x += velocity.x;
			acceleration.x *= FRICTION;
			velocity.x *= FRICTION;
			
			if (Math.abs(velocity.x) < .1)
			{
				velocity.x = 0;
				acceleration.x = 0;
			}
			
			velocity.y += acceleration.y;
			this.y += velocity.y;
			acceleration.y *= FRICTION;
			velocity.y *= FRICTION;
			
			if (Math.abs(velocity.y) < .1)
			{
				velocity.y = 0;
				acceleration.y = 0;
			}
			
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
			if (y >= MIN_Y)
			{
				facing = UP;
				acceleration.y = -RUNSPEED * 2; // accelerate to top speed in 1/4 of a second
			}
		}
		
		/**
		 * Move playe rdown
		 */
		public function moveDown():void {
			if (y <= MAX_Y)
			{
				facing = DOWN;
				acceleration.y = RUNSPEED * 2; // accelerate to top speed in 1/4 of a second
			}
		}
		
		/**
		 * Move playe rdown
		 */
		public function moveSprint():void {
			sprint = true;
			if (facing == RIGHT)
				acceleration.x = RUNSPEED * 12;
			if (facing == LEFT)
				acceleration.x = -RUNSPEED * 12;
		}
	}
}
