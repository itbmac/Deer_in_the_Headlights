package tutorial 
{
	/**
	 * ...
	 * @author ...
	 */
	public class ProceduralObjectProtoype 
	{
		private var probability : Number;
		private var gameObjectPrototype : GameObjectPrototype;
		
		public function ProceduralObjectProtoype() 
		{
			
		}
		
		public function make() : GameObject
		{
			return new gameObjectPrototype();
		}
	}
}