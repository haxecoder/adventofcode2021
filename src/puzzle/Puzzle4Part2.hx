package puzzle;

using ArrayUtils;

class Puzzle4Part2 extends Puzzle4
{

    override function checkWinner()
    {
        if (winBoards.length != 0)
        {
            bingo(winBoards.tail(), winNumbers.tail());
            return;
        }
        output('all boards failed');
    }

}