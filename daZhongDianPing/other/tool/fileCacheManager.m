//
//  fileCacheManager.m
//  daZhongDianPing
//
//  Created by ttbb on 16/9/23.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "fileCacheManager.h"

@implementation fileCacheManager

+(BOOL)saveObject:(id)object fileName:(NSString *)fileName
{
    
    NSString *path = [self appendFileName:fileName];
    
    path = [path stringByAppendingString:@".archive"];
    
    BOOL success = [NSKeyedArchiver archiveRootObject:object toFile:path];
    
    return success;
}

+(id)getObjectWithFileName:(NSString *)fileName
{
    
    NSString *path = [self appendFileName:fileName];
    
     path = [path stringByAppendingString:@".archive"];
    
    id  object = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    return object;
}


+(void)removeObjectWithFileName:(NSString *)fileName
{
    
    NSString *path = [self appendFileName:fileName];
    
    path = [path stringByAppendingString:@".archive"];
    
    [[NSFileManager defaultManager]removeItemAtPath:path error:nil];
}


//把路径和文件名拼在一起
+(NSString*)appendFileName:(NSString*)fileName
{
     NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",cachePath,fileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:cachePath])
    {
        [[NSFileManager defaultManager]createDirectoryAtPath:filePath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    return filePath;
}


+(void)saveUserDefaults:(id)object forKey:(NSString *)key
{
    
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(id)getUserDefaultsForKey:(NSString *)key
{
    id object = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
     [[NSUserDefaults standardUserDefaults] synchronize];
    
    return object;
}

+(void)removeUserDefaultsForKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    
    [[NSUserDefaults standardUserDefaults ]synchronize];
    
}
@end






































