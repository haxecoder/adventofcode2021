package puzzle;

using ArrayUtils;

class Puzzle1 extends Puzzle
{

    var data:Array<Int>;

    override function execute()
    {
        var lastMeasurment:Int = data[0];
        var depthIncreaseCount:Int = 0;

        for (i in 1...data.length)
        {
            if (data[i] > lastMeasurment) depthIncreaseCount++;
            lastMeasurment = data[i];
        }

        output('depth measurment increases ${depthIncreaseCount}');
    }

    override function initData()
    {
        data = [for (it in dataRaw.split('\n')) Std.parseInt(it)];
    }

    override function initTestData()
    {
        data = [
            199,200,208,210,200,207,240,269,260,263
        ];
    }

}
