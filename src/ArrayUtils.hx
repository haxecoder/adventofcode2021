package;

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

}
