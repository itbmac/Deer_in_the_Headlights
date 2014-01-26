package 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.display.Shape;
	import flash.display.Graphics;
	import tutorial.*;
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	[SWF(width="1280", height="900", backgroundColor="#000000")] //Set the size and color of the Flash file
	//Large DEBUG
	//[SWF(width="1600", height="800", backgroundColor="#000000")] //Set the size and color of the Flash file
	
	/**
	 * ...
	 * @author MacKenzie Bates
	 */
	public class Main extends FlxGame
	{
		
		public function Main():void 
		{
			//DEBUG
			//Turn on with ~ and then you can use the BOX in the top right to see bounding boxes
			FlxG.debug = true;
			
			super(1280, 900, PlayState, 1);
    
			//Large DEBUG
			//super(1600,800,MenuState,1);
		}
	}
	
}