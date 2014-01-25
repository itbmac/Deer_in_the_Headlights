package tutorial
{
	import flash.utils.ByteArray;
	import org.flixel.FlxPoint;
	/**
	 * Embeds and imports all assets for the game
	 * @author MacKenzie Bates
	 */
	public class Assets
	{
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                 HUD: FONTS                   --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		[Embed(source = "../../assets/font/FuturaExtended.ttf", fontFamily = "Futura", embedAsCFF = "false")] 	  		public	var	FontFutura:String;
		[Embed(source = "../../assets/font/arcadeclassic.ttf", fontFamily = "ArcadeClassic", embedAsCFF = "false")] 	public	var	FontArcClassic:String;
		[Embed(source = "../../assets/font/ka1.ttf", fontFamily = "Karmatic Arcade", embedAsCFF = "false")] 			public	var	FontArcKarmatic:String;
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------               HUD: THUMBNAILS                --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		[Embed(source = "../../assets/thumbnails/error.png")] public static var THUMBNAIL_ERROR:Class;
		[Embed(source = "../../assets/thumbnails/cat.png")] public static var THUMBNAIL_CAT:Class;
		[Embed(source = "../../assets/thumbnails/bird.png")] public static var THUMBNAIL_BIRD:Class;
		[Embed(source = "../../assets/thumbnails/cloud.png")] public static var THUMBNAIL_CLOUD:Class;
		[Embed(source = "../../assets/thumbnails/tree_1.png")] public static var THUMBNAIL_TREE_1:Class;
		[Embed(source = "../../assets/thumbnails/tree_2.png")] public static var THUMBNAIL_TREE_2:Class;
		
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                   SPRITES                    --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		[Embed(source = "../../assets/sprites/character_dead.png")]        public static var CHARACTER_DEAD_SPRITE:Class;
		[Embed(source = "../../assets/sprites/soul.png")]                  public static var SOUL_SPRITE:Class;
		
		[Embed(source = "../../assets/sprites/bat.png")]                   public static var SPRITE_BAT:Class;
		[Embed(source = "../../assets/sprites/bird.png")]                  public static var SPRITE_BIRD:Class;
		[Embed(source = "../../assets/sprites/bush.png")]                  public static var SPRITE_BUSH:Class;
		[Embed(source = "../../assets/sprites/cave_owl.png")]              public static var SPRITE_CAVE_OWL:Class;
		[Embed(source = "../../assets/sprites/dead_wolf.png")]             public static var SPRITE_DEAD_WOLF:Class;
		[Embed(source = "../../assets/sprites/deer.png")]                  public static var SPRITE_DEER:Class;
		[Embed(source = "../../assets/sprites/dog.png")]                   public static var SPRITE_DOG:Class;
		[Embed(source = "../../assets/sprites/fox.png")]                   public static var SPRITE_FOX:Class;
		[Embed(source = "../../assets/sprites/lizard.png")]                public static var SPRITE_LIZARD:Class;
		[Embed(source = "../../assets/sprites/mouse.png")]                 public static var SPRITE_MOUSE:Class;
		[Embed(source = "../../assets/sprites/ocelot.png")]                public static var SPRITE_OCELOT:Class;
		[Embed(source = "../../assets/sprites/owl.png")]                   public static var SPRITE_OWL:Class;
		[Embed(source = "../../assets/sprites/prairie_dog.png")]           public static var SPRITE_PRAIRIE_DOG:Class;
		[Embed(source = "../../assets/sprites/snake.png")]                 public static var SPRITE_SNAKE:Class;
		[Embed(source = "../../assets/sprites/spider.png")]                public static var SPRITE_SPIDER:Class;
		[Embed(source = "../../assets/sprites/squirrel.png")]              public static var SPRITE_SQUIRREL:Class;
		[Embed(source = "../../assets/sprites/tree01.png")]                public static var SPRITE_TREE_1:Class;
		[Embed(source = "../../assets/sprites/tree02.png")]                public static var SPRITE_TREE_2:Class;
		[Embed(source = "../../assets/sprites/tree03.png")]                public static var SPRITE_TREE_3:Class;
		[Embed(source = "../../assets/sprites/wolf.png")]                  public static var SPRITE_WOLF:Class;
		[Embed(source = "../../assets/sprites/wolf_cub.png")]              public static var SPRITE_WOLF_CUB:Class;
		[Embed(source = "../../assets/sprites/zebra.png")]                 public static var SPRITE_ZEBRA:Class;
	
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------              HUD & START SCREEN              --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		[Embed(source = "../../assets/images/start_screen.png")] public static var HUD_START_SCREEN:Class;
		[Embed(source = "../../assets/images/panic_mode.png")] public static var PANIC_OVERLAY:Class;
		
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                    MUSIC                     --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		[Embed(source = "../../assets/sound/god_beat_3.mp3")] public static var musicLoop:Class;
		
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------               REGION ENCODINGS               --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		public static var REGION_PLAINS:int = 0;
		public static var REGION_JUNGLE:int = 1;
		public static var REGION_OCEAN :int = 2;
		public static var REGION_SKY   :int = 3;
		public static var REGION_SPACE :int = 4;
		public static var REGION_UNDGRD:int = 5;
		public static var REGION_MNTN  :int = 6;
		
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 01                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		public static var STR_EMPTY:String = "";
		
		public static var LA_01_LOC:FlxPoint = new FlxPoint(0, 0);
		[Embed(source = "../../assets/background/background_sky_h.png")]                public static var LA_01_BL_01:Class;
		[Embed(source = "../../assets/background/background_stars_h1.png")]             public static var LA_01_BL_02:Class;
		[Embed(source = "../../assets/background/background_clouds_1_h1.png")]          public static var LA_01_BL_03:Class;
		[Embed(source = "../../assets/background/background_clouds_2_h1.png")]          public static var LA_01_BL_04:Class;
		[Embed(source = "../../assets/background/background_mountains_back_h1.png")]    public static var LA_01_BL_05:Class;
		[Embed(source = "../../assets/background/background_mountains_front_h1.png")]   public static var LA_01_BL_06:Class;
		[Embed(source = "../../assets/background/background_main_h1_2.png")]            public static var LA_01_BL_07:Class;
		public static var LA_01_BL:Array = new Array( Assets.LA_01_BL_01,
													  Assets.LA_01_BL_02,
													  Assets.LA_01_BL_03, 
													  Assets.LA_01_BL_04,
													  Assets.LA_01_BL_05,
													  Assets.LA_01_BL_06,
													  Assets.LA_01_BL_07
													);
		public static var LA_01_SF:Array = new Array( new FlxPoint(.3,1),
													  new FlxPoint(.4,1),
													  new FlxPoint(.5,1),
													  new FlxPoint(.5,1),
													  new FlxPoint(.75,1),
													  new FlxPoint(.85,1),
													  new FlxPoint(1,1)
													);
		public static var LA_01_NPCS:Array = new Array(
	//		new Array(220, 670, 0,       Assets.CHARACTER_DEAD_SPRITE,    Assets.STR_PRINCESS,    Assets.REGION_PLAINS),
	//		new Array(600, 670, 0,       Assets.CHARACTER_DEAD_SPRITE,    Assets.STR_KING,        Assets.REGION_PLAINS),
	//		new Array(1300, 670, 0,      Assets.CHARACTER_DEAD_SPRITE,    Assets.STR_EMPTY,       Assets.REGION_PLAINS),
	//		new Array(1400, 670, 1,      Assets.CHARACTER_DEAD_SPRITE,    Assets.STR_EMPTY,       Assets.REGION_PLAINS),
	//		new Array(850, 750, 0,       Assets.SPRITE_DEER,             Assets.STR_5,           Assets.REGION_PLAINS, 1, 650, 0, 3),
	//		new Array(1650, 670, 0,      Assets.SPRITE_DEER,              Assets.STR_4,           Assets.REGION_PLAINS, 1, 150, 0, 2),
			new Array(1820, 670, 0,      Assets.SPRITE_BUSH,              Assets.STR_EMPTY,       Assets.REGION_PLAINS),
	//		new Array(2150, 770, 0,      Assets.SPRITE_DEER,               Assets.STR_3,           Assets.REGION_PLAINS, 1, 275, 0, 2),
			new Array(2300, 270, 0,      Assets.SPRITE_TREE_1,            Assets.STR_EMPTY,       Assets.REGION_PLAINS), 
	//		new Array(2750, 670, 0,      Assets.SPRITE_DEER,              Assets.STR_2,           Assets.REGION_PLAINS, 1, 125, 0, 2), 
	//		new Array(3350, 670, 0,      Assets.SPRITE_DEER,              Assets.STR_1,           Assets.REGION_PLAINS, 1, 200, 0, 2),
			new Array(2650, 170, 0,      Assets.SPRITE_TREE_2,            Assets.STR_EMPTY,       Assets.REGION_PLAINS),
			new Array(3600, 390, 0,      Assets.SPRITE_TREE_3,            Assets.STR_EMPTY,       Assets.REGION_PLAINS)
	//		new Array(4200, 670, 1,      Assets.CHARACTER_DEAD_SPRITE,    Assets.STR_EMPTY,       Assets.REGION_PLAINS)
			);	
			
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 02                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_02_LOC:FlxPoint = new FlxPoint(5000, 0);
		[Embed(source = "../../assets/background/background_stars_h2.png")]             public static var LA_02_BL_02:Class;
		[Embed(source = "../../assets/background/background_clouds_1_h2.png")]          public static var LA_02_BL_03:Class;
		[Embed(source = "../../assets/background/background_clouds_2_h2.png")]          public static var LA_02_BL_04:Class;
		[Embed(source = "../../assets/background/background_mountains_back_h2.png")]    public static var LA_02_BL_05:Class;
		[Embed(source = "../../assets/background/background_mountains_front_h2.png")]   public static var LA_02_BL_06:Class;
		[Embed(source = "../../assets/background/background_main_h2_2.png")]            public static var LA_02_BL_07:Class;
		public static var LA_02_BL:Array = new Array( Assets.LA_01_BL_01,
													  Assets.LA_02_BL_02,
													  Assets.LA_02_BL_03, 
													  Assets.LA_02_BL_04,
													  Assets.LA_02_BL_05,
													  Assets.LA_02_BL_06,
													  Assets.LA_02_BL_07
													);
		public static var LA_02_SF:Array = new Array( new FlxPoint(.3,1),
													  new FlxPoint(.4,1),
													  new FlxPoint(.5,1),
													  new FlxPoint(.5,1),
													  new FlxPoint(.75,1),
													  new FlxPoint(.85,1),
													  new FlxPoint(1,1)
													);
		public static var LA_02_NPCS:Array = new Array(
	//		new Array(-450, 750, 0,      Assets.SPRITE_MOUSE,             Assets.STR_A,           Assets.REGION_PLAINS, 1, 205, 0, 2),
	//		new Array(250, 670, 0,       Assets.SPRITE_WOLF,              Assets.STR_B,           Assets.REGION_PLAINS, 1, 400, 0, 2),
			new Array(-350, 270, 0,      Assets.SPRITE_TREE_1,            Assets.STR_EMPTY,       Assets.REGION_PLAINS), 
	//		new Array(950, 830, 0,       Assets.SPRITE_DEAD_WOLF,         Assets.STR_EMPTY,       Assets.REGION_PLAINS),
	//		new Array(1000, 770, 2,      Assets.SPRITE_WOLF_CUB,          Assets.STR_EMPTY,       Assets.REGION_PLAINS),
			new Array(850, 540, 0,       Assets.SPRITE_SPIDER,            Assets.STR_EMPTY,           Assets.REGION_PLAINS, 1, 0, 70, 0, 1),
			new Array(820, 170, 0,       Assets.SPRITE_TREE_2,            Assets.STR_EMPTY,       Assets.REGION_PLAINS),
			new Array(1300, 670, 0,      Assets.SPRITE_SQUIRREL,          Assets.STR_EMPTY,           Assets.REGION_PLAINS, 1, 0, 110, 0, 1),
	//		new Array(1500, 670, 0,      Assets.SPRITE_DEER,              Assets.STR_E,           Assets.REGION_PLAINS, 1, 150, 0, 2),
	//		new Array(1780, 780, 0,      Assets.SPRITE_FOX,               Assets.STR_F,           Assets.REGION_PLAINS, 1, 125, 0, 2), 
			new Array(1650, 760, 0,      Assets.SPRITE_BUSH,              Assets.STR_EMPTY,       Assets.REGION_PLAINS), 
			new Array(1850, 470, 0,      Assets.SPRITE_TREE_3,            Assets.STR_EMPTY,       Assets.REGION_PLAINS),
			new Array(1850, 470, 0,      Assets.SPRITE_OWL,               Assets.STR_EMPTY,           Assets.REGION_PLAINS),
			new Array(2150, 400, 0,      Assets.SPRITE_BIRD,              Assets.STR_EMPTY,           Assets.REGION_PLAINS, 1, 300, 0, 2),
			new Array(2300, 170, 0,      Assets.SPRITE_TREE_1,            Assets.STR_EMPTY,       Assets.REGION_PLAINS)
	//		new Array(2650, 600, 0,      Assets.SPRITE_ZEBRA,             Assets.STR_I,           Assets.REGION_PLAINS, 1, 300, 0, 2),
	//		new Array(3200, 700, 0,      Assets.SPRITE_PRAIRIE_DOG,       Assets.STR_J,           Assets.REGION_PLAINS),
	//		new Array(3450, 700, 0,      Assets.SPRITE_LIZARD,            Assets.STR_K,           Assets.REGION_PLAINS, 1, 200, 0, 2),
	//		new Array(3700, 660, 0,      Assets.SPRITE_SNAKE,             Assets.STR_L,           Assets.REGION_PLAINS),
	//		new Array(3950, 560, 0,      Assets.SPRITE_BAT,               Assets.STR_M,           Assets.REGION_PLAINS, 1, 150, 0, 2),
	//		new Array(4100, 480, 0,      Assets.SPRITE_CAVE_OWL,          Assets.STR_N,           Assets.REGION_PLAINS),
	//		new Array(4250, 660, 0,      Assets.SPRITE_OCELOT,            Assets.STR_O,           Assets.REGION_PLAINS, 1, 150, 0, 2),
	//		new Array(4600, 680, 0,      Assets.SPRITE_DOG,               Assets.STR_P,           Assets.REGION_PLAINS),
	//		new Array(4700, 680, 0,      Assets.CHARACTER_DEAD_SPRITE,    Assets.STR_KNIGHT,      Assets.REGION_PLAINS),
	//		new Array(4800, 680, 0,      Assets.CHARACTER_DEAD_SPRITE,    Assets.STR_PRINCESS,    Assets.REGION_PLAINS)
			);
				
		
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 03                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_03_LOC:FlxPoint = new FlxPoint(10000, 0);
		[Embed(source = "../../assets/background/background_stars_h2.png")]             public static var LA_03_BL_02:Class;
		[Embed(source = "../../assets/background/background_clouds_1_h2.png")]          public static var LA_03_BL_03:Class;
		[Embed(source = "../../assets/background/background_clouds_2_h2.png")]          public static var LA_03_BL_04:Class;
		[Embed(source = "../../assets/city/building_1_store.png")]                      public static var BUILDING_01:Class;
		[Embed(source = "../../assets/city/bus_stop.png")]                              public static var BUS_STOP_SIGN:Class;
		[Embed(source = "../../assets/city/stoplight.png")]                             public static var STOP_LIGHT:Class;
		[Embed(source = "../../assets/city/street_light.png")]                          public static var STREET_LIGHT:Class;
		[Embed(source = "../../assets/forest/tree2.png")]                               public static var TREE:Class;
		public static var LA_03_BL:Array = new Array( Assets.LA_01_BL_01,
													  Assets.LA_03_BL_02,
													  Assets.LA_03_BL_03, 
													  Assets.LA_03_BL_04
													);
		public static var LA_03_SF:Array = new Array( new FlxPoint(.3,1),
													  new FlxPoint(.4,1),
													  new FlxPoint(.5,1),
													  new FlxPoint(.5,1)
													);
		public static var LA_03_NPCS:Array = new Array(
				new Array(0, 300, 0,      Assets.BUILDING_01,            Assets.STR_EMPTY,       Assets.REGION_PLAINS),
				new Array(50, 100, 0,      Assets.STOP_LIGHT,            Assets.STR_EMPTY,       Assets.REGION_PLAINS),
				new Array(0, 150, 0,      Assets.STREET_LIGHT,            Assets.STR_EMPTY,       Assets.REGION_PLAINS),
				new Array(100, 150, 0,      Assets.BUS_STOP_SIGN,            Assets.STR_EMPTY,       Assets.REGION_PLAINS),
				new Array(400, 100, 0,      Assets.TREE,            Assets.STR_EMPTY,       Assets.REGION_PLAINS)
				
			);
			
			
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------             VER 1.1: LEVEL AREAS             --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_NUM_TOTAL:int = 3;
		public static var LA_NUM_WIDE:int = 3;
		public static var LA_NUM_TALL:int = 1;
		public static var LA_LOCS:Array = new Array( Assets.LA_01_LOC,
													 Assets.LA_02_LOC,
													 Assets.LA_03_LOC
												   );
		public static var LA_BLS:Array = new Array( Assets.LA_01_BL,
													Assets.LA_02_BL,
													Assets.LA_03_BL
												  );
		public static var LA_SFS:Array = new Array( Assets.LA_01_SF, 
													Assets.LA_02_SF,
													Assets.LA_03_SF
												  );
		public static var LA_NPCS:Array = new Array( Assets.LA_01_NPCS, 
													 Assets.LA_02_NPCS,
													 Assets.LA_03_NPCS
												   );
		
	}
}
