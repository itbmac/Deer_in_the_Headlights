package tutorial
{
	import org.flixel.*;
	/**
	 * ...
	 * @author MacKenzie Bates
	 */
	public class ViewMask extends FlxSprite
	{
		//public var isOn:bool;
		private var picWidth:int = 2400;
		private var picHeight:int = 1800;
		public var isHUD:Boolean = false;
		public var isHUD_num :int = 0;
		public var HUDy : int = 0;
		
		public function ViewMask(X:Number=100, Y:Number=100, sonar:Boolean=false, hud:Boolean=false, hudImg : int = 0):void
		{
			antialiasing = true;
			super(X, Y);
			if (hudImg == 0)
			{
				this.loadGraphic(Assets.PANIC_OVERLAY, false, false, picWidth, picHeight);
				this.scrollFactor.x = 0;
				this.scrollFactor.y = 0;
				isHUD = true;
				isHUD_num = 0;
			}
			
			HUDy = Y;
		}
		
		public function set(y:int):void {
			HUDy = y;
		}
		
		override public function update():void
		{
			if (isHUD)
			{
				x = 0;
				y = HUDy;
			}
			else
			{
				x -= picWidth/2;
				y -= picHeight/2;
			}
			super.update();
			
		}
	}
		
}