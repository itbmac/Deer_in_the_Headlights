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
		
		public function make(pos : FlxPoint, level : TopDownLevel) : LevelArea
		{
			trace("Got " + proceduralObjectPrototypes.length + " prototypes");
			var npcArray : Array= new Array();
			
			for each (var proceduralObjectPrototype : ProceduralObjectProtoype in proceduralObjectPrototypes)
			{
				var last : int = -1;
				// TODO: maybe allow overlap across regions? by deleting "- proceduralObjectPrototype.width"
				for (var x:int = pos.x; x < pos.x + PlayState.LEVEL_SIZE.x - proceduralObjectPrototype.width; x++)
				{
					var newGameObject : GameObject = proceduralObjectPrototype.request(x, last);
					if (newGameObject != null)
					{
						last = x;
						npcArray.push(newGameObject);
					}
				}
			}
			trace("Generated " + npcArray.length + " npcs");
			
			return new LevelArea(pos, npcArray, Assets.LA_BLS[0], Assets.LA_SFS[0], level.player, level.imgGroup, level.npcGroup, 0);
		}
		
	}

}