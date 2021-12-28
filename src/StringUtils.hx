package;

class StringUtils
{

    public static function binaryToDecimal(input:String):Int
    {
        var result = 0;
        for (i in 0...input.length)
        {
            var num:Int = Std.parseInt(input.charAt(i));
            result += Std.int(num * Math.pow(2, input.length - 1 - i));
        }
        return result;
    }

}