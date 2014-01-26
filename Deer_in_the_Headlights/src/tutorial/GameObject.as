package tutorial
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	import topdown.TopDownEntity;
	
	/**
	 * ...
	 * @author MacKenzie Bates
	 */
	public class GameObject extends FlxSprite 
	{
		public var state:int;//0 - soulless, 1 - soulful, 2 - soul end.
		public var visited:Boolean;
		public var movementStyle:int; //0 - stationary, 1 - linear looping, 2 - circular looping
		public var displayGraphic:Class;
		public var thumbnailGraphic:Class;
		public var region:int;
		public var levelArea:int;
		public var xOrigin:int;
		public var yOrigin:int;
		public var xOffsetThreshold:int = 0;
		public var yOffsetThreshold:int = 0;
		public var xVelocity:int = 0;
		public var yVelocity:int = 0;
		public var xProximityOffset:int = 0; //Point from which to judge if player is close
		public var yProximityOffset:int = 0; //Point from which to judge if player is close
		public var px:int;
		public var py:int;
		public var displayText:String;
		
		public function GameObject(X:int, Y:int, player:TopDownEntity = null, LA:int = 0, initialState:int = 0,
			dispGraphic:Class = null, dispText:String = "", dispRegion:int = 0, moveStyle:int = 0,
			xOffsetThres:int = 0, yOffsetThres:int = 0, xVel:int = 0, yVel:int = 0)
		{
			super(X, Y);			
			state = initialState;
			visited = false;
			movementStyle = moveStyle;
			displayGraphic = dispGraphic;
			displayText = dispText;
			region = dispRegion;
			levelArea = LA;
			xOrigin = X;
			yOrigin = Y;
			xOffsetThreshold = xOffsetThres;
			yOffsetThreshold = yOffsetThres;
			xVelocity = xVel;
			yVelocity = yVel;
			
			velocity.x = xVel;
			velocity.y = yVel;
			
			switch (displayGraphic) 
			{
				case Assets.DRUNK_LEAF:
					loadGraphic(
						Assets.DRUNK_LEAF, // image to use
						true, // animated
						false,
						64,
						720
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38], 12, true);
					
					xProximityOffset = 0;
					yProximityOffset = 0;
				default:
					loadGraphic(
						displayGraphic, // image to use
						false // animated
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xProximityOffset = 0;
					yProximityOffset = 0;
			}
			
			play("idle");
		}
		public function setXY(pnt:FlxPoint):void {
			px = pnt.x;
			py = pnt.y;
		}
		
		public function setState(nstate:int):void {
			state = nstate;
		}
		
		public function getState():int {
			return state;
		}
		
		protected function createAnimations():void {

			addAnimation("walk", [1,2], 12, false);
			addAnimation("idle", [1], 12, false);
			
		}

		public override function update():void {
			
			//------------------------------------------------------------------------//
			//						       Stage Action         				      //
			//------------------------------------------------------------------------//
			if (movementStyle == 1) { 
				if ((x > (xOrigin + xOffsetThreshold)) || (x < (xOrigin - xOffsetThreshold)))
					velocity.x = -velocity.x;
				if ((y > (yOrigin + yOffsetThreshold)) || (y < (yOrigin - yOffsetThreshold)))
					velocity.y = -velocity.y;
					
				x += velocity.x;
				y += velocity.y;
			}
			else if (movementStyle == 2) {  
				if ((x > (xOrigin + xOffsetThreshold)) || (x < (xOrigin - xOffsetThreshold)))
					velocity.x = -velocity.x;
				if ((y > (yOrigin + yOffsetThreshold)) || (y < (yOrigin - yOffsetThreshold)))
					velocity.y = -velocity.y;
					
				x += Math.cos(velocity.x)*velocity.x;
				y += Math.sin(velocity.y);
			}
			else if (movementStyle == 0)
			{
				velocity.x = 0;
				velocity.y = 0;
			}
			
			//------------------------------------------------------------------------//
			//						           ANIMATIONS         				      //
			//------------------------------------------------------------------------//
			if (velocity.x != 0 || velocity.y != 0) {
				if (velocity.x > 0 )
				{
					play("walk_right");
				}
				else
				{
					play("walk_left");
				}
			}else {
				play("idle");
			}
			
			
			super.update();
		}
	}
		
	
}