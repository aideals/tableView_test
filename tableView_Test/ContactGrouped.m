//
//  contactGrouped.m
//  tableView_Test
//
//  Created by 鹏 刘 on 2016/10/27.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "ContactGrouped.h"

@implementation ContactGrouped

- (ContactGrouped *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts
{
    if (self = [super init]) {
    self.name = name;
    self.detail = detail;
    self.contacts = contacts;
    }
    
    return self;
}

+ (ContactGrouped *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts
{
    ContactGrouped *contactGrouped = [[ContactGrouped alloc] initWithName:name andDetail:detail andContacts:contacts];

    return contactGrouped;
}


@end
