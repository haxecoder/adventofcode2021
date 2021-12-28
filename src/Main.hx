import puzzle.*;

class Main
{

    static public function main()
    {
        var puzzles:Array<Puzzle> = [
            new Puzzle1(),
            new Puzzle1Part2()
        ];

        for (it in puzzles)
        {
            it.test();
            it.run();
        }

    }

}