//
//  fileCacheManager.h
//  daZhongDianPing
//
//  Created by ttbb on 16/9/23.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface fileCacheManager : NSObject{
    
    
    
}

/**
 *  把对象归档到沙盒cache路径下
 *
 *  @param object   要存入的对象
 *  @param fileName 文件名称
 *
 *  @return 成功或失败
 */

+(BOOL)saveObject:(id)object fileName:(NSString*)fileName;



/**
 *  通过文件名称获取存入的对象
 *
 *  @param fileName 文件名称
 *
 *  @return 对象
 */
+(id)getObjectWithFileName:(NSString*)fileName;



/**
 *  删除归档对象
 *
 *  @param fileName 文件名称
 */
+(void)removeObjectWithFileName:(NSString*)fileName;


/**
 *  设置userdefaults
 *
 *  @param object 对象
 *  @param key    KEY
 */
+(void)saveUserDefaults:(id)object forKey:(NSString*)key;

/**
 *  获取对像
 *
 *  @param key KEY
 *
 *  @return 对象
 */
+(id)getUserDefaultsForKey:(NSString*)key;


/**
 *  删除userDefaults
 *
 *  @param key KEY
 */
+(void)removeUserDefaultsForKey:(NSString*)key;


@end


































