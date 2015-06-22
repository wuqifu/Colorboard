//
//  WQFPaletteViewController.m
//  Colorboard
//
//  Created by Wuqifu on 15/6/14.
//  Copyright (c) 2015年 Wuqifu. All rights reserved.
//

#import "WQFPaletteViewController.h"
#import "WQFColorViewController.h"
#import "WQFColorDescription.h"

@interface WQFPaletteViewController ()
@property (nonatomic, readwrite, strong) NSMutableArray *colors;
@end


@implementation WQFPaletteViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

-(NSMutableArray *)colors
{
    if(!_colors) {
        _colors = [NSMutableArray array];
        
        WQFColorDescription *cd = [[WQFColorDescription alloc] init];
        [_colors addObject:cd];
    }
    
    return _colors;
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.colors.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    
    // Configure the cell...
    WQFColorDescription *color = self.colors[indexPath.row];
    cell.textLabel.text = color.name;
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString: @"NewColor"]) {
        WQFColorDescription *color = [[WQFColorDescription alloc] init];
        [self.colors addObject:color];
        
        UINavigationController *nc = segue.destinationViewController;
        WQFColorViewController *mvc = (WQFColorViewController *)[nc topViewController];
        mvc.colorDescription = color;
        
    } else if ([[segue identifier] isEqualToString: @"ExistingColor"]){
        NSIndexPath * index =  [self.tableView indexPathForCell:sender];
        index = [self.tableView indexPathForSelectedRow];
        
        WQFColorDescription *colorDescription = self.colors[index.row];
        
        WQFColorViewController *nvc = [segue destinationViewController];
        nvc.colorDescription = colorDescription;
        nvc.existingColor = YES;
    } else {
        NSLog(@"Unkown segue identifier");
    }
}


@end
