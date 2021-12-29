package puzzle;

class Puzzle6 extends Puzzle
{

    var data:Array<Int>;
    var totalFishesCount:Int;

    override function execute()
    {
        totalFishesCount = 0;
        simulate(data, 80);
        output('lanternfish population is ${totalFishesCount}');
    }

    function simulate(fishes:Array<Int>, daysCount:Int)
    {
        for (it in fishes) simulateOneFish(it, daysCount, true);
    }

    function simulateOneFish(fish:Int, daysCount:Int, isNew:Bool)
    {
        if (isNew) totalFishesCount++;

        daysCount -= fish + 1;

        if (daysCount < 0) return;

        var cycles = 1;

        cycles += Math.floor(daysCount / 7);

        for (i in 0...cycles)
        {
            var days = daysCount - i * 7;
            simulateOneFish(8, days, true);
        }
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