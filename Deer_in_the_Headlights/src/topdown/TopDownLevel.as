package topdown 
{
	import org.flixel.*;
	import tutorial.Assets;
	import tutorial.Log;
	import tutorial.LogBlock;
	import tutorial.Player;
	import tutorial.PlayState;
	import tutorial.ZoomCamera;
	import tutorial.NPC;
	/**
	 * Base class for all levels
	 * @author MacKenzie Bates
	 */
	public class TopDownLevel extends FlxGroup
	{
		/**
		 * Map
		 */
		public var state:FlxState; // state displaying the level
		public var levelSize:FlxPoint; // width and height of level (in pixels)
		public var imgGroup:FlxGroup;
		public var guiGroup:FlxGroup; // gui elements
		public var logGroup:FlxGroup; // gui log elements
		public var npcGroup:FlxGroup;
		public var srtScreenGroup:FlxGroup;
		
		/**
		 * Player
		 */
		public var player:Player;
		public var playerStart:FlxPoint = new FlxPoint(1437, 1437);
		public var playerState:int = 0; // 0 - attached, 1 - in transit
		public var soul_switch_timer:int = 0;
		public var maxDistToSwitch:int = 500;
		public var currObjectStr:String = "";
		
		public var storyStr:String = "";
		
		public var displayMode : Boolean = false;
		public var gameNotStarted:Boolean = true;
		public var activeLA:int = 0;
		public var activeLAChanged:Boolean = false;
		public var prevObjIndex:int = 0;
		
		/**
		 * Constructor
		 * @param	state		State displaying the level
		 * @param	levelSize	Width and height of level (in pixels)
		 */
		public function TopDownLevel(state:FlxState, levelSize:FlxPoint):void {
			super();
			this.state = state;
			this.levelSize = levelSize;
			// setup groups
			this.imgGroup = new FlxGroup();
			this.logGroup = new FlxGroup();
			this.guiGroup = new FlxGroup();
			this.npcGroup = new FlxGroup();
			this.srtScreenGroup = new FlxGroup();
			// create the level
			this.create();
		}
		
		/**
		 * Create the whole level, including all sprites, maps, blocks, etc
		 */
		public function create():void {
			createMap();
			createPlayer();
			addGroups();
			createCamera();
		}
		public function getPlayerXY():FlxPoint {
			return player.getMidpoint();
		}
		/**
		 * Create the map (walls, decals, etc)
		 */
		protected function createMap():void {

		}
		
		/**
		 * Create the player, bullets, etc
		 */
		protected function createPlayer():void {
			player = new Player(playerStart.x, playerStart.y);
			player.health = 100;
		}
		
		/**
		 * Decide the order of the groups. They are rendered in the order they're added, so last added is always on top.
		 */
		protected function addGroups():void {
			add(imgGroup);
			add(npcGroup);
			add(player);
			add(guiGroup);
			add(logGroup);
			add(srtScreenGroup);
		}
		
		/**
		 * Create the default camera for this level
		 */
		protected function createCamera():void {
			trace(levelSize.x);
			
			FlxG.worldBounds = new FlxRect(0, 0, levelSize.x, levelSize.y);
			
			
			//var zoomCam:ZoomCamera = new ZoomCamera(0, 0, levelSize.x, levelSize.y, 1);  
			//FlxG.resetCameras( zoomCam );  
			//zoomCam.targetZoom = 1; 
			//zoomCam.follow(player, FlxCamera.STYLE_LOCKON);
			//zoomCam.setBounds(0, 0, levelSize.x, levelSize.y, true);
			

			
			FlxG.camera.setBounds(0, 0, levelSize.x, levelSize.y, true);
			FlxG.camera.follow(player, FlxCamera.STYLE_LOCKON);
			FlxG.camera.zoom = 1;
		}
		
		/**
		 * Create text, buttons, indicators, etc
		 */
		public function updateStartScreen():void
		{
			
		}
		
		public function soulSwitch():void
		{
			var closestIndex:int = -1;
			var closestDist:Number = 1000.0;
			var saved:Boolean = false;
			var savedIndex:int;
			var i:int;
			for(i = 0; i < npcGroup.length; i++)
			{
				var curDist:Number = Math.sqrt( Math.pow((npcGroup.members[i].x + npcGroup.members[i].xSoulOffset - player.x), 2) +  Math.pow((npcGroup.members[i].y + npcGroup.members[i].ySoulOffset - player.y), 2) );
				
				if (i == prevObjIndex)
					curDist += 200;
				
				if ((curDist < closestDist) && (npcGroup.members[i].getState() == 0))
				{
					closestIndex = i;
					closestDist = curDist;
					FlxG.log("SWITCH TO: " + i.toString() + " .. CUR STATE: " + npcGroup.members[i].getState() + " ... WITH DISTANCE: " + curDist.toString());;
				}
			}
			
			if ((maxDistToSwitch > closestDist))
			{
				//player.health -= 10;
				
				for(i = 0; i < npcGroup.length; i++)
				{
					if (npcGroup.members[i].getState() == 1)
					{
						prevObjIndex = i;
						npcGroup.members[i].setState(0);
					}
				}
				
				if (npcGroup.members[closestIndex].levelArea != activeLA)
				{
					activeLA = npcGroup.members[closestIndex].levelArea;
					activeLAChanged = true;
				}
				
				npcGroup.members[closestIndex].setState(1);
				playerState = 1;
				player.state = 1;
			}
			
			//FlxG.log("SWITCH TO: " + closestIndex.toString() + " ... WITH DISTANCE: " + closestDist.toString());
		}
		
		public function updateSoul():void
		{
			for(var i:int = 0; i < npcGroup.length; i++)
			{
				//FlxG.log("SOUL: " + i.toString() + " ... STATE" + npcGroup.members[i].state  + " ... WITH LOCATION: (" + npcGroup.members[i].x.toString() +"," + npcGroup.members[i].y.toString() + ")");
				
				if (npcGroup.members[i].state == 1)
				{
					//FlxG.log("SOUL ATTACHED TO: " + i.toString() + " ... PREV ATTACHED TO: " + prevObjIndex.toString());
				}
				
				if ((npcGroup.members[i].state == 1) && (playerState == 0) && (player.state < 2))
				{
					player.x = npcGroup.members[i].x + npcGroup.members[i].xSoulOffset - TopDownEntity.SIZE.x/2;
					player.y = npcGroup.members[i].y + npcGroup.members[i].ySoulOffset - TopDownEntity.SIZE.y/2;
					
					npcGroup.members[i].color = 0x0000FF; // 0xFF7CF7FF;
					
					//FlxG.log("CURRENTLY LOCKED TO: " + i.toString() + " ... WITH LOCATION: (" + npcGroup.members[i].x.toString() +"," + npcGroup.members[i].y.toString() + ")");
				}
				else if ((npcGroup.members[i].state == 1) && (player.state >= 1) && (player.state < 4))
				{
					var curDist:Number = Math.sqrt( Math.pow((npcGroup.members[i].x + npcGroup.members[i].xSoulOffset - player.x - TopDownEntity.SIZE.x/2), 2) +  Math.pow((npcGroup.members[i].y + npcGroup.members[i].ySoulOffset - player.y - TopDownEntity.SIZE.y/2), 2) );
					
					var pangle:Number = Math.atan2((npcGroup.members[i].y + npcGroup.members[i].ySoulOffset - player.y - TopDownEntity.SIZE.y/2), (npcGroup.members[i].x + npcGroup.members[i].xSoulOffset - player.x - TopDownEntity.SIZE.x/2));
					player.angle = pangle;
					player.velocity.x = Math.cos(pangle) * Math.max(curDist, 77); // 112;
					player.velocity.y = Math.sin(pangle) * Math.max(curDist, 77); // 112;
					
					if (curDist < 10)
					{
						playerState = 0;
						player.state = 3;
						
						FlxG.log("LOG PUSHED! MESSAGE: " + currObjectStr + " ;;; region: " + npcGroup.members[i].region.toString());
					}
					
					FlxG.log("CURRENTLY LOCKED TO: " + i.toString() + " ... WITH LOCATION: (" + npcGroup.members[i].x.toString() +"," + npcGroup.members[i].y.toString() + ")");
				}
				else {
					npcGroup.members[i].color = 0xFFFFFFFF;
				}
				
				if ((npcGroup.members[i].state == 1) && (player.state == 4))
				{					
					player.state = 0;
				}
			}
			
			
		}
		
		/**
		 * Update each timestep
		 */
		override public function update():void {
			super.update();

			
			//FlxG.log("ACTIVE LA: " + activeLA.toString());
			
			if (gameNotStarted)
			{
				updateStartScreen();
				
				FlxG.keys.update();
				if (FlxG.keys.pressed("SPACE"))
				{
					gameNotStarted = false;
					soulSwitch();
				}
			}
			else
			{
				var i:int;
				if (soul_switch_timer < 200)
					soul_switch_timer += 1;
				FlxG.keys.update();
				
				if (FlxG.keys.pressed("SPACE") && soul_switch_timer > 40 && playerState == 0 && !displayMode)
				{
					soulSwitch();
					soul_switch_timer = 0;
				}
				
				if (FlxG.keys.pressed("ENTER") && soul_switch_timer > 40 && playerState == 0 && player.state == 0)
				{
					soul_switch_timer = 0;
				}
				
				updateSoul();
				
				for(i = 0; i < npcGroup.length; i++)
				{
					npcGroup.members[i].px = player.x;
					npcGroup.members[i].py = player.y;
				}
				
				if (player.health == 0)
				{
					//FlxG.switchState(new PlayState());
				}
				
				//update_GUI_lives(player.health);
			}
			
			// Update camera
			//FlxG.camera.setBounds(0, 0, levelSize.x, levelSize.y, true);
			//FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN);
			
			/*
			var n:NPC;
			foreach(n in npcGroup.members)
			{
				n.px = player.x;
				n.py = player.y;
			}*/
			//npcGroup.setAll(px, player.getMidpoint().x);
			//npcGroup.setAll(py, player.getMidpoint().y);
		}
	}
}
