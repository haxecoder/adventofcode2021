package;

import haxe.Constraints.Function;
import haxe.Int64Helper;
import haxe.Int64;
using ArrayUtils;

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

    public static function getIntsSum(arr:Array<Int>):Int
    {
        var result:Int = 0;
        for (it in arr) result += it;
        return result;
    }

    public static function getMaxInt(arr:Array<Int>):Int
    {
        return arr.reduce((a:Int, c:Int) -> Std.int(Math.max(a, c)), 0);
    }

    public static function reduce<A, B>(arr:Array<A>, f:A->B->B, initial:B):B
    {
        return Lambda.fold(arr, f, initial);
    }
}
