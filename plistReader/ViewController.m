//
//  ViewController.m
//  plistReader
//
//  Created by ninja chen on 14/12/14.
//  Copyright (c) 2014年 ninja chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"areaNumber" ofType:@"plist"];
    NSArray *areaArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:areaArray options:NSJSONWritingPrettyPrinted error:&error];
    //NSData转换为String
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"JSON String = %@", jsonString);
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask,YES);
    NSString *ourDocumentPath =[documentPaths objectAtIndex:0];
    NSString *fileName=[ourDocumentPath stringByAppendingPathComponent:@"ninjafile"];
    [jsonData writeToFile:fileName atomically:YES];
    //遍历
//    for (NSDictionary *dic in areaArray) {
//        NSArray *citiesArray = dic[@"cities"];
//        for (NSDictionary *shiDic in citiesArray) {
//             NSArray *quArray = shiDic[@"areas"];
//            for (NSDictionary *quDic in quArray) {
//                for(id key in quDic){
//                    NSLog(@"key %@, value %@", key, quDic[key]);
//
//                }
//            }
//        }
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
