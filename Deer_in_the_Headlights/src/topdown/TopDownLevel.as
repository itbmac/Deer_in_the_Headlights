package topdown 
{
	import org.flixel.*;
	import tutorial.Assets;
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
		public var npcGroup:FlxGroup;
		public var guiGroup:FlxGroup;
		public var srtScreenGroup:FlxGroup;
		private var srtScreenImg: FlxSprite;
		private var panicOverlayImg:FlxSprite;
		
		/**
		 * Player
		 */
		public var player:Player;
		public var playerStart:FlxPoint = new FlxPoint(1437, 1437);
		public var playerState:int = 0; // 0 - attached, 1 - in transit
		
		public var maxDistToSwitch:int = 500;
		public var currObjectStr:String = "";
		
		private var desiredZoom:Number = 1;
		private var desiredZoomReached:Boolean = false;
		public var zoomMode:Boolean = false;
		private var zoomOffset:int = -285;
		private var zoomAcceleration:Number = .05;
		private var zoomSwitchTimer:int = 0;
		private var zoomSwitchTimerDelay:int = 50;
		
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
			this.npcGroup = new FlxGroup();
			this.guiGroup = new FlxGroup();
			this.srtScreenGroup = new FlxGroup();
			// create the level
			this.create();
		}
		
		/**
		 * Create the whole level, including all sprites, maps, blocks, etc
		 */
		public function create():void {
			createMap();
			createGUI();
			createPlayer();
			createStartScreen();
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
		 * Create the start screen
		 */
		protected function createStartScreen():void {
			srtScreenImg = new FlxSprite(0,0, Assets.HUD_START_SCREEN);
			srtScreenImg.scrollFactor.x = srtScreenImg.scrollFactor.y = 0;
			srtScreenImg.exists = true;
			srtScreenGroup.add(srtScreenImg);
		}
		
		/**
		 * Create the overlay screen
		 */
		protected function createGUI():void {
			panicOverlayImg = new FlxSprite(0,0, Assets.PANIC_OVERLAY);
			panicOverlayImg.scrollFactor.x = panicOverlayImg.scrollFactor.y = 0;
			panicOverlayImg.exists = true;
			guiGroup.add(panicOverlayImg);
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
			add(guiGroup);
			add(player);
			add(srtScreenGroup);
		}
		
		/**
		 * Create the default camera for this level
		 */
		protected function createCamera():void {
			trace(levelSize.x);
			
			FlxG.worldBounds = new FlxRect(0, 0, levelSize.x, levelSize.y);
			
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
					//srtScreenImg.exists = false;
					srtScreenGroup.exists = false;
					gameNotStarted = false;
				}
			}
			else
			{
				var i:int;
				var moving:Boolean = true;
				
				FlxG.keys.update();
				
				if (FlxG.keys.pressed("RIGHT"))
					player.moveRight();
				else if (FlxG.keys.pressed("LEFT"))
					player.moveLeft();
				else if (FlxG.keys.pressed("UP"))
					player.moveUp();
				else if (FlxG.keys.pressed("DOWN"))
					player.moveDown();
				else
					moving = false;
					
				if (FlxG.keys.pressed("SPACE") && moving)
					player.moveSprint();
					
				if (zoomSwitchTimer > 0)
					zoomSwitchTimer--;
					
				if (FlxG.keys.pressed("ENTER") && (zoomSwitchTimer <= 0))
				{
					zoomMode = !zoomMode;
					zoomSwitchTimer = zoomSwitchTimerDelay;
					desiredZoomReached = false;
				}
				
				if (zoomMode)
				{
					desiredZoom = 2;
					guiGroup.exists = true;
				}
				else
				{
					desiredZoom = 1;
					guiGroup.exists = false;
				}
				
				
				if (!desiredZoomReached)
				{
					if (FlxG.camera.zoom < desiredZoom)
					{
						FlxG.camera.zoom += zoomAcceleration;
						FlxG.camera.y = zoomOffset * (FlxG.camera.zoom - 1);
						panicOverlayImg.alpha = (FlxG.camera.zoom - 1);
					}
					if (FlxG.camera.zoom > desiredZoom)
					{
						FlxG.camera.zoom -= zoomAcceleration;
						FlxG.camera.y = zoomOffset * (FlxG.camera.zoom - 1);
						panicOverlayImg.alpha = (FlxG.camera.zoom - 1);
					}
					if ((FlxG.camera.zoom == desiredZoom) && desiredZoom == 1)
					{
						FlxG.camera.y = 0;
						desiredZoomReached = true;
						panicOverlayImg.alpha = 0;
					}
					else if ((FlxG.camera.zoom == desiredZoom) && desiredZoom == 2)
					{
						FlxG.camera.y = zoomOffset;
						desiredZoomReached = true;
						panicOverlayImg.alpha = 1;
					}
				}
				
				FlxG.log(FlxG.camera.zoom);
			}
		}
	}
}
