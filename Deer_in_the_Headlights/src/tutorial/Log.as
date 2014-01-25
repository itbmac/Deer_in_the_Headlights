package tutorial 
{
	import org.flixel.FlxG;
	import topdown.TopDownLevel;
	/**
	 * ...
	 * @author MacKenzie Bates
	 */
	public class Log
	{
		private var logBlockArray: Array;
		private var curIndex:int = 0;
		private var indexOffset:int = 1;
		public var displayGroupSize:int = 4;
		private var logXOffset:int = 92;
		private var logYOffset:int = 16;
		public var logBlockHeight:int = 145;
		private var switch_timer:int = 0;
		
		
		public function Log()
		{
			logBlockArray = new Array();
		}
		
		public function LogDisplaySize():int
		{
			return displayGroupSize - Math.min(logBlockArray.length, displayGroupSize);
		}
		
		public function LogPush(newLogBlock:LogBlock):void 
		{
			logBlockArray.push(newLogBlock);
			if (curIndex < (logBlockArray.length - displayGroupSize))
				{
					curIndex++;
				}
		}
		
		public function LogHide():void 
		{
			for (var i:int = 0; i < logBlockArray.length; i++)
			{
				logBlockArray[i].hideBlock();
			}
		}
		
		/*
		 * Update each timestep
		 */
		public function update(makeVisible:Boolean = true):void {
			var i:int;
			var maxI:int;
			
			if (switch_timer < 60)
				switch_timer += 1;
				
			FlxG.keys.update();
			
			//FlxG.log("LOG UPDATE ;;; cur ind: " + curIndex.toString());
			
			if (FlxG.keys.pressed("DOWN") && switch_timer > 30)
			{
				if (curIndex > 0)
				{
					curIndex--;
				}
					
				switch_timer = 0;
			}
			
			else if (FlxG.keys.pressed("UP") && switch_timer > 30)
			{
				if (curIndex < (logBlockArray.length - displayGroupSize))
				{
					curIndex++;
				}
				
				switch_timer = 0;
			}
			
			if (logBlockArray.length <= displayGroupSize)
			{
				curIndex = 0;
				maxI = logBlockArray.length;
			}
			else
			{
				maxI = Math.min(displayGroupSize + curIndex, logBlockArray.length);
			}
			
			var displayX:int = 0;
			
			LogHide();
			for (i = maxI - 1; i >= curIndex; i--)
			{
				var curLogBlock:LogBlock = logBlockArray[i];
				curLogBlock.visible = makeVisible;
				curLogBlock.drawBlock(logXOffset, logYOffset + logBlockHeight * displayX, makeVisible);
				displayX++;
			}
		}
		
	}

}