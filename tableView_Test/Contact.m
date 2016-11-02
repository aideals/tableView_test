//
//  contact.m
//  tableView_Test
//
//  Created by 鹏 刘 on 2016/10/27.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (Contact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber
{
    if (self = [super init]){
    self.firstName = firstName;
    self.lastName = lastName;
    self.phoneNumber = phoneNumber;
    }
    
    return self;
}

- (NSString *)getName
{
    return [NSString stringWithFormat:@"%@ %@",_firstName,_lastName];
}

+ (Contact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber
{
    Contact *contact = [[Contact alloc] initWithFirstName:firstName andLastName:lastName andPhoneNumber:phoneNumber];
    
    return contact;
}


@end
