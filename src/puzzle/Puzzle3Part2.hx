package puzzle;

using StringUtils;

enum BitCriteria
{
    OXYGEN;
    CO2;
}

class Puzzle3Part2 extends Puzzle3
{

    override function execute()
    {
        var oxygen:Array<String> = data.copy();
        var co2:Array<String> = data.copy();

        for (i in 0...data[0].length)
        {
            if (oxygen.length != 1) oxygen = filterData(oxygen.copy(), i, OXYGEN);
            if (co2.length != 1) co2 = filterData(co2.copy(), i, CO2);
        }

        output('life support rating is ${oxygen[0].binaryToDecimal() * co2[0].binaryToDecimal()}');
    }

    function filterData(arr:Array<String>, bit:Int, criteria:BitCriteria):Array<String>
    {
        var zeros:Array<String> = [];
        var ones:Array<String> = [];

        for (it in arr)
        {
            switch (it.charAt(bit))
            {
                case '0': zeros.push(it);
                case '1': ones.push(it);
            }
        }

        return switch (criteria)
        {
            case OXYGEN: ones.length >= zeros.length ? ones : zeros;
            case CO2: ones.length >= zeros.length ? zeros : ones;
        };
    }

}