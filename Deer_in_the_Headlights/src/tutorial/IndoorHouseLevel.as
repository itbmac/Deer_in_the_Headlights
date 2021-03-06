package tutorial 
{
	import flash.events.ErrorEvent;
	import flash.geom.Rectangle;
	import org.flixel.*;
	import topdown.*;
	
	/**
	 * A basic indoor scene
	 * @author MacKenzie Bates
	 */
	public class IndoorHouseLevel extends TopDownLevel
	{	
		//------------------------------
		//-------- Game Timer ----------
		//------------------------------
		public var hudCreated:Boolean = false;
		public var time_elapsed:FlxText;
		
		public var hud_img:FlxSprite;
		public var start_screen_img:FlxSprite;
		public var screenOverlay: FlxSprite;
		public var hudg:FlxGroup = new FlxGroup();
		public var backg:FlxGroup = new FlxGroup();
		
		public var LAs:Array = new Array();
		public var adjLAs:Array = new Array();
		
		// New
		private var LALeft : LevelArea;
		private var LACurrent : LevelArea;
		private var LARight : LevelArea;
		private var CurrentLAP : LevelAreaPrototype;
		private var currentLAPIndex : int;
		
		private const DEFAULT_START : FlxPoint = new FlxPoint(LevelArea.DEFAULT_WIDTH + 990, 620);
		
		private var midpoint : int = 0; // PlayState.LEVEL_SIZE.x / 2; // TODO: pick a multiple of level area size?
		
		public static var instance : IndoorHouseLevel;
		
		private var subindex : int;

		/**
		 * Constructor
		 * @param	state		State displaying the level
		 * @param	levelSize	Width and height of level (in pixels)
		 * @param	blockSize	Default width and height of each tile (in pixels)
		 */
		public function IndoorHouseLevel(state:FlxState, levelSize:FlxPoint):void {
			super(state, levelSize);
			instance = this;
		}
		
		/**
		 * Create the player
		 */
		override protected function createPlayer():void {
			player = new Player(DEFAULT_START.x, DEFAULT_START.y); //(playerStart.x, playerStart.y); // (4290, 720);
			FlxG.watch(player, "x", "x");
			FlxG.watch(player, "y", "y");
			FlxG.watch(this, "total", "Total Entities");
		}
		
		override protected function createMap() : void {
			setLAP(Assets.REGION_01);
		}
		
		public function getPlayerX():FlxPoint {
			return player.getMidpoint();
		}
		
		private function setLAP(index : int) : void
		{
			FlxG.log("Loading LAP " + index);
			player.odeermeter = 0;
			// TODO: don't reset if same index?
			currentLAPIndex = index;
			CurrentLAP = Assets.LAs[index - 1];
			
			if (LALeft != null)
				LALeft.destroy();
			if (LACurrent != null)
				LACurrent.destroy();
			if (LARight != null)
				LARight.destroy();

			subindex = 1;
			LALeft = CurrentLAP.make(new FlxPoint(0,0), this, currentLAPIndex, (subindex - 1) % 3);
			LACurrent = CurrentLAP.make(new FlxPoint(LevelArea.DEFAULT_WIDTH, 0), this, currentLAPIndex, subindex);
			LARight = CurrentLAP.make(new FlxPoint(2*LevelArea.DEFAULT_WIDTH, 0), this, currentLAPIndex, (subindex + 1) % 3);			
			LACurrent.toggleAllContent(true);
			LALeft.toggleAllContent(true);
			LARight.toggleAllContent(true);
			
			if (LACurrent.noLoop)
				FlxG.camera.setBounds(LACurrent.area.topLeft.x, LACurrent.area.topLeft.y, LACurrent.area.width, LACurrent.area.height, true);
			else
				FlxG.camera.setBounds(0, 0, levelSize.x, levelSize.y, true);
			
			if (player != null)
			{
				player.x = DEFAULT_START.x;
				player.y = DEFAULT_START.y;
			}
			
			if (FlxG.music)
				FlxG.music.stop();
			switch (currentLAPIndex) 
			{
				case Assets.REGION_01:
					FlxG.music = new FlxSound();
					FlxG.music.loadEmbedded(Assets.track1,true);
					FlxG.music.fadeIn(1.0);
				break;
				case Assets.REGION_02:
					FlxG.music = new FlxSound();
					FlxG.music.loadEmbedded(Assets.track1,true);
					FlxG.music.fadeIn(1.0);
				break;
				case Assets.REGION_03:
					FlxG.music = new FlxSound();
					FlxG.music.loadEmbedded(Assets.track2,true);
					FlxG.music.fadeIn(1.0);
				break;
				case Assets.REGION_04:
					FlxG.music = new FlxSound();
					FlxG.music.loadEmbedded(Assets.track2,true);
					FlxG.music.fadeIn(1.0);
				break;
				case Assets.REGION_05:
					FlxG.music = new FlxSound();
					FlxG.music.loadEmbedded(Assets.track3,true);
					FlxG.music.fadeIn(1.0);
				break;
				case Assets.REGION_06:
					FlxG.music = new FlxSound();
					FlxG.music.loadEmbedded(Assets.track4,true);
					FlxG.music.fadeIn(1.0);
				break;
				default:
			}
		}
		
		public function nextLevel() : void {
			setLAP((currentLAPIndex + 1) % (Assets.LAs.length + 1));
		}
		
		private function getSubindex(delta : int = 0) : int {
			var partial : int = (subindex + delta) % 3;
			if (partial < 0)
				partial += 3;
			return partial;
		}
		
		/**
		 * Update each timestep
		 */
		override public function update():void 
		{			
			super.update(); // NOTE: map -> player collision happens in super.update()

			//FlxG.log("Player at " + player.x.toString()  );
			var center : Number = (player.x + player.width / 2) ;
			
			// TODO: move to subroutine?
			var currentArea : Rectangle = LACurrent.area;
			if (LACurrent.noLoop)
			{
				if (player.x < currentArea.left)
					player.x = currentArea.left;
				else if (player.x > currentArea.right - player.width)
					player.x = currentArea.right - player.width;
			} else if (! LACurrent.area.contains(player.x, player.y))
			{
				if (player.x < currentArea.left)
				{
					FlxG.log("Left shift");
					LARight.destroy();
					
					player.x = currentArea.right - (currentArea.left - player.x);
					LACurrent.shift(5000);
					LALeft.shift(5000);
					//LARight.shift( -10000);
					subindex = getSubindex(-1);
					
					//var oldLeft :LevelArea = LALeft; 
					//LALeft = LARight;
					LARight = LACurrent;
					LACurrent = LALeft;
					
					LALeft = CurrentLAP.make(new FlxPoint(LACurrent.areaPosition.x - LevelArea.DEFAULT_WIDTH, LACurrent.areaPosition.y), this, currentLAPIndex, getSubindex(-1));
				} else if (player.x > currentArea.right)
				{
					FlxG.log("Right shift");
					LALeft.destroy();
					
					player.x = currentArea.left + (player.x - currentArea.right);
					//LALeft.shift(10000);
					LACurrent.shift( -5000);
					LARight.shift( -5000);
					
					//var oldLeft :LevelArea = LALeft; 
					LALeft = LACurrent;
					LACurrent = LARight;
					subindex = getSubindex(1);
					//LARight = oldLeft;
					
					LARight = CurrentLAP.make(new FlxPoint(LACurrent.areaPosition.x + LevelArea.DEFAULT_WIDTH, LACurrent.areaPosition.y), this, currentLAPIndex, getSubindex(1));
				} else
				{
					// TODO?: for these 2 errors possibly just move the player back into a valid position
					throw new Error("Player not in any known LA");
				}
				
				if (! LACurrent.area.contains(player.x, player.y))
				{
					throw new Error("LA rotation didn't catch up with player");
				}
			}
			
			if (FlxG.keys.pressed("ONE"))
				setLAP(Assets.REGION_01);
			else if (FlxG.keys.pressed("TWO"))
				setLAP(Assets.REGION_02);
			else if (FlxG.keys.pressed("THREE"))
				setLAP(Assets.REGION_03);
			else if (FlxG.keys.pressed("FOUR"))
				setLAP(Assets.REGION_04);
			else if (FlxG.keys.pressed("FIVE"))
				setLAP(Assets.REGION_05);
			else if (FlxG.keys.pressed("SIX"))
				setLAP(Assets.REGION_06);
			else if (FlxG.keys.pressed("L"))
				nextLevel();
			
			if (FlxG.keys.pressed("X"))
			{
				player.acceleration.x = 0;
				player.acceleration.y = 0;
				player.velocity.x = 0;
				player.velocity.y = 0;
				setFog(0.0);
				player.state = Player.STATE_FREE_ROAM;
				endZoom();
			}
		}
	}
}