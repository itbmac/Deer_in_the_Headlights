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
		
		private const DEFAULT_START : FlxPoint = new FlxPoint(LevelArea.DEFAULT_WIDTH + 90, 620);
		
		private var midpoint : int = 0; // PlayState.LEVEL_SIZE.x / 2; // TODO: pick a multiple of level area size?

		/**
		 * Constructor
		 * @param	state		State displaying the level
		 * @param	levelSize	Width and height of level (in pixels)
		 * @param	blockSize	Default width and height of each tile (in pixels)
		 */
		public function IndoorHouseLevel(state:FlxState, levelSize:FlxPoint):void {
			super(state, levelSize);
		}
		
		/**
		 * Create the player
		 */
		override protected function createPlayer():void {
			player = new Player(DEFAULT_START.x, DEFAULT_START.y); //(playerStart.x, playerStart.y); // (4290, 720);
		}
		
		override protected function createMap() : void {
			setLAP(0);
		}
		
		public function getPlayerX():FlxPoint {
			return player.getMidpoint();
		}
		
		private function setLAP(index : int) : void
		{
			trace("Loading LAP " + index);
			// TODO: don't reset if same index?
			currentLAPIndex = index;
			CurrentLAP = Assets.LAs[index];
			
			if (LALeft != null)
				LALeft.destroy();
			if (LACurrent != null)
				LACurrent.destroy();
			if (LARight != null)
				LARight.destroy();

			LALeft = CurrentLAP.make(new FlxPoint(0,0), this);
			LACurrent = CurrentLAP.make(new FlxPoint(LevelArea.DEFAULT_WIDTH, 0), this);
			LARight = CurrentLAP.make(new FlxPoint(2*LevelArea.DEFAULT_WIDTH, 0), this);
			LACurrent.toggleAllContent(true);
			
			if (player != null)
			{
				player.x = DEFAULT_START.x;
				player.y = DEFAULT_START.y;
			}
		}
		
		public function setLAAreas(newInd:int):void 
		{
			// DEACTIVATE ALL OLD ADJACENT LEVEL AREAS
			
			for each (var LAInd:int in adjLAs)
			{
				LAs[LAInd].toggleAllContent(true);
			}
			
			activeLA = newInd;
			adjLAs = new Array();
			
			// ADD 8 Addjacent LAs to array (check if valid before add)
			if (validLAIndex(activeLA - 1))                      // To Left
				adjLAs.push(activeLA - 1);
			if (validLAIndex(activeLA + 1))                      // To Right
				adjLAs.push(activeLA + 1);
			if (validLAIndex(activeLA - Assets.LA_NUM_WIDE))     // Above
				adjLAs.push(activeLA - Assets.LA_NUM_WIDE);
			if (validLAIndex(activeLA + Assets.LA_NUM_WIDE))     // Below
				adjLAs.push(activeLA + Assets.LA_NUM_WIDE);
			if (validLAIndex(activeLA - Assets.LA_NUM_WIDE - 1)) // Above Left Diagonal
				adjLAs.push(activeLA - Assets.LA_NUM_WIDE - 1);
			if (validLAIndex(activeLA - Assets.LA_NUM_WIDE + 1)) // Above Right Diagonal
				adjLAs.push(activeLA - Assets.LA_NUM_WIDE + 1);
			if (validLAIndex(activeLA + Assets.LA_NUM_WIDE - 1)) // Below Left Diagonal
				adjLAs.push(activeLA + Assets.LA_NUM_WIDE - 1);
			if (validLAIndex(activeLA + Assets.LA_NUM_WIDE + 1)) // Below Right Diagonal
				adjLAs.push(activeLA + Assets.LA_NUM_WIDE + 1);
			
			// ACTIVATE ALL NEW ADJACENT LEVEL AREAS
			for each (LAInd in adjLAs)
			{
				LAs[LAInd].toggleAllContent(true);
			}
			
			// MAKE SURE THE ACTIVE LA IS ON
			LAs[activeLA].toggleAllContent(true);
		}
		
		public function validLAIndex(i:int):Boolean 
		{
			return (i >= 0) && (i < Assets.LA_NUM_TOTAL);
		}
		
		/**
		 * Update each timestep
		 */
		override public function update():void 
		{			
			//if (activeLAChanged)
				//setLAAreas(activeLA);
			
			super.update(); // NOTE: map -> player collision happens in super.update()

			FlxG.log("Player at " + player.x.toString()  );
			var center : Number = (player.x + player.width / 2) ;
			//FlxG.log("(" + (player.x -FlxG.camera.scroll.x ) + "; " + player.x + ", Scroll: " + FlxG.camera.scroll.x.toString() + "," + FlxG.camera.scroll.y.toString() + ")");
			
			// TODO: move to subroutine?
			var currentArea : Rectangle = LACurrent.area;
			if (! LACurrent.area.contains(player.x, player.y))
			{
				if (player.x < currentArea.left)
				{
					LARight.destroy();
					
					player.x = currentArea.right - (currentArea.left - player.x);
					LARight = LACurrent;
					LACurrent = LALeft;
					
					LARight.shift(5000);
					LACurrent.shift(5000);
					LALeft = CurrentLAP.make(new FlxPoint(LACurrent.areaPosition.x - LevelArea.DEFAULT_WIDTH, LACurrent.areaPosition.y), this);
				} else if (player.x > currentArea.right)
				{
					LALeft.destroy();
					
					player.x = currentArea.left + (player.x - currentArea.right);
					LALeft = LACurrent;
					LACurrent = LARight;
					LALeft.shift(-5000);
					LACurrent.shift(-5000);
					
					LARight = CurrentLAP.make(new FlxPoint(LACurrent.areaPosition.x + LevelArea.DEFAULT_WIDTH, LACurrent.areaPosition.y), this);
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
				setLAP(0);
			else if (FlxG.keys.pressed("TWO"))
				setLAP(1);
			else if (FlxG.keys.pressed("THREE"))
				setLAP(2);
			else if (FlxG.keys.pressed("FOUR"))
				setLAP(3);
			else if (FlxG.keys.pressed("FIVE"))
				setLAP(4);
			else if (FlxG.keys.pressed("SIX"))
				setLAP(5);
			else if (FlxG.keys.pressed("L"))
				setLAP((currentLAPIndex + 1) % Assets.LAs.length);
		}
	}
}