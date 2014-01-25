package tutorial
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	import topdown.TopDownEntity;
	
	/**
	 * ...
	 * @author MacKenzie Bates
	 */
	public class NPC extends FlxSprite 
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
		public var xSoulOffset:int = 0;
		public var ySoulOffset:int = 0;
		public var px:int;
		public var py:int;
		public var displayText:String;
		
		public function NPC(X:int, Y:int, player:TopDownEntity, LA:int, initialState:int = 0, dispGraphic:Class = null, dispText:String = "", dispRegion:int = 0, moveStyle:int = 0, xOffsetThres:int = 0, yOffsetThres:int = 0, xVel:int = 0, yVel:int = 0)
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
				case Assets.CHARACTER_DEAD_SPRITE:
					loadGraphic(
						Assets.CHARACTER_DEAD_SPRITE, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						150, // width of each frame (in pixels)
						114 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xSoulOffset = 82;
					ySoulOffset = 103;
				break;
				case Assets.SPRITE_BAT:
					loadGraphic(
						Assets.SPRITE_BAT, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						179, // width of each frame (in pixels)
						107 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xSoulOffset = 88;
					ySoulOffset = 54;
				break;
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
					
					xSoulOffset = 73;
					ySoulOffset = 40;
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
					
					xSoulOffset = 112;
					ySoulOffset = 108;
				break;
				case Assets.SPRITE_CAVE_OWL:
					loadGraphic(
						Assets.SPRITE_CAVE_OWL, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						136, // width of each frame (in pixels)
						114 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xSoulOffset = 65;
					ySoulOffset = 65;
				break;
				case Assets.SPRITE_DEAD_WOLF:
					loadGraphic(
						Assets.SPRITE_DEAD_WOLF, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						214, // width of each frame (in pixels)
						52 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xSoulOffset = 99;
					ySoulOffset = 44;
				break;
				case Assets.SPRITE_DEER:
					loadGraphic(
						Assets.SPRITE_DEER, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						231, // width of each frame (in pixels)
						226 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xSoulOffset = 126;
					ySoulOffset = 140;
				break;
				case Assets.SPRITE_DOG:
					loadGraphic(
						Assets.SPRITE_DOG, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						84, // width of each frame (in pixels)
						104 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xSoulOffset = 41;
					ySoulOffset = 61;
				break;
				case Assets.SPRITE_FOX:
					loadGraphic(
						Assets.SPRITE_FOX, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						142, // width of each frame (in pixels)
						80 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xSoulOffset = 70;
					ySoulOffset = 35;
				break;
				case Assets.SPRITE_LIZARD:
					loadGraphic(
						Assets.SPRITE_LIZARD, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						97, // width of each frame (in pixels)
						36 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xSoulOffset = 50;
					ySoulOffset = 25;
				break;
				case Assets.SPRITE_MOUSE:
					loadGraphic(
						Assets.SPRITE_MOUSE, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						99, // width of each frame (in pixels)
						31 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xSoulOffset = 52;
					ySoulOffset = 25;
				break;
				case Assets.SPRITE_OCELOT:
					loadGraphic(
						Assets.SPRITE_OCELOT, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						230, // width of each frame (in pixels)
						103 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xSoulOffset = 119;
					ySoulOffset = 46;
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
					
					xSoulOffset = 53;
					ySoulOffset = 78;
				break;
				case Assets.SPRITE_PRAIRIE_DOG:
					loadGraphic(
						Assets.SPRITE_PRAIRIE_DOG, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						101, // width of each frame (in pixels)
						83 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xSoulOffset = 46;
					ySoulOffset = 51;
				break;
				case Assets.SPRITE_SNAKE:
					loadGraphic(
						Assets.SPRITE_SNAKE, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						158, // width of each frame (in pixels)
						99 // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xSoulOffset = 68;
					ySoulOffset = 51;
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
					
					xSoulOffset = 52;
					ySoulOffset = 98;
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
					
					xSoulOffset = 23;
					ySoulOffset = 39;
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
					
					xSoulOffset = 274;
					ySoulOffset = 360;
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
					
					xSoulOffset = 472;
					ySoulOffset = 398;
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
					
					xSoulOffset = 311;
					ySoulOffset = 195;
				break;
				case Assets.SPRITE_WOLF:
					loadGraphic(
						Assets.SPRITE_WOLF, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						241, // width of each frame (in pixels)
						140  // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xSoulOffset = 126;
					ySoulOffset = 64;
				break;
				case Assets.SPRITE_WOLF_CUB:
					loadGraphic(
						Assets.SPRITE_WOLF_CUB, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						121, // width of each frame (in pixels)
						85   // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xSoulOffset = 43;
					ySoulOffset = 55;
				break;
				case Assets.SPRITE_ZEBRA:
					loadGraphic(
						Assets.SPRITE_ZEBRA, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						286, // width of each frame (in pixels)
						209  // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xSoulOffset = 139;
					ySoulOffset = 89;
				break;
				default:
					loadGraphic(
						Assets.SPRITE_ZEBRA, // image to use
						true, // animated
						false, // don't generate "flipped" images since they're already in the image
						286, // width of each frame (in pixels)
						209  // height of each frame (in pixels)
					);
					addAnimation("walk_right", [0], 7, false);
					addAnimation("walk_left", [0], 7, false);
					addAnimation("idle", [0], 12, false);
					
					xSoulOffset = 139;
					ySoulOffset = 89;
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
			if (movementStyle == 1) {  /* When you're on the left side of him, he runs away from you */
				if ((x > (xOrigin + xOffsetThreshold)) || (x < (xOrigin - xOffsetThreshold)))
					velocity.x = -velocity.x;
				if ((y > (yOrigin + yOffsetThreshold)) || (y < (yOrigin - yOffsetThreshold)))
					velocity.y = -velocity.y;
					
				x += velocity.x;
				y += velocity.y;
			}
			else if (movementStyle == 2) {  /* When you're on the left side of him, he runs away from you */
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