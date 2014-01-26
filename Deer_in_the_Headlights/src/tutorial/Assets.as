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
		[Embed(source = "../../assets/deer/deer3_quad_small.png")]                         public static var SPRITE_DEER:Class;
		[Embed(source = "../../assets/forest/tree2.png")]                         public static var TREE:Class;
		[Embed(source = "../../assets/forest/tree1_resize.png")]                         public static var TREE1:Class;
		[Embed(source = "../../assets/forest/tree2_resize.png")]                         public static var TREE2:Class;
		[Embed(source = "../../assets/forest/tree3_resize.png")]                         public static var TREE3:Class;
		[Embed(source = "../../assets/forest/forest_mid_light.png")]                         public static var FOREST_MID_LIGHT:Class;
		[Embed(source = "../../assets/forest/tree_bg_light.png")]                         public static var TREE_BG_LIGHT:Class;
		[Embed(source = "../../assets/forest/forest_backdrop_light.png")]                         public static var FOREST_BG_LIGHT:Class;
		[Embed(source = "../../assets/forest/ground_mid_light.png")]                         public static var FOREST_GROUND_MID_LIGHT:Class;
		
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                  DEMO IMGS                   --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		[Embed(source = "../../assets/demo/area_01.png")]                  public static var FIR:Class;
		[Embed(source = "../../assets/demo/area_02.png")]                  public static var SND:Class;
		[Embed(source = "../../assets/demo/area_03.png")]                  public static var TRD:Class;
		[Embed(source = "../../assets/demo/area_04.png")]                  public static var FTH:Class;
		
		
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
		
		public static var STR_EMPTY:String = "";
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 01                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_01_BL:Array = new Array( //Assets.FIR
													);
		public static var LA_01_SF:Array = new Array( new FlxPoint(1, 1)
													);
		private static var LA_01_NPCS:Array = new Array(
				new BackgroundPrototype(Assets.FOREST_BG_LIGHT),
				new BackgroundPrototype(Assets.FOREST_GROUND_MID_LIGHT, 0, 0, 0, 1, 700, 0, 0.9),
				new ProceduralObjectProtoype(Assets.TREE_BG_LIGHT, 0, 0, Assets.REGION_PLAINS, 0.001, 0, 0, 0.5, 1),
				new ProceduralObjectProtoype(Assets.FOREST_MID_LIGHT, 0, 0, Assets.REGION_PLAINS, 0.001, 0, 0, 0.8, 0.75),
				new ProceduralObjectProtoype(Assets.TREE1, 0, 0, Assets.REGION_PLAINS, 0.00015, 200),
				new ProceduralObjectProtoype(Assets.TREE2, 0, 0, Assets.REGION_PLAINS, 0.00015, 200),
				new ProceduralObjectProtoype(Assets.TREE3, 0, 0, Assets.REGION_PLAINS, 0.00015, 200)
				
				
			);	
		
		public static var LA_01 : LevelAreaPrototype = new LevelAreaPrototype(LA_01_NPCS);
			
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 02                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_02_BL:Array = new Array( Assets.FIR
													);
		public static var LA_02_SF:Array = new Array( new FlxPoint(1, 1)
													);
		
		private static var LA_02_NPCS:Array = new Array(
				new ProceduralObjectProtoype(Assets.TREE, 0, 0, Assets.REGION_PLAINS, 0.00075, 200)
			);	
		
		public static var LA_02 : LevelAreaPrototype = new LevelAreaPrototype(LA_02_NPCS);
		
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 03                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_03_BL:Array = new Array( Assets.FIR
													);
		public static var LA_03_SF:Array = new Array( new FlxPoint(1, 1)
													);
		
		private static var LA_03_NPCS:Array = new Array(
				new ProceduralObjectProtoype(Assets.TREE, 0, 0, Assets.REGION_PLAINS, 0.00075, 200)
			);	
		
		public static var LA_03 : LevelAreaPrototype = new LevelAreaPrototype(LA_03_NPCS);
			
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 04                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_04_BL:Array = new Array( Assets.FIR
													);
		public static var LA_04_SF:Array = new Array( new FlxPoint(1, 1)
													);
		
		private static var LA_04_NPCS:Array = new Array(
				new ProceduralObjectProtoype(Assets.TREE, 0, 0, Assets.REGION_PLAINS, 0.00075, 200)
			);	
		
		public static var LA_04 : LevelAreaPrototype = new LevelAreaPrototype(LA_04_NPCS);
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------                LEVEL AREA 05                 --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_05_BL:Array = new Array( Assets.FIR
													);
		public static var LA_05_SF:Array = new Array( new FlxPoint(1, 1)
													);
		
		private static var LA_05_NPCS:Array = new Array(
				new ProceduralObjectProtoype(Assets.TREE, 0, 0, Assets.REGION_PLAINS, 0.00075, 200)
			);	
		
		public static var LA_05 : LevelAreaPrototype = new LevelAreaPrototype(LA_05_NPCS);
			
		
		// ----------------------------------------------------------------------------------------------------------------------------------------
		// ----------------------------------------------             VER 1.1: LEVEL AREAS             --------------------------------------------
		// ----------------------------------------------------------------------------------------------------------------------------------------
		
		public static var LA_NUM_TOTAL:int = 4;
		public static var LA_NUM_WIDE:int = 4;
		public static var LA_NUM_TALL:int = 1;
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
		public static var LAs:Array = new Array( Assets.LA_01, 
													 Assets.LA_02,
													 Assets.LA_03,
													 Assets.LA_04,
													Assets.LA_05
												   );
		
	}
}
