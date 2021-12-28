import puzzle.*;

class Main
{

    static public function main()
    {
        var puzzles:Array<Puzzle> = [
//            new Puzzle1(),
//            new Puzzle1Part2(),
//            new Puzzle2()
//            new Puzzle2Part2()
            new Puzzle3()
        ];

        for (it in puzzles) it.test();
        for (it in puzzles) it.run();
    }

}