package puzzle;

import haxe.Int64Helper;
import haxe.Int64;

using ArrayUtils;

class Puzzle6 extends Puzzle
{

    var data:Array<Int>;

    override function execute()
    {
        simulate(data, 18);
        simulate(data, 80);
    }

    function simulate(fishes:Array<Int>, daysCount:Int)
    {
        var fauna:Array<Int64> = [for (i in 0...9) Int64Helper.fromFloat(0)];
        for (it in fishes) fauna[it]++;
        for (i in 0...daysCount) {
            var produced = fauna.shift();
            fauna.push(produced);
            fauna[6] += produced;
        }
        output('lanternfish population on ${daysCount} days is ${fauna.getInts64Sum()}');
    }

    override function initTestData()
    {
        data = [3,4,3,1,2];
    }

    override function initData()
    {
        data = [];
        for (it in dataRaw.split(',')) data.push(Std.parseInt(it));
    }



}