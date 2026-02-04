package game.play.stages.objects;

class BGSprite extends FunkinSprite
{
    public function new(image:String, x:Float = 0, y:Float = 0, sx:Float = 1, sy:Float = 1)
    {
        super(x, y);
        
        loadGraphic(image);
        scrollFactor.set(sx, sy);
    }
}