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
		
		public static const STATE_NXTL_SLOW1:int = 7;
		
		public static const STATE_NXTL_SLOW2:int = 8;
		/** Focus Mode stopped */
		//public static const STATE_FCUS_STOP:int = 9;
		
		public var state:int = STATE_FREE_ROAM;
		private var lastAnimFinished:Boolean = true;
		private var animSwitch:Boolean = false;
		private var lastAnimName:String = "";
		private var lastAnimFrameRate:int = 9;
		private var trigger : Trigger;
		private var lastX : int;
		public var odeermeter : int;
		
		
		/**
		 * Constructor
		 * @param	X	X location of the entity
		 * @param	Y	Y location of the entity
		 */
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
			
			if (state == STATE_TRIG_APRC_STRT)
			{
				FlxG.log("slowing, at " + velocity.x);
				var index : Number = FlxU.abs(velocity.x) + FlxU.abs(velocity.y);
				if (index > 10.0)
				{
					var slowing : Number = index*1.5;
					if (index <= 25.0)
					{
						if (index <= 5.0)
							slowing = 5.0;
						else
							slowing = index;
					}
						
					if (velocity.x > 0.0)
						acceleration.x = -slowing;
					else
						acceleration.x = slowing;
						
					if (velocity.y > 0.0)
						acceleration.y = -slowing;
					else
						acceleration.y = slowing;
				} 
				else
				{
					acceleration.x = 0.0;
					acceleration.y = 0.0;
					velocity.x = 0.0;
					velocity.y = 0.0;
					state = STATE_TRIG_APRC_STOP;
				}
			}
			else if (state == STATE_TRIG_APRC_STOP)
			{
				state = STATE_TRIG_ANIM_STRT;
				trigger.animate();
			}
			else if (state == STATE_TRIG_ANIM_STRT)
			{
				if (trigger.finished)
					state = STATE_TRIG_ANIM_STOP;
			}
			else if (state == STATE_TRIG_ANIM_STOP)
			{
				// TODO: intermediary animation
					if (trigger.shortCircuit)
					{
						state = STATE_FREE_ROAM;
						IndoorHouseLevel.instance.endZoom();
					} 
					else
					{
						if (trigger.flipDirectionOnRun)
							changeDirection();
						
						 moveSprint();
						 odeermeter = 0;
						 state = STATE_FCUS_STRT;
					}
			} 
			else if (state == STATE_FCUS_STRT)
			{
				if (!sprint)
					moveSprint();
				if (odeermeter >= 2500)
				{
					state = STATE_FCUS_PROG;
					odeermeter = 0;
					// TODO: add another ring
				}
			} else if (state == STATE_FCUS_PROG)
			{
				var fog : Number = odeermeter / 2400.0;
				if (fog > 1.0) fog = 1.0;
				IndoorHouseLevel.instance.setFog(fog);
				
				if (odeermeter >= 2500)
				{
					// Odeermeter MUST be reset before loading next level
					odeermeter = 0;
					IndoorHouseLevel.instance.nextLevel();
					state = STATE_NXTL_SLOW1;
				}
			} else if (state == STATE_NXTL_SLOW1)
			{
				var fog : Number = ((2500 - odeermeter) / 2400.0);
				if (fog > 1.0) fog = 1.0;
				if (fog < 0.0) fog = 0.0;
				IndoorHouseLevel.instance.setFog(fog);
				
				if (odeermeter >= 2500)
				{
					state = STATE_NXTL_SLOW2;
					// TODO: make gradual
					IndoorHouseLevel.instance.endZoom();
				}
			} else if (state == STATE_NXTL_SLOW2)
			{
				if (odeermeter >= 2500)
				{
					state = STATE_NXTL_SLOW2;
					// TODO: make gradual
					IndoorHouseLevel.instance.endZoom();
					state = STATE_FREE_ROAM;
				}
			}
			
			var delta : int = FlxU.abs(this.x - lastX);
			if (delta > 1000)
				delta = 0; // warp, don't count it;
			odeermeter += delta;
			lastX = this.x;
		}
		
		public function triggerBegin(byTrigger : Trigger) : void {
			FlxG.music.volume = 0.1;
			FlxG.play(Assets.SCARED);
			trigger = byTrigger;
			 state = STATE_TRIG_APRC_STRT;
			 if (trigger.zoomOnStop)
				IndoorHouseLevel.instance.beginZoom();
		}
	}
}
