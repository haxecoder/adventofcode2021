package puzzle;

using puzzle.Puzzle5Part2;
using puzzle.Puzzle5;
using ArrayUtils;

class Puzzle5Part2 extends Puzzle5
{

    public static function getDiagonalCoords(segment:String):Array<String>
    {
        var cords = segment.split(' -> ');
        var coords1 = cords[0].split(',');
        var coords2 = cords[1].split(',');

        var x1 = Std.parseInt(coords1[0]);
        var y1 = Std.parseInt(coords1[1]);

        var x2 = Std.parseInt(coords2[0]);
        var y2 = Std.parseInt(coords2[1]);

        var result:Array<String> = ['${x1}_${y1}'];

        var iterateX = (x1 != x2);
        var xDown = x1 > x2;
        var iterateY = (y1 != y2);
        var yDown = y1 > y2;

        while ((x1 != x2) && (y1 != y2))
        {
            if (iterateX) xDown ? x1-- : x1++;
            if (iterateY) yDown ? y1-- : y1++;
            result.push('${x1}_${y1}');
        }

        return result;
    }

    public static function isDiagonal(segment:String):Bool
    {
        var cords = segment.split(' -> ');
        var coords1 = cords[0].split(',');
        var coords2 = cords[1].split(',');

        var x1 = Std.parseInt(coords1[0]);
        var y1 = Std.parseInt(coords1[1]);

        var x2 = Std.parseInt(coords2[0]);
        var y2 = Std.parseInt(coords2[1]);

        if (y2 - y1 == x2 - x1) return true;
        if (y2 - y1 == x1 - x2) return true;

        return false;
    }

    override function execute()
    {
        var diagram = new Map<String, Int>();

        segments
        .filter((it:String) -> it.isStraight())
        .each((it:String) -> setCoordsToDiagram(it.getStraightCoords(), diagram));

        segments
        .filter((it:String) -> it.isDiagonal())
        .each((it:String) -> setCoordsToDiagram(it.getDiagonalCoords(), diagram));

        var dangerousPointsCount:Int = 0;

        for (key in diagram.keys()) if (diagram.get(key) >= 2) dangerousPointsCount++;

        output('dangerous points count is ${dangerousPointsCount}');
    }

}