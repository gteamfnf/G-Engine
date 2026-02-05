package game.play.objects;

class BGSprite extends FunkinSprite
{
    public var image:String;
    public var sx:Float;
    public var sy:Float;

    public function new(image:String, x:Float = 0, y:Float = 0, sx:Float = 1, sy:Float = 1)
    {
        this.image = image;
        this.sx = sx;
        this.sy = sy;

        super(x, y);
    }

    public function create()
    {
        if (BaseStage.weekPath != null)
        {
            image = '${BaseStage.weekPath}/$image';
        }
        loadGraphic(Paths.cacheImage(image));
        scrollFactor.set(sx, sy);
    }
}