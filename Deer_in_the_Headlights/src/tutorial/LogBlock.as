package tutorial 
{
	import mx.core.FlexSprite;
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import topdown.TopDownLevel;
	/**
	 * ...
	 * @author MacKenzie Bates
	 */
	public class LogBlock extends FlxBasic
	{
		private var THUMBNAIL_X_OFFSET:int = 20;
		private var THUMBNAIL_Y_OFFSET:int = 20;
		private var  TEXT_X_OFFSET:int = 130;
		private var  TEXT_Y_OFFSET:int = 20;
		
		private var x:int;
		private var y:int;
		private var displayText:String;
		private var displayGraphic:Class;
		private var region:int;
		
		public var textDisplay:FlxText;
		public var background: FlxSprite;
		public var thumbnail_background : FlxSprite;
		public var thumbnail_img : FlxSprite;
		
		public function LogBlock(DisplayText:String, DisplayGraphic:Class, Region:int) 
		{
			displayText = DisplayText;
			displayGraphic = DisplayGraphic;
			region = Region;
			
			var text_colo : uint = 0xFFDDDDDD;
			var text_size : int  = 32;
			var text_font : String = "ArcadeClassic";
				
			textDisplay =  new FlxText(0, 0, 670, displayText);
			textDisplay = textDisplay.setFormat(text_font, text_size, text_colo, "left");
			
			background = new FlxSprite(0, 0, Assets.LOG_BLOCK_BACKGROUND);
			
			switch (region) 
			{
				case Assets.REGION_JUNGLE:
					thumbnail_background = new FlxSprite(0,0, Assets.LOG_THUMBNAIL_BACKGROUND_JUNGLE);
					break;
				case Assets.REGION_MNTN:
					thumbnail_background = new FlxSprite(0,0, Assets.LOG_THUMBNAIL_BACKGROUND_MNTN);
					break;
				case Assets.REGION_OCEAN:
					thumbnail_background = new FlxSprite(0,0, Assets.LOG_THUMBNAIL_BACKGROUND_OCEAN);
					break;
				case Assets.REGION_PLAINS:
					thumbnail_background = new FlxSprite(0,0, Assets.LOG_THUMBNAIL_BACKGROUND_PLAINS);
					break;
				case Assets.REGION_SKY:
					thumbnail_background = new FlxSprite(0,0, Assets.LOG_THUMBNAIL_BACKGROUND_SKY);
					break;
				case Assets.REGION_SPACE:
					thumbnail_background = new FlxSprite(0,0, Assets.LOG_THUMBNAIL_BACKGROUND_SPACE);
					break;
				case Assets.REGION_UNDGRD:
					thumbnail_background = new FlxSprite(0,0, Assets.LOG_THUMBNAIL_BACKGROUND_UNDGRD);
					break;
				default:
			}
			
			thumbnail_img = new FlxSprite(0,0, displayGraphic);
			
			textDisplay.scrollFactor.x = textDisplay.scrollFactor.y = 0;
			background.scrollFactor.x = background.scrollFactor.y = 0;
			thumbnail_background.scrollFactor.x = thumbnail_background.scrollFactor.y = 0;
			thumbnail_img.scrollFactor.x = thumbnail_img.scrollFactor.y = 0;
			
			textDisplay.visible = background.visible = thumbnail_background.visible = thumbnail_img.visible = false;
		}
		
		public function drawBlock(X:int, Y:int, makeVisible:Boolean):void
		{
			x = X;
			y = Y;
			
			background.x = x;
			background.y = y;
			
			thumbnail_background.x = x + THUMBNAIL_X_OFFSET;
			thumbnail_background.y = y + THUMBNAIL_Y_OFFSET;
			
			thumbnail_img.x = x + THUMBNAIL_X_OFFSET;
			thumbnail_img.y = y + THUMBNAIL_Y_OFFSET;
			
			textDisplay.x = x + TEXT_X_OFFSET;
			textDisplay.y = y + TEXT_Y_OFFSET;
			
			textDisplay.visible = background.visible = thumbnail_background.visible = thumbnail_img.visible = makeVisible;
			
			FlxG.log("LOG BLOCK DRAW ;;; mess: " + displayText + " ;;; height: " + textDisplay.height.toString());
			
			//FlxG.log("LOG BLOCK! MESSAGE: " + textDisplay.text + " ;;; region: " + region.toString() + " ;;; x: " + textDisplay.x.toString() + " ;;; y: " + textDisplay.y.toString() + "\n sad \n");
		}
		
		public function hideBlock():void
		{
			textDisplay.visible = background.visible = thumbnail_background.visible = thumbnail_img.visible = false;
		}
		
	}

}