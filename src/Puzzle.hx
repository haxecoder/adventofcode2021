package;

import enums.PuzzleMode;
import haxe.io.Error;
using sys.FileSystem;
using sys.io.File;

class Puzzle
{

    var mode:PuzzleMode;
    var puzzleId:String;
    var dataRaw:String;

    public function new()
    {
        this.puzzleId = Type.getClassName(Type.getClass(this)).split('.')[1];
        var dataFile = 'puzzles/${puzzleId.split('Part')[0].split('Puzzle')[1]}.txt';
        if (!dataFile.exists()) throw Error.Custom('upload data for the puzzle ${puzzleId}');
        dataRaw = dataFile.getContent();
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
        throw Error.Custom('override');
    }

    function initTestData()
    {
        throw Error.Custom('override');
    }

    function execute()
    {
        throw Error.Custom('override');
    }

}