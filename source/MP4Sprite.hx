package;

import flixel.FlxSprite;
import vlc.MP4Handler;

/**
 * This class will play the video in the form of a FlxSprite, which you can control.
 */
class MP4Sprite extends FlxSprite
{
	public var readyCallback:Void->Void;
	public var finishCallback:Void->Void;

	public var bitmap:MP4Handler;

	public function new(x:Float = 0, y:Float = 0, width:Float = 320, height:Float = 240, autoScale:Bool = true)
	{
		super(x, y);

		bitmap = new MP4Handler(width, height, autoScale, false);
		bitmap.alpha = 0;

		bitmap.readyCallback = function()
		{
			loadGraphic(bitmap.bitmapData);

			if (readyCallback != null)
				readyCallback();
		}

		bitmap.finishCallback = function()
		{
			if (finishCallback != null)
				finishCallback();

			kill();
		};
	}

	/**
	 * Native video support for Flixel & OpenFL
	 * @param path Example: `your/video/here.mp4`
	 * @param repeat Repeat the video.
	 * @param pauseMusic Pause music until done video.
	 */
	public function playVideo(path:String, ?repeat:Bool = false, pauseMusic:Bool = false)
	{
		bitmap.playVideo(path, repeat, pauseMusic);
	}

	public function pause()
	{
		bitmap.pause();
	}

	public function resume()
	{
		bitmap.resume();
	}
}
