package puzzle;

class Puzzle6 extends Puzzle
{

    var data:Array<Int>;

    override function execute()
    {
        simulate(80);
        output('lanternfish population is ${data.length}');
    }

    function simulate(daysCount:Int)
    {
        for (day in 0...daysCount)
        {
            var additional:Array<Int> = [];
            for (i in 0...data.length)
            {
                if (data[i] == 0)
                {
                    data[i] = 6;
                    additional.push(8);
                    continue;
                }
                data[i]--;
            }
            for (it in additional) data.push(it);
        }
    }

    override function initData()
    {
        data = [];
        for (it in dataRaw.split(',')) data.push(Std.parseInt(it));
    }

    override function initTestData()
    {
        data = [3,4,3,1,2];
    }

}