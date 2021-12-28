package;

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

}
