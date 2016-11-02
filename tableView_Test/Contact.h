//
//  contact.h
//  tableView_Test
//
//  Created by 鹏 刘 on 2016/10/27.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject
@property (nonatomic,strong) NSString *firstName;
@property (nonatomic,strong) NSString *lastName;
@property (nonatomic,strong) NSString *phoneNumber;

- (Contact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber;
- (NSString *)getName;
+ (Contact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber;

@end



