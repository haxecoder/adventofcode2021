package puzzle;

using ArrayUtils;

class Puzzle7Part2 extends Puzzle7
{
    override function execute()
    {
        data.sort((a:Float, b:Float) -> Math.floor(a - b));
        var maxInt = Math.floor(data.tail() + 1);
        var numbers:Array<Float> = [for (i in 0...maxInt) 0];
        var costs = numbers.copy();
        for (it in data) numbers[Math.floor(it)]++;
        for (i in 0...numbers.length)
        {
            for (j in 0...numbers.length)
            {
                var steps = Math.abs(j - i);
                costs[i] += (steps * (steps + 1) / 2) * numbers[j];
            }
        }

        costs.sort((a:Float, b:Float) -> Math.floor(a - b));
        output('lowest fuel consumption is ${costs[0]}');
    }
}
