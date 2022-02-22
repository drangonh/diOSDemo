//
//  Type_Study.m
//  diOSDemo
//
//  Created by mac on 2022/2/14.
//  Copyright © 2022 hl. All rights reserved.
//  OC属于静态类型并且是强类型语言

#import "Type_Study.h"

@implementation Type_Study

- (void)typeTest{
    [self stringTest];
    [self mutableString];
    
    [self arrTest];
    [self arrTestNew];
    [self mutableArr];
    
    [self dictionaryTest];
    [self MutableDictionaryTest];
    
    [self MutableSetTest];
    [self NSSetTest];
    
    
}


// OC中基本数据类型:int、float、double、char(字符型)
// 字符串是对象
// 当需要使用int类型的变量时，推荐使用NSInteger，这样不需要考虑设备是32位或者64位。
- (void)stringTest{
    NSString *string1 = @"Hello world";
    // 创建空字符串
    NSString *string2 = [NSString string];
    NSString *string3 = [NSString stringWithFormat:@"%i,%@",1,@"test"];
    
    NSLog(@"string1 = %@,string2 = %@,string3= %@",string1,string2,string3);
    NSLog(@"%@",string3);
    // 参考链接:https://blog.csdn.net/zilan1239/article/details/29610337
}

- (void)mutableString{
    //创建对象并初始化
    NSMutableString *mStr = [[NSMutableString alloc]init];
    //appendstring：向字符串尾部添加一个字符串。
    //appendFormat：向字符串尾部添加多个类型的字符串，可以添加任意数量与类型的字符串。
    [mStr appendString:@"hello world!"];
    NSLog(@"字符串创建%@", mStr);
    [mStr deleteCharactersInRange:[mStr rangeOfString:@"hello"]];
    //删除
    NSLog(@"字符串删除%@", mStr);
    //插入
    [mStr insertString:@"love you" atIndex: mStr.length];
    NSLog(@"字符串插入%@", mStr);
}

- (void)arrTest{
    //字面量创建方式
    NSArray *arr2 = @[@"aaa",@"bbbbb"];
    //工厂方法创建
    NSArray *array = [[NSArray alloc] initWithObjects:@"1", @"2", nil];
    //取最后一个元素
    [array lastObject];
    
    //    取第一个元素
    // id是动态类型,可以存储所有类型
    id first = [array firstObject];
    //    数组是否包含某个元素
    [array containsObject:@"1"];
    //    数组的大小
    int count = (int) array.count;
    //    第一种方式遍历
    
    NSLog(@"first=%@,arr2=%@,count=%i",first,arr2,count);
    for (int i = 0; i < count; i++) {
        NSString *_str = [array objectAtIndex:i];
        NSLog(@"%@",_str);
    }
}

- (void)arrTestNew{
    // 字面量创建二维数组并访问
    NSArray *arr2 = @[@[@11, @12, @13], @[@21, @22, @23], @[@31, @32, @33]];
    
    // 获取数组值的两种方法
    // 字面量访问方式(推荐)
    NSLog(@"arr2[2][2]:%@", arr2[2][2]);
    // 数组对象函数访问
    NSLog(@"arr2[2][2]:%@", [[arr2 objectAtIndex:2] objectAtIndex:2]);

}

- (void)mutableArr{
    //创建，当然还有其他方式
    NSMutableArray *mutableArr = [NSMutableArray arrayWithObjects:@"one",@"two",@"three", nil];
    //添加
    [mutableArr addObject:@"hello"];
    //替换
    [mutableArr replaceObjectAtIndex:2 withObject:@"tihuan"];
    //删除
    [mutableArr removeObjectAtIndex:1];
    
    //插入,在数组下标为1的位置插入,并且将后面的元素后移
    [mutableArr insertObject:@"ios" atIndex:1];

    NSLog(@"mutableArr = %@",mutableArr);
    
    // 初始化作为列的数组，看做4列
    NSMutableArray *columnArray = [[NSMutableArray alloc]initWithCapacity:4];

    // 初始化2个一维数组，每个一维数组有4个元素，看做1行4列，2行加起来就是2行4列
    NSMutableArray *rowArray1 = [[NSMutableArray alloc]initWithCapacity:4];
    NSMutableArray *rowArray2 = [[NSMutableArray alloc]initWithCapacity:4];

    // 每个行依次增加数组元素
    // 第一行
    [rowArray1 addObject:@"11"];
    [rowArray1 addObject:@"12"];
    [rowArray1 addObject:@"13"];
    [rowArray1 addObject:@"14"];

    // 第二行
    [rowArray2 addObject:@"21"];
    [rowArray2 addObject:@"22"];
    [rowArray2 addObject:@"23"];
    [rowArray2 addObject:@"24"];

    // 分别打印数组
    NSLog(@"myRowArray1: %@", rowArray1);
    NSLog(@"myRowArray2: %@", rowArray2);
    NSLog(@"myColumnArray: %@", columnArray);

    [columnArray insertObject:rowArray1 atIndex:0];
    [columnArray removeObject:rowArray1];
    NSLog(@"myColumnArray: %@", columnArray);
}

/**
 NSDictionary
 主要特点是不可变，如果集合初始化完成，将内容无法修改，无序。
 */
- (void)dictionaryTest{
    //标准创建
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"cat",@"name1",@"dog",@"name2", nil];
    NSLog(@"dict = %@", dict);
    
    //字面量创建
    NSDictionary *dict1 = @{@"name1":@"cat",@"name2":@"dog"};
    //第一种遍历
    for (NSString *key in [dict1 allKeys]) {
        NSLog(@"key: %@,value: %@", key, dict1[key]);
    }
    //第二种遍历方式，通过遍历器
    NSEnumerator *rator = [dict keyEnumerator];
    NSString *temp;
    while (temp = [rator nextObject]) {
        NSLog(@"%@", temp);
    }
    //获取元素
    id name = dict1[@"name"];
    [dict1 objectForKey:@"name"];
    //集合元素的个数
    NSInteger count = dict1.count;
    
    // 创建路径方法两个:
    // NSString *documents = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    //拼接文件绝对路径
    // NSString *path = [documents stringByAppendingPathComponent:@"header.png"];
    
    // 创建一个路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [docPath stringByAppendingFormat:@"dictionary.txt"];
    //沙盒文件存储和读取Plist
    [dict writeToFile:path atomically:YES];
    NSDictionary *dict7 = [NSDictionary dictionaryWithContentsOfFile:path];

    NSLog(@"name = %@,count = %li, dict7 = %@",name,count,dict7);
}

- (void)MutableDictionaryTest{
    //创建
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //添加
    [dict setObject:@"dog" forKey:@"name"];
    [dict setValue:@"18" forKey:@"age"];
    //会将传入字典中所有的键值对取出来添加到dict中
    [dict setValuesForKeysWithDictionary:@{@"name1":@"dog"}];
    //取元素
    [dict objectForKey:@"name"];
    id name = dict[@"name"];
    NSLog(@"%@",name);
    //删除
    [dict removeAllObjects];
    [dict removeObjectForKey:@"name"];
    [dict removeObjectsForKeys:@[@"name", @"age"]];
    //更新，如果利用setObject方法给已经存在的key赋值，新值会覆盖旧值
    [dict setObject:@"20" forKey:@"age"];
    dict[@"age"] = @"30";

}

/**
 无序，不可重复
 */
- (void)NSSetTest{
    // 不可变set
    // 实例化
    NSSet *set001 = [[NSSet alloc] initWithObjects:@"1", @"2", @"3",  @"4", nil];
    NSLog(@"set001 = %@", set001);
    
    NSSet *set002 = [NSSet setWithArray:@[@"1", @"3", @"7"]];
    
    // 比较
    // 1 判断两个set是否相等
    BOOL isEqual = [set001 isEqualToSet:set002];
    if (isEqual)
    {
        NSLog(@"set001 等于 set002");
    }
    else
    {
        NSLog(@"set001 不等于 set002");
    }
     
    // 2 判断 setA 是否是 setB 的子集
    BOOL isSub = [set002 isSubsetOfSet:set001];
    if (isSub)
    {
        NSLog(@"set002 是 set001 的子集");
    }
    else
    {
        NSLog(@"set002 不是 set001 的子集");
    }
     
    // 3 判断两个set是否有交集
    BOOL isIntersets = [set002 intersectsSet:set001];
    if (isIntersets)
    {
        NSLog(@"set002 与 set001 有交集");
    }
    else
    {
        NSLog(@"set002 与 set001 无交集");
    }
     
    // 4 是否包含某个对象
    BOOL isContains = [set002 containsObject:@"8"];
    if (isContains)
    {
        NSLog(@"set002 包含 8");
    }
    else
    {
        NSLog(@"set002 不包含 8");
    }
}

- (void)MutableSetTest{
    NSSet *set001 = [[NSSet alloc] initWithObjects:@"1", @"2", @"3",  @"4", nil];
    NSLog(@"set001 = %@", set001);
    
    NSSet *set002 = [NSSet setWithArray:@[@"1", @"3", @"7"]];
    
    // 可变的set
    NSMutableSet *set003 = [NSMutableSet setWithObjects:@"01", @"03", @"05", @"07", nil];
    NSLog(@"set003 = %@", set003);
    
    // 添加元素
    // 方法1 添加单个元素
    [set003 addObject:@"000"];
    NSLog(@"set003 = %@", set003);
     
    // 方法2 从指定数组中添加多个元素
    NSArray *array003 = @[@"111", @"222"];
    [set003 addObjectsFromArray:array003];
    NSLog(@"set003 = %@", set003);
     
    // 方法3 从指定set中添加多个元素
    [set003 intersectsSet:set002];
    NSLog(@"set003 = %@", set003);
    
    // 删除元素
    // 1 删除批定指定
    [set003 removeObject:@"111"];
    NSLog(@"set003 = %@", set003);
     
    // 2 删除所有元素
    [set003 removeAllObjects];
    NSLog(@"set003 = %@", set003);
    
    // 重新初始化set值
    [set003 setSet:set002];
    NSLog(@"set003 = %@", set003);
    
    // 去掉相同的元素，即set003 去掉与 set001 中相同的元素，保留不同的元素
    [set003 minusSet:set001];
    NSLog(@"set003 = %@", set003);
    
    // 并集，即两个集合组成一个集合
    [set003 unionSet:set001];
    NSLog(@"set003 = %@", set003);
}
@end
