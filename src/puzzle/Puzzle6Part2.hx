package puzzle;

class Puzzle6Part2 extends Puzzle6
{

    override function execute()
    {
        totalFishesCount = 0;
        simulate(data, 256);
        output('lanternfish population is ${data.length}');
    }

}
