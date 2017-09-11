//
//  BNRPaletteViewController.m
//  Colorboard
//
//  Created by iStef on 26.01.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

#import "BNRPaletteViewController.h"
#import "BNRColorViewController.h"
#import "BNRColorDescription.h"

@interface BNRPaletteViewController ()

@property (nonatomic) NSMutableArray *colors;

@end

@implementation BNRPaletteViewController


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"NewColor"]) {
        
        //if we are adding a new color, create an instance and add it to the colors array
        BNRColorDescription *color=[[BNRColorDescription alloc]init];
        [self.colors addObject:color];
        
        UINavigationController *nc=(UINavigationController *)segue.destinationViewController;
        BNRColorViewController *mvc=(BNRColorViewController *)[nc topViewController];
        mvc.colorDescription=color;
    }else if ([segue.identifier isEqualToString:@"ExistingColor"]){
        
        //for the push segue, the sender is the UITableViewCell
        NSIndexPath *ip=[self.tableView indexPathForCell:sender];
        
        BNRColorDescription *color=self.colors[ip.row];
        
        //set the color, and also tell the view controller that this is an existing color
        BNRColorViewController *cvc=(BNRColorViewController *)segue.destinationViewController;
        
        cvc.colorDescription=color;
        cvc.existingColor=YES;
    }
        
}

-(NSMutableArray *)colors
{
    if (!_colors) {
        _colors=[[NSMutableArray alloc]init];
        
        BNRColorDescription *cd=[[BNRColorDescription alloc]init];
        
        [_colors addObject:cd];
    }
    return _colors;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.colors count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    BNRColorDescription *color=self.colors[indexPath.row];
    
    cell.textLabel.text=color.name;
    
    return cell;
}


@end
