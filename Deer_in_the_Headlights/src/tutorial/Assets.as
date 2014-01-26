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
		/*[Embed(source = "../../assets/forest/tree2.png")]                                public static var TREE:Class;
		[Embed(source = "../../assets/forest/tree1_resize.png")]                         public static var TREE1:Class;
		[Embed(source = "../../assets/forest/tree2_resize.png")]                         public static var TREE2:Class;
		[Embed(source = "../../assets/forest/tree3_resize.png")]                         public static var TREE3:Class;
		[Embed(source = "../../assets/forest/forest_mid_light.png")]                     public static var FOREST_MID_LIGHT:Class;
		[Embed(source = "../../assets/forest/tree_bg_light.png")]                        public static var TREE_BG_LIGHT:Class;
		[Embed(source = "../../assets/forest/forest_backdrop_light.png")]                public static var FOREST_BG_LIGHT:Class;
		[Embed(source = "../../assets/forest/ground_mid_light.png")]                     public static var FOREST_GROUND_MID_LIGHT:Class;*/
		[Embed(source = "../../assets/forest/drunk_leaf.png")]                           public static var DRUNK_LEAF:Class;
		[Embed(source = "../../assets/forest/firefly.png")]                           public static var FIREFLY:Class;
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                  DEMO IMGS                   --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		[Embed(source = "../../assets/grounds/area_01_back_center.png")]   public static var R_01_BL:Class;
		[Embed(source = "../../assets/demo/area_01.png")]                  public static var R_01_FL:Class;
		
		[Embed(source = "../../assets/demo/area_02.png")]                  public static var R_02_BL:Class;
		[Embed(source = "../../assets/demo/area_02.png")]                  public static var R_02_FL:Class;
		
		[Embed(source = "../../assets/grounds/area_03_back.png")]          public static var R_03_BL:Class;
		[Embed(source = "../../assets/demo/area_03_back.png")]             public static var R_03_FL:Class;
		
		[Embed(source = "../../assets/grounds/area_04_back.png")]          public static var R_04_BL:Class;
		[Embed(source = "../../assets/grounds/area_04_fore.png")]          public static var R_04_FL:Class;
		
		[Embed(source = "../../assets/demo/area_05_back.png")]             public static var R_05_BL:Class;
		[Embed(source = "../../assets/demo/area_05_fore.png")]             public static var R_05_FL:Class;
		
		[Embed(source = "../../assets/demo/area_06_back.png")]             public static var R_06_BL:Class;
		[Embed(source = "../../assets/demo/area_06_fore.png")]             public static var R_06_FL:Class;
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                  TRIGGERS                   ---------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		[Embed(source = "../../assets/triggers/trigger_fountain_anim.png")]                  public static var FOUNTAIN:Class;
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------              HUD & START SCREEN              --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		[Embed(source = "../../assets/images/start_screen_4.png")]           public static var HUD_START_SCREEN:Class;
		[Embed(source = "../../assets/images/panic_mode_extreme_square.png")]       public static var FOG_OVERLAY:Class;
		[Embed(source = "../../assets/images/panic_mode_square.png")]        public static var PANIC_OVERLAY:Class;
		
		
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
		
		public static var LA_01_BL:Array = new Array( Assets.R_01_BL
													);
		public static var LA_01_FL:Array = new Array( //Assets.R_01_FL
													);
		public static var LA_01_SF:Array = new Array( new FlxPoint(1, 1)
													);
		private static var LA_01_NPCS:Array = new Array(
			new TriggerPrototype(Assets.FOUNTAIN, 1590, 400, 250, 200, 200, true, false, true,1000),
			new ProceduralObjectProtoype(Assets.DRUNK_LEAF, 0, 0, 0, 0.01, 0, 0, 1.0, 1.0, 64.0)
				//new FixedObjectPrototype(Assets.TREE1, 50, 50)
				//new BackgroundPrototype(Assets.FOREST_BG_LIGHT),
				/*new BackgroundPrototype(Assets.FOREST_GROUND_MID_LIGHT, 0, 0, 0, 1, 700, 0, 1.0),
				new ProceduralObjectProtoype(Assets.TREE_BG_LIGHT, 0, 0, Assets.REGION_PLAINS, 0.001, 0, 0, 1, 1),
				new ProceduralObjectProtoype(Assets.FOREST_MID_LIGHT, 0, 0, Assets.REGION_PLAINS, 0.001, 0, 0, 1, 0.75),
				new ProceduralObjectProtoype(Assets.TREE1, 0, 0, Assets.REGION_PLAINS, 0.00025, 200),
				new ProceduralObjectProtoype(Assets.TREE2, 0, 0, Assets.REGION_PLAINS, 0.00025, 200),*/
			);	
		
		public static var LA_01 : LevelAreaPrototype = new LevelAreaPrototype(LA_01_NPCS, [[Assets.R_01_BL],[Assets.R_01_BL],[Assets.R_01_BL]]);
			
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 02                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_02_BL:Array = new Array( Assets.R_02_BL
													);
		public static var LA_02_FL:Array = new Array(// Assets.R_02_FL
													);
		public static var LA_02_SF:Array = new Array( new FlxPoint(1, 1)
													);
		
		private static var LA_02_NPCS:Array = new Array(
				new TriggerPrototype(Assets.FOUNTAIN, 2590, 400, 250, 200, 200,true, false, true,1000),
				new ProceduralObjectProtoype(Assets.DRUNK_LEAF,0,0,0,0.01,0,0,1.0,1.0,64.0)
			);	
		
		public static var LA_02 : LevelAreaPrototype = new LevelAreaPrototype(LA_02_NPCS, [[Assets.R_02_BL],[Assets.R_02_BL],[Assets.R_02_BL]]);
		
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 03                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_03_BL:Array = new Array( Assets.R_03_BL
													);
		public static var LA_03_FL:Array = new Array(// Assets.R_03_FL
													);
		public static var LA_03_SF:Array = new Array( new FlxPoint(1, 1)
													);
		
		private static var LA_03_NPCS:Array = new Array(
				new TriggerPrototype(Assets.FOUNTAIN, 2590, 400, 250, 200, 200,true, false, true,1000)
			);	
		
		public static var LA_03 : LevelAreaPrototype = new LevelAreaPrototype(LA_03_NPCS, [[Assets.R_03_BL],[Assets.R_03_BL],[Assets.R_03_BL]]);
			
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 04                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_04_BL:Array = new Array( Assets.R_04_BL
													);
		public static var LA_04_FL:Array = new Array( Assets.R_04_FL
													);
		public static var LA_04_SF:Array = new Array( new FlxPoint(1, 1)
													);
		
		private static var LA_04_NPCS:Array = new Array(
				new TriggerPrototype(Assets.FOUNTAIN, 2590, 400, 250, 200, 200,true, false, true,1000)
			);	
		
		public static var LA_04 : LevelAreaPrototype = new LevelAreaPrototype(LA_04_NPCS, [[Assets.R_04_BL],[Assets.R_04_BL],[Assets.R_04_BL]]);
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 05                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_05_BL:Array = new Array( Assets.R_05_BL
													);
		public static var LA_05_FL:Array = new Array( Assets.R_05_FL
													);
		public static var LA_05_SF:Array = new Array( new FlxPoint(1, 1)
													);
		
		private static var LA_05_NPCS:Array = new Array(
				new TriggerPrototype(Assets.FOUNTAIN, 2590, 400, 250, 200, 200,true, false, true,1000)
			);	
		
		public static var LA_05 : LevelAreaPrototype = new LevelAreaPrototype(LA_05_NPCS, [[Assets.R_05_BL],[Assets.R_05_BL],[Assets.R_05_BL]]);
			
		
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
		new ProceduralObjectProtoype(Assets.FIREFLY,0,0,0,0.01,0,LevelArea.DEFAULT_HEIGHT-200,1.0,1.0,200.0)
				
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
