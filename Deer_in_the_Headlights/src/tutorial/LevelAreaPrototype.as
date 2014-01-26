package tutorial 
{
	import org.flixel.FlxBasic;
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
		private var backgroundInstances : Array;
		
		public function LevelAreaPrototype(newProceduralObjectPrototypes : Array, backgroundInstances : Array,
			width : int = LevelArea.DEFAULT_WIDTH, height : int = LevelArea.DEFAULT_HEIGHT) 
		{
			this.proceduralObjectPrototypes = newProceduralObjectPrototypes;
			this.backgroundInstances = backgroundInstances;
		}
		
		public function make(pos : FlxPoint, level : TopDownLevel, index:int, subindex:int) : LevelArea
		{
			trace("Got " + proceduralObjectPrototypes.length + " prototypes");
			var npcArray : Array= new Array();
			
			for each (var obj : Object in proceduralObjectPrototypes)
			{
				if (obj is ProceduralObjectProtoype)
				{
					var proceduralObjectPrototype : ProceduralObjectProtoype = obj as ProceduralObjectProtoype;
					trace("--");
					var last : int = -1;
					
					for (var x:int = pos.x; x < pos.x + LevelArea.DEFAULT_WIDTH; x++)
					{
						var newGameObject : GameObject = proceduralObjectPrototype.request(x, last);
						if (newGameObject != null)
						{
							trace("Created at " + x);
							last = x;
							npcArray.push(newGameObject);
						}
					}
				} else if (obj is FixedObjectPrototype)
				{
					var fixedObjectPrototype : FixedObjectPrototype = obj as FixedObjectPrototype;
					var newGameObject : GameObject = fixedObjectPrototype.make(pos);
					npcArray.push(newGameObject);
				} else 
				{
					throw Error("Level prototype arrays must contain only FixedObjectPrototype or ProceduralObjectPrototype");
				}
			}
			trace("===== Generated " + npcArray.length + " objects =====");
			
			return new LevelArea(pos, npcArray, backgroundInstances[subindex], Assets.LA_SFS[index-1], level.player, level.backgroundImgGroup, level.npcGroup, 0,level.foregroundImgGroup, Assets.LA_FLS[index-1]);
		}
		
	}

}