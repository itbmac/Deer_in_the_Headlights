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
		
		public var movementStyle:int; //0 - stationary, 1 - linear looping, 2 - circular looping
		public var displayGraphic:Class;
		public var thumbnailGraphic:Class;
		public var region:int;
		public var levelArea:int;
		public var xOrigin:int;
		public var yOrigin:int;

		public var xVelocity:int = 0;
		public var yVelocity:int = 0;
		public var xOffsetThreshold:int = 0;
		public var yOffsetThreshold:int = 0;
		
		public var px:int;
		public var py:int;
		public var displayText:String;
		
		public var xProximityOffset:int = 0; //Point from which to judge if player is close
		public var yProximityOffset:int = 0; //Point from which to judge if player is close
		
		public function GameObject(X:int, Y:int, player:TopDownEntity = null, LA:int = 0, initialState:int = 0,
			dispGraphic:Class = null, dispText:String = "", dispRegion:int = 0, moveStyle:int = 0,
			xOffsetThres:int = 0, yOffsetThres:int = 0, xVel:int = 0, yVel:int = 0)
		{
			super(X, Y);
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
				case Assets.CAR_TRIGGER:
					loadGraphic(
						displayGraphic, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						765, // width of each frame (in pixels)
						300 // height of each frame (in pixels)
					);
					
					addAnimation("idle", [0], 7, true);
					addAnimation("animate", [0, 1, 2, 3, 4, 5, 6], 10, false);
					
					xProximityOffset = 0;
					yProximityOffset = 0;
					break;
				case Assets.STOPLIGHT:
					loadGraphic(
						displayGraphic, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						348, // width of each frame (in pixels)
						500 // height of each frame (in pixels)
					);
					
					addAnimation("idle", [0], 7, true);
					addAnimation("animate", [0, 1, 2, 3, 4, 5, 6], 10, false);
					
					xProximityOffset = 0;
					yProximityOffset = 0;
					break;
				case Assets.ROOT_TRIGGER:
					loadGraphic(
						displayGraphic, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						200, // width of each frame (in pixels)
						200 // height of each frame (in pixels)
					);
					
					addAnimation("idle", [0], 10, true);
					addAnimation("animate", [0, 1, 2, 3, 4, 5], 11, false);
					
					xProximityOffset = 0;
					yProximityOffset = 0;
					break;
				case Assets.STREETLIGHT:
					loadGraphic(
						displayGraphic, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						300, // width of each frame (in pixels)
						340 // height of each frame (in pixels)
					);
					
					addAnimation("idle", [0,0,1,1,0,1,0,1,1], 10, true);
					addAnimation("animate", [4, 5, 6, 7, 8, 9, 10,11,12,13,14,15,16,17,18,19,20,21,22,23], 10, false);
					
					xProximityOffset = 0;
					yProximityOffset = 0;
					break;
				case Assets.FOUNTAIN:
					loadGraphic(
						displayGraphic, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						400, // width of each frame (in pixels)
						400 // height of each frame (in pixels)
					);
					
					addAnimation("idle", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 10, true);
					addAnimation("animate", [10, 11, 12, 13, 14, 15, 16, 17, 18, 19], 10, false);
					
					xProximityOffset = 0;
					yProximityOffset = 0;
					break;
				case Assets.DRUNK_LEAF:
					loadGraphic(
						displayGraphic, // image to use
						true, // animated
						false,
						64,
						720
					);
					var frameList : Array = new Array();
					var start : int = PlayState.randomIntBetween(0, 38);
					for (var i : int = 0; i <= 38; i++)
					{
						frameList.push((start + i) % 39);
					}
					//[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38]
					
					addAnimation("idle", frameList, PlayState.randomIntBetween(9, 15), true);
					
					xProximityOffset = 0;
					yProximityOffset = 0;
					play("idle");
					break;
				default:
					loadGraphic(
						displayGraphic, // image to use
						false // animated
					);
					addAnimation("animate", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xProximityOffset = 0;
					yProximityOffset = 0;
					play("idle");
			}
			
			play("idle");
		}
		public function setXY(pnt:FlxPoint):void {
			px = pnt.x;
			py = pnt.y;
		}
		
		protected function createAnimations():void {

			addAnimation("walk", [1,2], 12, false);
			addAnimation("idle", [1], 12, false);
			
		}

		public override function update():void {
						
			super.update();
		}
	}
}