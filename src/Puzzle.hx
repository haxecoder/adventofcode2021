package;

import enums.PuzzleMode;

class Puzzle
{

    var mode:PuzzleMode;
    var puzzleId:String;

    public function new()
    {
        this.puzzleId = Type.getClassName(Type.getClass(this)).split('.')[1];
    }

    public function output(s:String)
    {
        trace('${mode == PuzzleMode.TEST ? '<<${puzzleId}>> !TEST DATA! ${s}' : '<<${puzzleId}>>${s}' }');
    }

    public function test()
    {
        mode = PuzzleMode.TEST;
        initTestData();
        execute();
    }

    public function run()
    {
        mode = PuzzleMode.REALDATA;
        initData();
        execute();
    }

    function initData()
    {
        throw 'override';
    }

    function initTestData()
    {
        throw 'override';
    }

    function execute()
    {
        throw 'override';
    }

}