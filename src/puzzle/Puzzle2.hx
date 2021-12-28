package puzzle;

class Puzzle2 extends Puzzle
{

    var data:Array<String>;

    override function execute()
    {
        var depth:Int = 0;
        var horizontalPos:Int = 0;

        for (it in data)
        {
            var commandArgs:Array<String> = it.split(' ');
            var command:String = commandArgs[0];
            var arg:Int = Std.parseInt(commandArgs[1]);

            switch (command)
            {
                case 'forward': horizontalPos += arg;
                case 'down': depth += arg;
                case 'up': depth -= arg;
            }
        }

        output('depth is ${depth}, horizontalPos is ${horizontalPos}. result is ${depth * horizontalPos}');
    }

    override function initData()
    {
        data = [for (it in dataRaw.split('\n')) it];
    }

    override function initTestData()
    {
        data = [
            "forward 5","down 5","forward 8","up 3","down 8","forward 2"
        ];
    }

}