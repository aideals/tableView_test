//
//  contactGrouped.h
//  tableView_Test
//
//  Created by 鹏 刘 on 2016/10/27.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ContactGrouped : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *detail;
@property (nonatomic,strong) NSMutableArray *contacts;

- (ContactGrouped *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;
+ (ContactGrouped *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;
@end
