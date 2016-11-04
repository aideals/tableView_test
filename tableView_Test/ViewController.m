//
//  ViewController.m
//  tableView_Test
//
//  Created by 鹏 刘 on 2016/10/27.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,UISearchBarDelegate>
{
    NSMutableArray *contacts;
    UITableView *tableView1;
    NSIndexPath *selectedIndexPath;
    UISearchBar *searchBar1;
    NSMutableArray *searchArray;
    BOOL isSearching;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    tableView1 = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView1.dataSource = self;
    tableView1.delegate = self;
    
    [self addSearchBar];
    [self initData];
    [self.view addSubview:tableView1];

}

- (void)addSearchBar
{
    searchBar1 = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 45, self.view.bounds.size.width, 45)];
    searchBar1.placeholder = @"Search the string";
    tableView1.tableHeaderView = searchBar1;
    searchBar1.showsCancelButton = YES;
    searchBar1.delegate = self;
}

- (void)initData
{
    contacts = [[NSMutableArray alloc] init];
    
    Contact *contact1 = [Contact initWithFirstName:@"liu" andLastName:@"peng" andPhoneNumber:@"110"];
    Contact *contact2 = [Contact initWithFirstName:@"liu" andLastName:@"song song" andPhoneNumber:@"111"];
    Contact *contact3 = [Contact initWithFirstName:@"liu" andLastName:@"sha" andPhoneNumber:@"112"];
    Contact *contact4 = [Contact initWithFirstName:@"liu" andLastName:@"er jun" andPhoneNumber:@"113"];
    Contact *contact5 = [Contact initWithFirstName:@"liu" andLastName:@"da jun" andPhoneNumber:@"114"];
    ContactGrouped *group1 = [ContactGrouped initWithName:@"L" andDetail:@"This is Liu" andContacts:[NSMutableArray arrayWithObjects:contact1,contact2,contact3,contact4,contact5,nil]];
    [contacts addObject:group1];

    Contact *contact6 = [Contact initWithFirstName:@"niu" andLastName:@"jia" andPhoneNumber:@"115"];
    Contact *contact7 = [Contact initWithFirstName:@"niu" andLastName:@"ben" andPhoneNumber:@"116"];
    Contact *contact8 = [Contact initWithFirstName:@"niu" andLastName:@"zhen" andPhoneNumber:@"117"];
    Contact *contact9 = [Contact initWithFirstName:@"niu" andLastName:@"cong" andPhoneNumber:@"118"];
    ContactGrouped *group2 = [ContactGrouped initWithName:@"N" andDetail:@"This is Niu" andContacts:[NSMutableArray arrayWithObjects:contact6,contact7,contact8,contact9, nil]];
    [contacts addObject:group2];
    
    Contact *contact10 = [Contact initWithFirstName:@"zhang" andLastName:@"gang" andPhoneNumber:@"119"];
    Contact *contact11 = [Contact initWithFirstName:@"zhang" andLastName:@"jun zhao" andPhoneNumber:@"120"];
    Contact *contact12 = [Contact initWithFirstName:@"zhang" andLastName:@"xiang yang" andPhoneNumber:@"121"];
    ContactGrouped *group3 = [ContactGrouped initWithName:@"Z" andDetail:@"This is Zhang" andContacts:[NSMutableArray arrayWithObjects:contact10,contact11,contact12, nil]];
    [contacts addObject:group3];
    
    Contact *contact13 = [Contact initWithFirstName:@"zhao" andLastName:@"wen li" andPhoneNumber:@"122"];
    Contact *contact14 = [Contact initWithFirstName:@"zhao" andLastName:@"xiao fang" andPhoneNumber:@"123"];
    Contact *contact15 = [Contact initWithFirstName:@"zhao" andLastName:@"xiao bing" andPhoneNumber:@"124"];
    ContactGrouped *group4 = [ContactGrouped initWithName:@"O" andDetail:@"This is Zhao" andContacts:[NSMutableArray arrayWithObjects:contact13,contact14,contact15,nil]];
    [contacts addObject:group4];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (isSearching) {
        return 1;
    }
    
    return contacts.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isSearching) {
        return searchArray.count;
    }
    
    ContactGrouped *group1 = contacts[section];
    return group1.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contact *contact = nil;
    
    if (isSearching) {
         contact = searchArray[indexPath.row];
    } else{
    
    ContactGrouped *group = contacts[indexPath.section];
    contact = group.contacts[indexPath.row];
    }
    
    UITableViewCell *cell;
    static NSString *reuseIdentifier = @"identifier";
    static NSString *switchReuseIdentifier = @"switchIdentifier";
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:switchReuseIdentifier];
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    }
    
    if (!cell) {
        if (indexPath.row == 0) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:switchReuseIdentifier];
            UISwitch *sw = [[UISwitch alloc] init];
            [sw addTarget:self action:@selector(changedValue:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = sw;
            
        }else{
        
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
         cell.accessoryType = UITableViewCellAccessoryDetailButton;
        }
    }
    
    if (indexPath.row == 0) {
        ((UISwitch *)cell.accessoryView).tag = indexPath.section;
    }
    
    
    cell.textLabel.text = [contact getName];
    cell.detailTextLabel.text = contact.phoneNumber;
    
    return cell;
}

- (void)changedValue:(UISwitch *)sw
{
    
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    ContactGrouped *group = contacts[section];
    return group.name;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    ContactGrouped *group = contacts[section];
    return group.detail;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *indexs = [[NSMutableArray alloc] init];
    for (ContactGrouped *group in contacts) {
        [indexs addObject:group.name];
    }

    return indexs;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 50;
    }
   
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    ContactGrouped *group = contacts[indexPath.section];
    Contact *contact = group.contacts[indexPath.row];
    
    selectedIndexPath = indexPath;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"system info" message:[contact getName] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        ContactGrouped *group = contacts[selectedIndexPath.section];
        Contact *contact = group.contacts[selectedIndexPath.row];
        contact.phoneNumber =textField.text;
    }];
    
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];

}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    isSearching = NO;
    searchBar.text = @"";
    [tableView1 reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchBar.text isEqualToString:@""]) {
        isSearching = NO;
        [tableView1 reloadData];
        return;
    }
    [self searchDataWithKeyWord:searchBar.text];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self searchDataWithKeyWord:searchBar.text];
    [searchBar resignFirstResponder];
}


- (void)searchDataWithKeyWord:(NSString *)keyWord
{
    isSearching = YES;
    searchArray = [NSMutableArray array];
    
    [contacts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ContactGrouped *group = obj;
    
        [group.contacts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            Contact *contact = obj;
            if ([contact.firstName.uppercaseString containsString:keyWord.uppercaseString] || [contact.lastName.uppercaseString containsString:keyWord.uppercaseString] ||[contact.phoneNumber containsString:keyWord]) {
                [searchArray addObject:contact];
            }
        
        }];
        
    
    
    }];
    
    [tableView1 reloadData];
}

@end
