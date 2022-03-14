package android;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxSpriteGroup;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.ui.FlxButton;
import flixel.FlxSprite;

class Hitbox extends FlxSpriteGroup
{
	var hitboxframes:FlxAtlasFrames;
	var hitbox_hint:FlxSprite;
	
	var sizex:Float = 142;

	public var k1:FlxButton;
	public var k2:FlxButton;
	public var k3:FlxButton;
	public var k4:FlxButton;
	public var k5:FlxButton;
	public var k6:FlxButton;
	public var k7:FlxButton;
	public var k8:FlxButton;
	public var k9:FlxButton;
	
	public function new()
	{
		super();
		
        k1 = new FlxButton(0, 0);
        k2 = new FlxButton(0, 0);
        k3 = new FlxButton(0, 0);
        k4 = new FlxButton(0, 0);
        k5 = new FlxButton(0, 0);
        k6 = new FlxButton(0, 0);
        k7 = new FlxButton(0, 0);
        k8 = new FlxButton(0, 0);
        k9 = new FlxButton(0, 0);

		hitbox = new FlxSpriteGroup();
		hitboxframes = Paths.getSparrowAtlas('androidcontrols/hitbox');
        hitbox.add(add(k1 = createhitbox(0, "k1", 0)));
        hitbox.add(add(k2 = createhitbox(sizex, "k2", 1)));
        hitbox.add(add(k3 = createhitbox(sizex * 2, "k3", 2)));
        hitbox.add(add(k4 = createhitbox(sizex * 3, "k4", 3)));    
        hitbox.add(add(k5 = createhitbox(sizex * 4, "k5", 4)));
        hitbox.add(add(k6 = createhitbox(sizex * 5, "k6", 5))); 
        hitbox.add(add(k7 = createhitbox(sizex * 6, "k7", 6)));
        hitbox.add(add(k8 = createhitbox(sizex * 7, "k8", 7))); 
        hitbox.add(add(k9 = createhitbox(sizex * 8, "k9", 8)));

		var hitbox_hint:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('androidcontrols/hitbox_hint'));
		hitbox_hint.alpha = 0.75;
		add(hitbox_hint);
	}

	public function createhitbox(buttonPozitionX:Float, framestring:String) {
        var graphic:FlxGraphic = FlxGraphic.fromFrame(hitboxframes.getByName(framestring));

		var button = new FlxButton(buttonPozitionX, 0);
        button.loadGraphic(graphic);
        button.alpha = 0;
    
        button.onDown.callback = function (){
            FlxTween.num(0, 0.75, 0.075, {ease:FlxEase.circInOut}, function(alpha:Float){ 
            	button.alpha = alpha;
            });
        };

        button.onUp.callback = function (){
            FlxTween.num(0.75, 0, 0.1, {ease:FlxEase.circInOut}, function(alpha:Float){ 
            	button.alpha = alpha;
            });
        }
        
        button.onOut.callback = function (){
            FlxTween.num(button.alpha, 0, 0.2, {ease:FlxEase.circInOut}, function(alpha:Float){ 
            	button.alpha = alpha;
            });
        }

        return button;
	}

	override public function destroy():Void
	{
		super.destroy();

        k1 = null;
        k2 = null;
        k3 = null;
        k4 = null;
        k5 = null;
        k6 = null;
        k7 = null;
        k8 = null;
        k9 = null;
	}
}
