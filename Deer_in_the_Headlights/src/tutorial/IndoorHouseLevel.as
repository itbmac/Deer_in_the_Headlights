package tutorial 
{
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
			player = new Player(4290, 420); //(playerStart.x, playerStart.y); // (4290, 720);
		}
		
		public function getPlayerX():FlxPoint {
			return player.getMidpoint();
		}
		
		override protected function createMap():void 
		{
			for (var i:int = 0; i < Assets.LA_NUM_TOTAL; i++)
			{
				var LA:LevelArea = new LevelArea(Assets.LA_LOCS[i], Assets.LA_NPCS[i], Assets.LA_BLS[i], Assets.LA_SFS[i], player, imgGroup, npcGroup, i);
				LAs.push(LA);
				add(LA);
			}
			
			setLAAreas(0);
		}
		
		public function setLAAreas(newInd:int):void 
		{
			// DEACTIVATE ALL OLD ADJACENT LEVEL AREAS
			
			for each (var LAInd:int in adjLAs)
			{
				LAs[LAInd].toggleAllContent(false);
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
			if (activeLAChanged)
				setLAAreas(activeLA);
			
			super.update(); // NOTE: map -> player collision happens in super.update()
		}
	}
}