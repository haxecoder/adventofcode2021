package;

import haxe.Int64;
import haxe.Int64Helper;
import haxe.Constraints.Function;

class ArrayUtils
{

    public static function tail<T>(a:Array<T>):T
    {
        if (a.length == 0)
        {
            return null;
        }
        return a[a.length - 1];
    }

    public static function each<T>(arr:Array<T>, f:Function)
    {
        Lambda.iter(arr, cast f);
    }

    public static function getInts64Sum(arr:Array<Int64>):Int64
    {
        var result:Int64 = Int64Helper.fromFloat(0);
        for (it in arr) result += it;
        return result;
    }

}
