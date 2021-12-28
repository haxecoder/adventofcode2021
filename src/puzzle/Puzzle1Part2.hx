package puzzle;

class Puzzle1Part2 extends Puzzle1
{

    override function execute()
    {
        var countWindowIncrease:Int = 0;
        var lastWindowSum:Int = 0;
        var windowSize = 3;
        var windowSum = 0;

        for (i in 0...windowSize) windowSum += data[i];

        for (i in windowSize...data.length)
        {
            windowSum += data[i] - data[i - windowSize];
            if (windowSum > lastWindowSum) countWindowIncrease++;
            lastWindowSum = windowSum;
        }

        output('window increased ${countWindowIncrease} times');
    }

}