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
		
		[Embed(source = "../../assets/sprites/bird.png")]                  public static var SPRITE_BIRD:Class;
		[Embed(source = "../../assets/sprites/bush.png")]                  public static var SPRITE_BUSH:Class;
		[Embed(source = "../../assets/deer3_triple.png")]                         public static var SPRITE_DEER:Class;
		[Embed(source = "../../assets/sprites/dog.png")]                   public static var SPRITE_DOG:Class;
		[Embed(source = "../../assets/sprites/owl.png")]                   public static var SPRITE_OWL:Class;
		[Embed(source = "../../assets/sprites/spider.png")]                public static var SPRITE_SPIDER:Class;
		[Embed(source = "../../assets/sprites/squirrel.png")]              public static var SPRITE_SQUIRREL:Class;
		[Embed(source = "../../assets/sprites/tree01.png")]                public static var SPRITE_TREE_1:Class;
		[Embed(source = "../../assets/sprites/tree02.png")]                public static var SPRITE_TREE_2:Class;
		[Embed(source = "../../assets/sprites/tree03.png")]                public static var SPRITE_TREE_3:Class;
		
		[Embed(source = "../../assets/city/buildings_background_small.png")]                  public static var LA_03_BL_04:Class;
		[Embed(source = "../../assets/city/building_1_store.png")]                      public static var BUILDING_01:Class;
		[Embed(source = "../../assets/city/bus_stop.png")]                              public static var BUS_STOP_SIGN:Class;
		[Embed(source = "../../assets/city/stoplight.png")]                             public static var STOP_LIGHT:Class;
		[Embed(source = "../../assets/city/street_light.png")]                          public static var STREET_LIGHT:Class;
		[Embed(source = "../../assets/forest/tree2.png")]                               public static var TREE:Class;
	
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------              HUD & START SCREEN              --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		[Embed(source = "../../assets/images/start_screen_2.png")] public static var HUD_START_SCREEN:Class;
		[Embed(source = "../../assets/images/panic_mode_square_3.png")] public static var FOG_OVERLAY:Class;
		[Embed(source = "../../assets/images/panic_mode_square.png")] public static var PANIC_OVERLAY:Class;
		
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                    MUSIC                     --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		//[Embed(source = "../../assets/sound/god_beat_3.mp3")] public static var musicLoop:Class;
		[Embed(source = "../../assets/sound/act_3.mp3")] public static var musicLoop:Class;
		
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
		
		[Embed(source = "../../assets/city/forest_full_light.png")]            public static var FIR:Class;
		[Embed(source = "../../assets/city/forest_full_between.png")]                     public static var SND:Class;
		[Embed(source = "../../assets/city/test_city_3rd.png")]                         public static var TRD:Class;
		[Embed(source = "../../assets/city/test_city_background.png")]                  public static var FTH:Class;
		
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 01                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		public static var STR_EMPTY:String = "";
		
		public static var LA_01_LOC:FlxPoint = new FlxPoint(0, 0);
		public static var LA_01_BL:Array = new Array( Assets.FIR
													);
		public static var LA_01_SF:Array = new Array( new FlxPoint(1, 1)
													);
		public static var LA_01_NPCS:Array = new Array(
				new Array(-500, 200, 0,      Assets.TREE,            Assets.STR_EMPTY,       Assets.REGION_PLAINS)
			);	
			
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 02                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_02_LOC:FlxPoint = new FlxPoint(5000, 0);
		
		public static var LA_02_BL:Array = new Array( Assets.SND
													);
		public static var LA_02_SF:Array = new Array(
													  new FlxPoint(1,1)
													);
		public static var LA_02_NPCS:Array = new Array(
				new Array(-500, 200, 0,      Assets.TREE,            Assets.STR_EMPTY,       Assets.REGION_PLAINS)
			);
				
		
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 03                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_03_LOC:FlxPoint = new FlxPoint(10000, 0);
		public static var LA_03_BL:Array = new Array(Assets.TRD
													);
		public static var LA_03_SF:Array = new Array(
													  new FlxPoint(1,1)
													);
		public static var LA_03_NPCS:Array = new Array(
				new Array(-500, 200, 0,      Assets.TREE,            Assets.STR_EMPTY,       Assets.REGION_PLAINS)
				
			);
			
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 04                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_04_LOC:FlxPoint = new FlxPoint(15000, 0);
		public static var LA_04_BL:Array = new Array(Assets.FTH
													);
		public static var LA_04_SF:Array = new Array(
													  new FlxPoint(1,1)
													);
		public static var LA_04_NPCS:Array = new Array(
				new Array(-500, 200, 0,      Assets.TREE,            Assets.STR_EMPTY,       Assets.REGION_PLAINS)
				
			);
			
			
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------             VER 1.1: LEVEL AREAS             --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_NUM_TOTAL:int = 4;
		public static var LA_NUM_WIDE:int = 4;
		public static var LA_NUM_TALL:int = 1;
		public static var LA_LOCS:Array = new Array( Assets.LA_01_LOC,
													 Assets.LA_02_LOC,
													 Assets.LA_03_LOC,
													 Assets.LA_04_LOC
												   );
		public static var LA_BLS:Array = new Array( Assets.LA_01_BL,
													Assets.LA_02_BL,
													Assets.LA_03_BL,
													Assets.LA_04_BL
												  );
		public static var LA_SFS:Array = new Array( Assets.LA_01_SF, 
													Assets.LA_02_SF,
													Assets.LA_03_SF,
													Assets.LA_04_SF
												  );
		public static var LA_NPCS:Array = new Array( Assets.LA_01_NPCS, 
													 Assets.LA_02_NPCS,
													 Assets.LA_03_NPCS,
													 Assets.LA_04_NPCS
												   );
		
	}
}
