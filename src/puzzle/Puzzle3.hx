package puzzle;

using StringUtils;

typedef Bits =
{
    zero:Int,
    one:Int
};

class Puzzle3 extends Puzzle
{

    var data:Array<String>;

    override function execute()
    {
        var bits:Array<Bits> = [];

        for (it in data)
        {
            for (i in 0...it.length)
            {
                if (bits.length == i) bits.push({zero:0, one:0});

                switch (it.charAt(i))
                {
                    case '0': bits[i].zero++;
                    case '1': bits[i].one++;
                }
            }
        }

        var gammaRateBinary:String = '';
        for (it in bits) gammaRateBinary += it.one > it.zero ? '1' : '0';

        var epsilonRateBinary:String = '';
        for (it in bits) epsilonRateBinary += it.one > it.zero ? '0' : '1';

        output('power consumption is ${gammaRateBinary.binaryToDecimal() * epsilonRateBinary.binaryToDecimal()}');
    }

    override function initData()
    {
        data = [for (it in dataRaw.split('\n')) it];
    }

    override function initTestData()
    {
        data = [
            "00100","11110","10110","10111","10101","01111","00111","11100","10000","11001","00010","01010"
        ];
    }

}