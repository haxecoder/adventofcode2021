package puzzle;

using puzzle.Puzzle5;

class Puzzle5 extends Puzzle
{

    public static function isStraight(segment:String):Bool
    {
        var cords = segment.split(' -> ');
        var coords1 = cords[0].split(',');
        var coords2 = cords[1].split(',');

        if (coords1[0] == coords2[0]) return true;
        if (coords1[1] == coords2[1]) return true;
        return false;
    }

    public static function getCoords(segment:String):Array<String>
    {
        var cords = segment.split(' -> ');
        var coords1 = cords[0].split(',');
        var coords2 = cords[1].split(',');

        var x1 = Std.parseInt(coords1[0]);
        var y1 = Std.parseInt(coords1[1]);

        var x2 = Std.parseInt(coords2[0]);
        var y2 = Std.parseInt(coords2[1]);

        var minX:Int = Std.int(Math.min(x1, x2));
        var maxX:Int = Std.int(Math.max(x1, x2));

        var minY:Int = Std.int(Math.min(y1, y2));
        var maxY:Int = Std.int(Math.max(y1, y2));
        var result:Array<String> = [];

        if (minX == maxX)
        {
            while (minY != maxY + 1)
            {
                result.push('${minX}_${minY}');
                minY++;
            }
        } else
        {
            while (minX != maxX + 1)
            {
                result.push('${minX}_${minY}');
                minX++;
            }
        }

        return result;
    }

    var segments:Array<String>;
    var diagram:Map<String, Int>;

    override function execute()
    {
        diagram = new Map<String, Int>();

        for (it in segments)
        {
            if (it.isStraight())
            {
                var value:Int = 0;
                for (c in it.getCoords())
                {
                    if (!diagram.exists(c)) diagram.set(c, 0);
                    value = diagram.get(c);
                    diagram.set(c, value + 1);
                }
            }
        }

        var dangerousPointsCount:Int = 0;

        for (key in diagram.keys()) if (diagram.get(key) >= 2) dangerousPointsCount++;

        output('dangerous points count is ${dangerousPointsCount}');
    }

    override function initData()
    {
        segments = dataRaw.split('\n');
    }

    override function initTestData()
    {
        segments = [
            "0,9 -> 5,9","8,0 -> 0,8","9,4 -> 3,4","2,2 -> 2,1","7,0 -> 7,4","6,4 -> 2,0","0,9 -> 2,9","3,4 -> 1,4","0,0 -> 8,8","5,5 -> 8,2"
        ];
    }

}