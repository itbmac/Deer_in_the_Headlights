package tutorial 
{
	/**
	 * ...
	 * @author ...
	 */
	public class GameObjectPrototype 
	{
		// initial values
		private var state : int;
		private var graphic : Class;
		private var movementStyle : int;
		
		public function GameObjectPrototype() 
		{
			
		}
		
		public function make(x : int, y : int) : GameObject
		{
			// TODO: change order of GameObject parameters to eliminate duplicating defaults
			return new GameObject(x, y, null, 0, state, graphic, "", 0, movementStyle);
		}
	}
}