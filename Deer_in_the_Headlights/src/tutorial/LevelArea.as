package tutorial 
{
	import flash.geom.Rectangle;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	/**
	 * A chunk of the huge level which consists of its background images & npcs
	 * @author MacKenzie Bates
	 */
	public class LevelArea extends FlxGroup 
	{
		public static const DEFAULT_WIDTH : int = 5000;
		public static const DEFAULT_HEIGHT : int = 1000;
		
		private var areasNPCs: Array;
		private var areasBackgrounds: Array;
		public var areaPosition:FlxPoint;
		public var areaIndex:int;
		public var npcGroup : FlxGroup;
		private var imgGroup : FlxGroup;
		
		public function LevelArea(LEVEL_POSITION:FlxPoint, NPC_ARRAY:Array, BACKGROUND_IMG_ARRAY:Array, 
			BACKGROUND_SCROLL_FACTOR_ARRAY:Array, player:Player, imgGroup:FlxGroup, npcGroup:FlxGroup, j:int):void
		{
			areaIndex = j;
			areaPosition = LEVEL_POSITION;
			areasNPCs = new Array();
			areasBackgrounds = new Array();
			
			for (var i:int = 0; i < BACKGROUND_IMG_ARRAY.length; i++)
			{	
				var background: FlxSprite = new FlxSprite(LEVEL_POSITION.x , LEVEL_POSITION.y, BACKGROUND_IMG_ARRAY[i]); 
				
				background.scrollFactor.x = BACKGROUND_SCROLL_FACTOR_ARRAY[i].x;
				background.scrollFactor.y = BACKGROUND_SCROLL_FACTOR_ARRAY[i].y;
				//background.mod = true;
				background.exists = true;
				imgGroup.add(background);
				areasBackgrounds.push(background);
			}
			
			this.npcGroup = npcGroup;
			this.imgGroup = imgGroup;
			
			createNPCs(NPC_ARRAY, player, npcGroup);
		}
		
		public function shift(dx : int) : void
		{
			areaPosition.x += dx;
			for each (var backg:FlxSprite in areasBackgrounds)
			{
				backg.x += dx;
			}
			for each (var npc:GameObject in areasNPCs)
			{
				npc.x += dx;
			}
		}

		public function get area() : Rectangle
		{
			// TODO: de-hardcode lengths
			return new Rectangle(areaPosition.x, areaPosition.y, DEFAULT_WIDTH, DEFAULT_HEIGHT);
		}
		
		public function toggleAllContent(doesExist:Boolean):void 
		{
			for each (var backg:FlxSprite in areasBackgrounds)
			{
				backg.exists = doesExist;
			}
			for each (var npc:GameObject in areasNPCs)
			{
				npc.exists = doesExist;
			}
		}
		
		override public function destroy():void
		{
			super.destroy();
			for each (var npc:GameObject in areasNPCs)
			{
				npcGroup.remove(npc);
				npc.destroy();
			}
			
			for each (var backg:FlxSprite in areasBackgrounds)
			{
				imgGroup.remove(backg);
				backg.destroy();
			}
		}
		
		protected function createNPCs(NPC_Array:Array, player:Player, npcGroup:FlxGroup):void
		{
			var num_NPCs : int = NPC_Array.length;
			
			for (var i : int = 0; i < num_NPCs; i++)
			{
				var npc_x : int = int( NPC_Array[i][0]);
				var npc_y : int = int( NPC_Array[i][1]);
				var npc_is : int = int( NPC_Array[i][2]);
				var npc_gc : Class = Class( NPC_Array[i][3]);
				var npc_ds : String = String (NPC_Array[i][4]);
				var npc_re : int = int (NPC_Array[i][5]);
				var npc_ms : int = int( NPC_Array[i][6]);
				var npc_dx : int = int( NPC_Array[i][7]);
				var npc_dy : int = int( NPC_Array[i][8]);
				var npc_vx : int = int( NPC_Array[i][9]);
				var npc_vy : int = int( NPC_Array[i][10]);
				
				var npc_at_index : GameObject = new GameObject(npc_x + areaPosition.x, npc_y + areaPosition.y, player, areaIndex, npc_is, npc_gc, npc_ds, npc_re, npc_ms, npc_dx, npc_dy, npc_vx, npc_vy);
				npc_at_index.exists = true;
				
				areasNPCs.push(npc_at_index);
				npcGroup.add(npc_at_index);
			}
		}
		
		
	}

}