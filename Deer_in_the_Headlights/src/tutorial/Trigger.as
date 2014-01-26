package tutorial 
{
	import topdown.TopDownEntity;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Trigger extends GameObject 
	{
		public var proximityThreshold:int = 50; // How far to be triggered
		
		public var zoomOnStop : Boolean = true;
		public var visited:Boolean;
		public var shortCircuit : Boolean = false; // simply zoom out after stopping
		public var flipDirectionOnRun : Boolean = true;
		
		public function Trigger(X:int, Y:int, player:TopDownEntity=null, LA:int=0, initialState:int=0, dispGraphic:Class=null, dispText:String="", dispRegion:int=0, moveStyle:int=0, xOffsetThres:int=0, yOffsetThres:int=0, xVel:int=0, yVel:int=0) 
		{
			super(X, Y, player, LA, initialState, dispGraphic, dispText, dispRegion, moveStyle, xOffsetThres, yOffsetThres, xVel, yVel);
			visited;
		}
		
		public function activate() : void {
			visited = true;
		}
		
	}

}