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
		
		public function GameObject(X:int, Y:int, player:TopDownEntity, LA:int, initialState:int = 0, dispGraphic:Class = null, dispText:String = "", dispRegion:int = 0, moveStyle:int = 0, xOffsetThres:int = 0, yOffsetThres:int = 0, xVel:int = 0, yVel:int = 0)
		{
			super(X, Y);			
			state = initialState;
			visited = false;
			movementStyle = moveStyle;
			displayGraphic = dispGraphic;
			displayText = dispText;
			thumbnailGraphic = Assets.THUMBNAIL_ERROR; // This should be changed below
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
				case Assets.SPRITE_BIRD:
					loadGraphic(
						Assets.SPRITE_BIRD, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						152, // width of each frame (in pixels)
						70// height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xProximityOffset = 73;
					yProximityOffset = 40;
				break;
				case Assets.SPRITE_BUSH:
					loadGraphic(
						Assets.SPRITE_BUSH, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						242, // width of each frame (in pixels)
						174 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xProximityOffset = 112;
					yProximityOffset = 108;
				break;
				case Assets.SPRITE_DEER:
					loadGraphic(
						Assets.SPRITE_DEER, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						512, // width of each frame (in pixels)
						512 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xProximityOffset = 126;
					yProximityOffset = 140;
				break;
				case Assets.SPRITE_OWL:
					loadGraphic(
						Assets.SPRITE_OWL, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						105, // width of each frame (in pixels)
						132 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xProximityOffset = 53;
					yProximityOffset = 78;
				break;
				case Assets.SPRITE_SPIDER:
					loadGraphic(
						Assets.SPRITE_SPIDER, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						106, // width of each frame (in pixels)
						146 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xProximityOffset = 52;
					yProximityOffset = 98;
				break;
				case Assets.SPRITE_SQUIRREL:
					loadGraphic(
						Assets.SPRITE_SQUIRREL, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						77, // width of each frame (in pixels)
						80 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xProximityOffset = 23;
					yProximityOffset = 39;
				break;
				case Assets.SPRITE_TREE_1:
					loadGraphic(
						Assets.SPRITE_TREE_1, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						570, // width of each frame (in pixels)
						617  // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xProximityOffset = 274;
					yProximityOffset = 360;
				break;
				case Assets.SPRITE_TREE_2:
					loadGraphic(
						Assets.SPRITE_TREE_2, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						868, // width of each frame (in pixels)
						724  // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xProximityOffset = 472;
					yProximityOffset = 398;
				break;
				case Assets.SPRITE_TREE_3:
					loadGraphic(
						Assets.SPRITE_TREE_3, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						446, // width of each frame (in pixels)
						433  // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xProximityOffset = 311;
					yProximityOffset = 195;
				break;
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