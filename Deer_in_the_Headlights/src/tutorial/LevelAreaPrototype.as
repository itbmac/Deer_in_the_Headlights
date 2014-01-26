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
			this.proceduralObjectPrototypes = newProceduralObjectPrototypes;
		}
		
		public function make(pos : FlxPoint, level : TopDownLevel, index:int) : LevelArea
		{
			//trace("Got " + proceduralObjectPrototypes.length + " prototypes");
			var npcArray : Array= new Array();
			
			for each (var proceduralObjectPrototype : ProceduralObjectProtoype in proceduralObjectPrototypes)
			{
				//trace("--");
				var last : int = -1;
				
				for (var x:int = pos.x; x < pos.x + LevelArea.DEFAULT_WIDTH; x++)
				{
					var newGameObject : GameObject = proceduralObjectPrototype.request(x, last);
					if (newGameObject != null)
					{
						//trace("Created at " + x);
						last = x;
						npcArray.push(newGameObject);
					}
				}
			}
			//trace("===== Generated " + npcArray.length + " npcs =====");
			
			return new LevelArea(pos, npcArray, Assets.LA_BLS[index-1], Assets.LA_SFS[index-1], level.player, level.imgGroup, level.npcGroup, 0);
		}
		
	}

}