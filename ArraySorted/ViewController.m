//
//  ViewController.m
//  ArraySorted
//
//  Created by 杜文亮 on 2017/10/4.
//  Copyright © 2017年 杜文亮. All rights reserved.
//

#import "ViewController.h"




@interface ViewController ()

@property (nonatomic,strong) NSArray *arr_N;//NSNumber类型的不可变数组
@property (nonatomic,strong) NSArray *arr_S;//字符串类型的不可变数组
@property (nonatomic,strong) NSArray *arr_S_1;//字符串类型的不可变数组

@end




@implementation ViewController

#pragma mark - 懒加载

-(NSArray *)arr_N
{
    if (!_arr_N)
    {
        _arr_N = @[@(2),@(5),@(1),@(4),@(3),@(1)];
    }
    return _arr_N;
}

-(NSArray *)arr_S
{
    if (!_arr_S)
    {
        _arr_S = @[@"2",@"5",@"1",@"4",@"3",@"1"];
    }
    return _arr_S;
}

-(NSArray *)arr_S_1
{
    if (!_arr_S_1)
    {
        _arr_S_1 = @[@"b",@"o",@"y",@"g",@"i",@"r",@"l"];
    }
    return _arr_S_1;
}




#pragma mark - viewDidLoad 初始化

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //不可变数组使用sortedArrayUsingComparator方法进行排序，排序后的数组需要用新的数组容器接收，原始数组不受排序操作的影响！
    [self arrUse];
    
    //可变数组使用sortUsingComparator方法进行排序，直接对原始数组的操作，会更改原始数组！
    [self arr_mUse];
}

-(void)arrUse
{
    NSArray *arr_s = [NSArray array];
    arr_s = [self.arr_N sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2)
  {
      //逆序排列（某些特殊场景可能会使用）
//      return NSOrderedDescending;
      
      //返回的数组和原始数组一样(这两个其实没什么意义)
//        return NSOrderedAscending;return NSOrderedSame;
      
      
      NSNumber *ob1 = (NSNumber *)obj1;
      NSNumber *ob2 = (NSNumber *)obj2;
      //降序(简便写法)
        return [ob1 integerValue] < [ob2 integerValue];
//      return [ob2 compare:ob1];
      //升序（简便写法）
//      return [ob1 integerValue] > [ob2 integerValue];
//      return [ob1 compare:ob2];
      
      /*
       *   升序、降序排列（复杂写法）的区分方式：只要return NSOrderedDescending;代表交换obj1和obj2的位置，返回其他两个枚举值代表不交换，再根据我们写的判断条件，就可以确定本次排列是升序还是降序了
       */
//      if (ob1.integerValue > ob2.integerValue)
//      {
////          return NSOrderedAscending;//不交换obj1和obj2的位置
//          return NSOrderedDescending;//交换
//      }
//      else if (ob1.integerValue < ob2.integerValue)
//      {
////          return NSOrderedDescending;//交换
//          return NSOrderedAscending;//不交换
//      }
//      else
//      {
//          return NSOrderedSame;//不交换
//      }
  }];
    NSLog(@"原始数组：%@\n排序后的数组：%@\n排序后的数组需要用新的数组容器接收，原始数组不受排序操作的影响！",self.arr_N,arr_s);
    
    arr_s = [self.arr_S sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2)
     {
         //逆序排列（某些特殊场景可能会使用）
//         return NSOrderedDescending;
         
         //返回的数组和原始数组一样(这两个其实没什么意义)
//         return NSOrderedAscending;return NSOrderedSame;
         
         
         NSString *ob1 = (NSString *)obj1;
         NSString *ob2 = (NSString *)obj2;
         //降序(简便写法)
//         return [ob2 compare:ob1];
//         return [ob1 integerValue] < [ob2 integerValue];
         //升序（简便写法）
//         return [ob1 compare:ob2];
//         return [ob1 integerValue] > [ob2 integerValue];
         
         /*
          *   升序、降序排列（复杂写法）的区分方式：只要return NSOrderedDescending;代表交换obj1和obj2的位置，返回其他两个枚举值代表不交换，再根据我们写的判断条件，就可以确定本次排列是升序还是降序了
          */
           if (ob1.integerValue > ob2.integerValue)
           {
     //          return NSOrderedAscending;//不交换obj1和obj2的位置
               return NSOrderedDescending;//交换
           }
           else if (ob1.integerValue < ob2.integerValue)
           {
     //          return NSOrderedDescending;//交换
               return NSOrderedAscending;//不交换
           }
           else
           {
               return NSOrderedSame;//不交换
           }
     }];
    NSLog(@"原始数组：%@\n排序后的数组：%@\n排序后的数组需要用新的数组容器接收，原始数组不受排序操作的影响！",self.arr_N,arr_s);
    
    arr_s = [self.arr_S_1 sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2)
    {
        //逆序排列（某些特殊场景可能会使用）
//        return NSOrderedDescending;
        
        //返回的数组和原始数组一样(这两个其实没什么意义)
//        return NSOrderedAscending;return NSOrderedSame;
        
        
        //不使用ob1、ob2接收也可以直接使用[ob1 compare:ob2]实现（runtime机制的强大之处）
        NSString *ob1 = (NSString *)obj1;
        NSString *ob2 = (NSString *)obj2;
        //降序
//        return [ob2 compare:ob1];
        //升序
        return [ob1 compare:ob2];
    }];
    NSLog(@"原始数组：%@\n排序后的数组：%@\n排序后的数组需要用新的数组容器接收，原始数组不受排序操作的影响！",self.arr_S_1,arr_s);
}

-(void)arr_mUse
{
    NSMutableArray *arr_m = [NSMutableArray arrayWithArray:self.arr_N];
    [arr_m sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2)
    {
        //几种用法和上面不可变数组一样，这里不再一一举例
        NSNumber *ob1 = (NSNumber *)obj1;
        NSNumber *ob2 = (NSNumber *)obj2;
//        return [ob1 compare:ob2];//升序
        return [ob2 compare:ob1];//降序
    }];
    NSLog(@"%@",arr_m);
}

@end
