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
		// ----------------------------------------------                   SPRITES                    --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		[Embed(source = "../../assets/deer/deer4.png")]                                  public static var SPRITE_DEER:Class;
		[Embed(source = "../../assets/forest/drunk_leaf.png")]                           public static var DRUNK_LEAF:Class;
		
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                  DEMO IMGS                   --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		[Embed(source = "../../assets/grounds/area_01_back_left.png")]     public static var R_01_L:Class;
		[Embed(source = "../../assets/grounds/area_01_back_center.png")]   public static var R_01_C:Class;
		[Embed(source = "../../assets/grounds/area_01_back_right.png")]    public static var R_01_R:Class;
		
		[Embed(source = "../../assets/grounds/area_02_back_left.png")]     public static var R_02_L:Class;
		[Embed(source = "../../assets/grounds/area_02_back_center.png")]   public static var R_02_C:Class;
		[Embed(source = "../../assets/grounds/area_02_back_right.png")]    public static var R_02_R:Class;
		
		[Embed(source = "../../assets/grounds/area_03_back_left.png")]     public static var R_03_L:Class;
		[Embed(source = "../../assets/grounds/area_03_back_center.png")]   public static var R_03_C:Class;
		[Embed(source = "../../assets/grounds/area_03_back_right.png")]    public static var R_03_R:Class;
		
		[Embed(source = "../../assets/grounds/area_04_back_left.png")]     public static var R_04_L:Class;
		[Embed(source = "../../assets/grounds/area_04_back_center.png")]   public static var R_04_C:Class;
		[Embed(source = "../../assets/grounds/area_04_back_right.png")]    public static var R_04_R:Class;
		
		[Embed(source = "../../assets/grounds/area_05_back_left.png")]     public static var R_05_L:Class;
		[Embed(source = "../../assets/grounds/area_05_back_center.png")]   public static var R_05_C:Class;
		[Embed(source = "../../assets/grounds/area_05_back_right.png")]    public static var R_05_R:Class;
		
		[Embed(source = "../../assets/grounds/area_06_back.png")]             public static var R_06_BL:Class;
		
		[Embed(source = "../../assets/grounds/area_01_fore.png")]             public static var R_01_FL:Class;
		[Embed(source = "../../assets/grounds/area_02_fore.png")]             public static var R_02_FL:Class;
		[Embed(source = "../../assets/grounds/area_03_fore.png")]             public static var R_03_FL:Class;
		[Embed(source = "../../assets/grounds/area_04_fore.png")]             public static var R_04_FL:Class;
		[Embed(source = "../../assets/grounds/area_05_fore.png")]             public static var R_05_FL:Class;
		[Embed(source = "../../assets/grounds/area_06_fore.png")]             public static var R_06_FL:Class;
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                  TRIGGERS                   ---------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		[Embed(source = "../../assets/triggers/trigger_fountain_ALL.png")]                   public static var FOUNTAIN:Class;
		[Embed(source = "../../assets/triggers/trigger_streetlight_ALL.png")]                public static var STREETLIGHT:Class;
		[Embed(source = "../../assets/triggers/stoplight_trigger.png")]                      public static var STOPLIGHT:Class;
		[Embed(source = "../../assets/triggers/trigger_root.png")]                           public static var ROOT_TRIGGER:Class;
		[Embed(source = "../../assets/triggers/carsheet.png")]                               public static var CAR_TRIGGER:Class;
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------              HUD & START SCREEN              --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		[Embed(source = "../../assets/images/start_screen_4.png")]                  public static var HUD_START_SCREEN:Class;
		[Embed(source = "../../assets/images/panic_mode_extreme_square.png")]       public static var FOG_OVERLAY:Class;
		[Embed(source = "../../assets/images/panic_mode_square.png")]               public static var PANIC_OVERLAY:Class;
		
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                    MUSIC                     --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		[Embed(source = "../../assets/sound/act_3.mp3")]           public static var track1:Class; // music for region 1-2
		[Embed(source = "../../assets/sound/god_beat_3.mp3")]      public static var track2:Class; // music for region 3-4
		[Embed(source = "../../assets/sound/street_music_1.mp3")]  public static var track3:Class; // music for region 5
		[Embed(source = "../../assets/sound/act_1_hack.mp3")]      public static var track4:Class; // music for region 6
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------               REGION ENCODINGS               --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		public static var REGION_01 :int = 1;
		public static var REGION_02 :int = 2;
		public static var REGION_03 :int = 3;
		public static var REGION_04 :int = 4;
		public static var REGION_05 :int = 5;
		public static var REGION_06 :int = 6;
		
		public static var STR_EMPTY:String = "";
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 01                 --------------------------------------------
		// ---------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_01_BL:Array = new Array( Assets.R_01_C
													);
		public static var LA_01_FL:Array = new Array( Assets.R_01_FL
													);
		public static var LA_01_SF:Array = new Array( new FlxPoint(1, 1)
													);
		private static var LA_01_NPCS:Array = new Array(
				new TriggerPrototype(Assets.STREETLIGHT, 1590, 475, 250, 200, 200, true, false, true,0),
				new ProceduralObjectProtoype(Assets.DRUNK_LEAF,0,0,0,0.01,0,0,1.0,1.0,64.0)
			);	
		
		public static var LA_01 : LevelAreaPrototype = new LevelAreaPrototype(LA_01_NPCS, [[Assets.R_01_L],[Assets.R_01_C],[Assets.R_01_R]]);
			
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 02                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_02_BL:Array = new Array( Assets.R_02_C
													);
		public static var LA_02_FL:Array = new Array( Assets.R_02_FL
													);
		public static var LA_02_SF:Array = new Array( new FlxPoint(1, 1)
													);
		
		private static var LA_02_NPCS:Array = new Array(
				new TriggerPrototype(Assets.FOUNTAIN, 2590, 400, 250, 200, 200,true, false, true,0),
				new ProceduralObjectProtoype(Assets.DRUNK_LEAF,0,0,0,0.01,0,0,1.0,1.0,64.0)
			);	
		
		public static var LA_02 : LevelAreaPrototype = new LevelAreaPrototype(LA_02_NPCS, [[Assets.R_02_L],[Assets.R_02_C],[Assets.R_02_R]]);
		
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 03                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_03_BL:Array = new Array( Assets.R_03_C
													);
		public static var LA_03_FL:Array = new Array( Assets.R_03_FL
													);
		public static var LA_03_SF:Array = new Array( new FlxPoint(1, 1)
													);
		
		private static var LA_03_NPCS:Array = new Array(
				new TriggerPrototype(Assets.CAR_TRIGGER, 3590, 600, 400, 200, 200,true, false, true,0)
			);	
		
		public static var LA_03 : LevelAreaPrototype = new LevelAreaPrototype(LA_03_NPCS, [[Assets.R_03_L],[Assets.R_03_C],[Assets.R_03_R]]);
			
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 04                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_04_BL:Array = new Array( Assets.R_04_C
													);
		public static var LA_04_FL:Array = new Array( Assets.R_04_FL
													);
		public static var LA_04_SF:Array = new Array( new FlxPoint(1, 1)
													);
		
		private static var LA_04_NPCS:Array = new Array(
				new TriggerPrototype(Assets.STOPLIGHT, 2590, 400, 250, 200, 200,true, false, true,0)
			);	
		
		public static var LA_04 : LevelAreaPrototype = new LevelAreaPrototype(LA_04_NPCS, [[Assets.R_04_L],[Assets.R_04_C],[Assets.R_04_R]]);
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 05                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_05_BL:Array = new Array( Assets.R_05_C
													);
		public static var LA_05_FL:Array = new Array( Assets.R_05_FL
													);
		public static var LA_05_SF:Array = new Array( new FlxPoint(1, 1)
													);
		
		private static var LA_05_NPCS:Array = new Array(
				new TriggerPrototype(Assets.ROOT_TRIGGER, 2590, 750, 150, 200, 100,true, false, true,0)
			);	
		
		public static var LA_05 : LevelAreaPrototype = new LevelAreaPrototype(LA_05_NPCS, [[Assets.R_05_L],[Assets.R_05_C],[Assets.R_05_R]]);
			
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 06                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_06_BL:Array = new Array( Assets.R_06_BL
													);
		public static var LA_06_FL:Array = new Array( Assets.R_06_FL
													);
		public static var LA_06_SF:Array = new Array( new FlxPoint(1, 1)
													);
		
		private static var LA_06_NPCS:Array = new Array(
				
			);	
		
		public static var LA_06 : LevelAreaPrototype = new LevelAreaPrototype(LA_06_NPCS, [[Assets.R_06_BL],[Assets.R_06_BL],[Assets.R_06_BL]]);
			
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------             VER 1.1: LEVEL AREAS             --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_NUM_TOTAL:int = 6;
		public static var LA_NUM_WIDE:int = 6;
		public static var LA_NUM_TALL:int = 1;
		public static var LA_BLS:Array = new Array( Assets.LA_01_BL,
													Assets.LA_02_BL,
													Assets.LA_03_BL,
													Assets.LA_04_BL,
													Assets.LA_05_BL,
													Assets.LA_06_BL
												  );
		public static var LA_FLS:Array = new Array( Assets.LA_01_FL,
													Assets.LA_02_FL,
													Assets.LA_03_FL,
													Assets.LA_04_FL,
													Assets.LA_05_FL,
													Assets.LA_06_FL
												  );
		public static var LA_SFS:Array = new Array( Assets.LA_01_SF, 
													Assets.LA_02_SF,
													Assets.LA_03_SF,
													Assets.LA_04_SF,
													Assets.LA_05_SF,
													Assets.LA_06_SF
												  );
		public static var LAs:Array = new Array( Assets.LA_01, 
												 Assets.LA_02,
												 Assets.LA_03,
												 Assets.LA_04,
									  			 Assets.LA_05,
												 Assets.LA_06
												   );
		
	}
}
