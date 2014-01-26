package topdown 
{
	import org.flixel.*;
	import tutorial.Assets;
	import tutorial.Player;
	import tutorial.PlayState;
	import tutorial.Trigger;
	import tutorial.ZoomCamera;
	import tutorial.GameObject;
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
		public var backgroundImgGroup:FlxGroup;
		public var foregroundImgGroup:FlxGroup;
		public var npcGroup:FlxGroup;
		public var guiGroup:FlxGroup;
		public var srtScreenGroup:FlxGroup;
		private var srtScreenImg: FlxSprite;
		private var panicOverlayImg:FlxSprite;
		public var fogOverlayImg:FlxSprite;
		private var foregroundImg:FlxSprite;
		
		/**
		 * Player
		 */
		public var player:Player;
		public var playerStart:FlxPoint = new FlxPoint(1437, 1437);
		
		public var maxDistToSwitch:int = 500;
		public var currObjectStr:String = "";
		
		private var desiredZoom:Number = 2;
		private var desiredZoomReached:Boolean = true;
		public var zoomMode:Boolean = true;
		private var zoomOffset:int = -305;
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
			this.backgroundImgGroup = new FlxGroup();
			this.foregroundImgGroup = new FlxGroup();
			this.npcGroup = new FlxGroup();
			this.guiGroup = new FlxGroup();
			this.srtScreenGroup = new FlxGroup();
			// create the level
			this.create();
		}
		
		public function get total() : int {
			return groupTotal(this as FlxGroup);
		}
		
		public function groupTotal(g : FlxGroup) : int {
			var total : int = 0;
			for each (var x : FlxBasic in g.members) {
				if (x is FlxGroup)
				{
					total += groupTotal(x as FlxGroup);
				} else
				{
					total += 1;
				}
			}
			return total;
		}
		
		/**
		 * Create the whole level, including all sprites, maps, blocks, etc
		 */
		public function create():void {
			createPlayer();
			createMap();
			createGUI();
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
			
			fogOverlayImg = new FlxSprite(0,0, Assets.FOG_OVERLAY);
			fogOverlayImg.scrollFactor.x = fogOverlayImg.scrollFactor.y = 0;
			fogOverlayImg.alpha = 0;
			guiGroup.add(fogOverlayImg);
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
			add(backgroundImgGroup);
			add(npcGroup);
			add(player);
			add(foregroundImgGroup);
			add(guiGroup)
			add(srtScreenGroup);
			;
		}
		
		/**
		 * Create the default camera for this level
		 */
		protected function createCamera():void {
			//trace(levelSize.x);
			
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
		
		// The old soulSwitch
		public function checkTriggers():void
		{
			var closestDist:Number = 1000.0;
			var closest : Trigger;
			
			for each (var obj : FlxBasic in npcGroup.members)
			{
				if (obj is Trigger)
				{
					var npc : Trigger = obj as Trigger;
					
					var curDist:Number = Math.sqrt( Math.pow(npc.x + npc.xProximityOffset - player.x, 2) 
						+  Math.pow(npc.y + npc.yProximityOffset - player.y, 2) );
					
					//FlxG.log("AT " + (npc.x + npc.xProximityOffset) + "," + (npc.y + npc.yProximityOffset) + " WITH DISTANCE: " + curDist.toString());
					
					if (!npc.visited && (curDist < closestDist) && (curDist < npc.proximityThreshold))
					{
						closestDist = curDist;
						closest = npc;
						//FlxG.log("good");
					}
				}
			}
			
			if (closest)
			{
				FlxG.log("triggered");
				closest.activate();
				player.triggerBegin(closest); 
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
					zoomMode = false;
					desiredZoomReached = false;
					srtScreenGroup.exists = false;
					gameNotStarted = false;
				}
			}
			else
			{
				var i:int;
				var moving:Boolean = true;
				
				FlxG.keys.update();
				
				if (player.state == Player.STATE_FREE_ROAM)
				{
					if (FlxG.keys.pressed("RIGHT"))
						player.moveRight();
					if (FlxG.keys.pressed("LEFT"))
						player.moveLeft();
					if (FlxG.keys.pressed("UP"))
						player.moveUp();
					if (FlxG.keys.pressed("DOWN"))
						player.moveDown();
					
					if (!(FlxG.keys.pressed("DOWN") || FlxG.keys.pressed("UP")))
					{
						player.acceleration.y = 0;
					}
					
					if (!(FlxG.keys.pressed("RIGHT") || FlxG.keys.pressed("LEFT")))
					{
						player.acceleration.x = 0;
						moving = false;
					}
						
					if (FlxG.keys.pressed("SPACE") && moving)
						player.moveSprint();
					else
						player.sprint = false;
						
					checkTriggers();
				}
					
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
					guiGroup.exists = true;
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
				
				//FlxG.log(FlxG.camera.zoom);
			}
		}
		
		public function beginZoom() : void
		{
			zoomMode = true;
			zoomSwitchTimer = zoomSwitchTimerDelay;
			desiredZoomReached = false;
		}
		
		public function endZoom() : void
		{
			zoomMode = false;
			zoomSwitchTimer = zoomSwitchTimerDelay;
			desiredZoomReached = false;
		}
		
		public function setFog(val : Number): void
		{
			fogOverlayImg.alpha = val;
		}
	}
}
