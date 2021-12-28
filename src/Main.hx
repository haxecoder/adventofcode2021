import puzzle.*;

class Main
{

    static public function main()
    {
        var puzzles:Array<Puzzle> = [
//            new Puzzle1(),
//            new Puzzle1Part2(),
//            new Puzzle2(),
//            new Puzzle2Part2(),
//            new Puzzle3(),
//            new Puzzle3Part2(),
//            new Puzzle4(),
//            new Puzzle4Part2(),
            new Puzzle5(),
            new Puzzle5Part2()
        ];

        for (it in puzzles) it.test();
        for (it in puzzles) it.run();
    }

}