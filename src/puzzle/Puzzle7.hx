package puzzle;

using ArrayUtils;

class Puzzle7 extends Puzzle
{

    var data:Array<Float>;

    override function execute()
    {
        var numbers = prepare();
        var costs = numbers.copy();
        for (it in data) numbers[Math.floor(it)]++;
        for (i in 0...numbers.length) for (j in 0...numbers.length) costs[i] += Math.abs(j - i) * numbers[j];

        costs.sort((a:Float, b:Float) -> Math.floor(a - b));
        output('lowest fuel consumption is ${costs[0]}');
    }

    function prepare():Array<Float>
    {
        data.sort((a:Float, b:Float) -> Math.floor(a - b));
        var maxInt = Math.floor(data.tail() + 1);
        var arr:Array<Float> = [for (i in 0...maxInt) 0];
        return arr;
    }

    override function initData()
    {
        data = [for (it in dataRaw.split(',')) Std.parseFloat(it)];
    }

    override function initTestData()
    {
        data = [
            16,1,2,0,4,2,7,1,2,14
        ];
    }

}