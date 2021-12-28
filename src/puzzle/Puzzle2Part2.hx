package puzzle;

class Puzzle2Part2 extends Puzzle2
{

    override function execute()
    {
        var depth:Int = 0;
        var horizontalPos:Int = 0;
        var aim:Int = 0;

        for (it in data)
        {
            var commandArgs:Array<String> = it.split(' ');
            var command:String = commandArgs[0];
            var arg:Int = Std.parseInt(commandArgs[1]);

            switch (command)
            {
                case 'forward':
                    horizontalPos += arg;
                    depth += (aim * arg);
                case 'down':
                    aim += arg;
                case 'up':
                    aim -= arg;
            }
        }

        output('depth is ${depth}, horizontalPos is ${horizontalPos}. result is ${depth * horizontalPos}');
    }

}
