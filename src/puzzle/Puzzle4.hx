package puzzle;

using puzzle.Puzzle4;
using StringTools;
using ArrayUtils;

class Puzzle4 extends Puzzle
{

    public static function getRows(board:Array<Int>):Array<Array<Int>>
    {
        return [for (i in 0...5) board.getRow(i)];
    }

    public static function getColumns(board:Array<Int>):Array<Array<Int>>
    {
        return [for (i in 0...5) board.getColumn(i)];
    }

    public static function getRow(board:Array<Int>, row:Int):Array<Int>
    {
        return board.slice(row * 5, row * 5 + 5);
    }

    public static function getColumn(board:Array<Int>, col:Int):Array<Int>
    {
        return [ for (i in 0...5) board[col + i * 5]];
    }

    var numbers:Array<Int>;
    var boards:Array<Array<Int>>;

    override function execute()
    {
        var numbersPlayed = numbers.slice(0, 4);

        for (i in 4...numbers.length)
        {
            numbersPlayed.push(numbers[i]);

            var score = 0;
            for (it in boards)
            {
                var arraysToCheck:Array<Array<Array<Int>>> = [it.getRows(), it.getColumns()];
                for (arr in arraysToCheck)
                {
                    for (v in arr)
                    {
                        score = 0;
                        for (n in numbersPlayed) if (v.contains(n)) score++;
                        if (score == 5)
                        {
                            bingo(it, numbersPlayed);
                            return;
                        }
                    }
                }
            }
        }
    }

    function bingo(board:Array<Int>, numbersPlayed:Array<Int>)
    {
        for (it in numbersPlayed) board.remove(it);
        var sumOfUnmarkedNumbers = 0;
        for (it in board) sumOfUnmarkedNumbers += it;
        output('sum of unmarked numbers is ${sumOfUnmarkedNumbers}. final score is ${sumOfUnmarkedNumbers * numbersPlayed.tail()}');
    }

    override function initData()
    {
        numbers = [];
        boards = [[]];

        var dataRawArr = dataRaw.split('\n');

        var numbersRaw = dataRawArr[0].split(',');
        for (it in numbersRaw) numbers.push(Std.parseInt(it));

        for (i in 2...dataRawArr.length)
        {
            if (dataRawArr[i] == '')
            {
                boards.push([]);
                continue;
            }
            var boardRow = dataRawArr[i].ltrim().replace('  ', ' ').split(' ');
            for (it in boardRow) boards.tail().push(Std.parseInt(it));
        }
    }

    override function initTestData()
    {
        numbers = [
            7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1
        ];

        boards = [
            [22,13,17,11,0,8,2,23,4,24,21,9,14,16,7,6,10,3,18,5,1,12,20,15,19],
            [3,15,0,2,22,9,18,13,17,5,19,8,7,25,23,20,11,10,24,4,14,21,16,12,6],
            [14,21,17,24,4,10,16,15,9,19,18,8,23,26,20,22,11,13,6,5,2,0,12,3,7]
        ];
    }

}