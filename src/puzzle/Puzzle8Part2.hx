package puzzle;

using puzzle.Puzzle8Part2;
using puzzle.Puzzle8;

class Puzzle8Part2 extends Puzzle8
{

    public static function getWires(input:String):Array<String>
    {
        var digitsPart = input.split(' | ')[0];
        return digitsPart.split(' ');
    }

    public static function contains(container:String, data:String):Bool
    {
        for (i in 0...data.length) if (container.indexOf(data.charAt(i)) == -1) return false;
        return true;
    }

    public static function intersectionWith(container:String, data:String):Int
    {
        var score = 0;
        for (i in 0...data.length) if (container.indexOf(data.charAt(i)) != -1) score++;
        return score;
    }

    override function execute()
    {
        var sum = 0;
        for (signal in data)
        {
            var wires:Array<String> = signal.getWires();

            var d235:Array<String> = wires.filter((s:String) -> s.length == 5);
            var d069:Array<String> = wires.filter((s:String) -> s.length == 6);

            var digits = ['', '', '', '', '', '', '', '', '', ''];
            digits[1] = wires.filter((s:String) -> s.length == 2)[0];
            digits[4] = wires.filter((s:String) -> s.length == 4)[0];
            digits[7] = wires.filter((s:String) -> s.length == 3)[0];
            digits[8] = wires.filter((s:String) -> s.length == 7)[0];
            digits[3] = d235.filter((s:String) -> s.contains(digits[7]))[0];
            digits[9] = d069.filter((s:String) -> s.contains(digits[3]))[0];
            digits[6] = d069.filter((s:String) -> s.intersectionWith(digits[1]) == 1)[0];
            digits[5] = d235.filter((s:String) -> s != digits[3] && s.intersectionWith(digits[4]) == 3)[0];
            digits[0] = d069.filter((s:String) -> s != digits[6] && s != digits[9])[0];
            digits[2] = d235.filter((s:String) -> s != digits[3] && s != digits[5])[0];

            var outputNumber = '';
            for (it in signal.getDigits())
            {
                var digit = digits.filter((s:String) -> s.length == it.length && s.contains(it))[0];
                outputNumber += '${digits.indexOf(digit)}';
            }
            sum += Std.parseInt(outputNumber);
        }
        output('digits sum is ${sum}');
    }

}