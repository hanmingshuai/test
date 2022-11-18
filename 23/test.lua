-- 23.2
-- 没有进行过垃圾收集，会在lua虚拟机关闭后调用它的析构器，依然会输出那条信息。调用os.exit以及程序因为出错而退出时，不会调用析构器。
-- 23.3
-- 使用弱引用值的表，并将函数返回的字符串放进表中，再将表存入弱引用表的相对应的键值对中。
-- 23.4
-- 第一次print，a是由10000个表组成的数组，并且count的值是10000。然后将a赋值nil后，调用垃圾收集，这时会将数组内的表标记为活跃状态并放入一个单独的列表中，然后由设置元表的顺序逆序执行析构器，这时count就从10000一直减为0了。再次调用垃圾收集，就清除了之前的所有表。

