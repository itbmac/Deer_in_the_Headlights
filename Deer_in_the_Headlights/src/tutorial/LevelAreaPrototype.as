package tutorial 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import topdown.TopDownEntity;
	import topdown.TopDownLevel;
	/**
	 * ...
	 * @author ...
	 */
	public class LevelAreaPrototype 
	{
		private var proceduralObjectPrototypes : Array;
		
		public function LevelAreaPrototype(newProceduralObjectPrototypes : Array,
			width : int = LevelArea.DEFAULT_WIDTH, height : int = LevelArea.DEFAULT_HEIGHT) 
		{
			proceduralObjectPrototypes = newProceduralObjectPrototypes;
		}
		
		public function make(pos : FlxPoint, level : TopDownLevel) : LevelArea
		{
			return new LevelArea(pos, Assets.LA_NPCS[0], Assets.LA_BLS[0], Assets.LA_SFS[0], level.player, level.imgGroup, level.npcGroup, 0);
			//new LevelArea(pos, new Array(), Assets.LA_01_BL, Assets.LA_01_SF, player, new FlxGroup(), new FlxGroup(), 0);
		}
		
	}

}