import puzzle.*;

class Main
{

    static public function main()
    {
        var puzzles:Array<Puzzle> = [
//            new Puzzle1(), new Puzzle1Part2(),
//            new Puzzle2(), new Puzzle2Part2(),
//            new Puzzle3(), new Puzzle3Part2(),
//            new Puzzle4(), new Puzzle4Part2(),
//            new Puzzle5(), new Puzzle5Part2(),
//            new Puzzle6(), new Puzzle6Part2(),
//            new Puzzle7(), new Puzzle7Part2(),
            new Puzzle8()
        ];

        for (it in puzzles) it.test();
        for (it in puzzles) it.run();
    }

}