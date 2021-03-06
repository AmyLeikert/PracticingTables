//
//  ALTableViewController.m
//  PracticeStuff
//
//  Created by DetroitLabsUser on 5/2/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALTableViewController.h"
#import "ALFingerspellingViewController.h"
#import "ALASLanimalViewController.h"

@interface ALTableViewController ()
@property (strong, nonatomic) NSArray *swedishArray;
@property (strong, nonatomic) NSArray *japaneseArray;
@property (strong, nonatomic) NSArray *aslArray;



@end

NSString* const cellReuseIdentifier = @"cellIdentifier";

@implementation ALTableViewController

-(NSString *)docsDir {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    listPath = [[self docsDir]stringByAppendingPathComponent:@"aslAnimals.plist"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:listPath]) {
        [[NSFileManager defaultManager]copyItemAtPath:[[NSBundle mainBundle]pathForResource:@"aslAnimals" ofType:@"plist"] toPath:listPath error:nil];
    }
    array = [NSMutableArray arrayWithContentsOfFile:listPath];
    NSLog(@"Count: %@", array);
    
    
    self.swedishArray =  [NSArray arrayWithObjects:@"colloquial", @"verbs", @"nouns", nil];
    self.japaneseArray = [NSArray arrayWithObjects:@"Kanji", @"particles", @"Kana", nil];
    self.aslArray = [NSArray arrayWithObjects:@"Fingerspelling", @"Numbers", @"Animals", nil];
    
  //  ALTableViewController *tableView = [[ALTableViewController alloc] init];
    
    UIImageView *chalkImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ChalkboardBG.png"]];
    [chalkImageView setFrame:self.tableView.frame];
    
    self.tableView.backgroundView = chalkImageView;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.title = @"Language Practice";
    
    [[UINavigationBar appearance] setTitleTextAttributes: @{
                                    NSForegroundColorAttributeName:[UIColor colorWithRed:0.522 green:0.267 blue:0 alpha:1],
                                                            
                                        NSFontAttributeName:
                                        [UIFont
                                         fontWithName:@"Marker Felt" size:20.0f]
                                                            }];
    
   // [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.973 green:0.722 blue:0.22 alpha:1]];
   
    
    

    //set back button color
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor,nil] forState:UIControlStateNormal];
    
    
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.973 green:0.722 blue:0.22 alpha:1]];

}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
        
        //self.tableView.delegate = self;
     //   self.tableView.dataSource = self;
    }
    
   return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
        return self.swedishArray.count;
    if (section == 1)
        return self.japaneseArray.count;
    if (section == 2)
        return self.aslArray.count;
    return 0;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *myLabel = [[UILabel alloc] init];
    myLabel.frame = CGRectMake(20, 8, 320, 20);
    myLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    
    [myLabel setFont:[UIFont fontWithName:@"Marker Felt" size:20]];
    [myLabel setTextColor:[UIColor colorWithRed:0.318 green:0.141 blue:0 alpha:1]];
    
    UIView *headerView = [[UIView alloc] init];
    [headerView addSubview:myLabel];
    
    return headerView;
   // myLabel.textAlignment= UITextAlignmentCenter;
     //[myLabel setTextColor:[UIColor colorWithRed:0.396 green:0.196 blue:0 alpha:1]];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
 
    if (section == 0)
        return @"Swedish";
    if (section == 1)
        return @"Japanese";
    if (section == 2)
        return @"American Sign Language";
    return @"undefined";
    }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    
    UIView *selectionView = [[UIView alloc]initWithFrame:cell.bounds];
    
    [selectionView setBackgroundColor:[UIColor brownColor]];
    
    cell.selectedBackgroundView = selectionView;
    
    
//    UIButton *downloadButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [downloadButton setTitle:@"Download" forState:UIControlStateNormal];
//    [downloadButton setFrame:CGRectMake(0, 0, 100, 35)];
//    cell.accessoryView = downloadButton;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [cell setBackgroundColor:[UIColor clearColor]];
    
    [cell.textLabel setFont:[UIFont fontWithName:@"MarkerFelt-Thin" size:18]];
    [cell.textLabel setTextColor:[UIColor whiteColor]];

    
        // The below gives a full image in a cell if there is no text in the cell.
   // cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"grape_PNG521"]];
    
        // The below gives a resized square image to the left regardless of whether or not there is text in the cell
    
    //This is just practice to see how to use images in cells. Obvs, I don't want/need grapes in here.
  // [cell.imageView setImage:[UIImage imageNamed:@"grape_PNG521"]];
    

    cell.textLabel.textAlignment = UITextAlignmentCenter;


    if (indexPath.section == 0)
        cell.textLabel.text = [self.swedishArray objectAtIndex:indexPath.row];
    if (indexPath.section == 1)
        cell.textLabel.text = [self.japaneseArray objectAtIndex:indexPath.row];
    if (indexPath.section == 2)
        cell.textLabel.text = [self.aslArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
//    UIButton *downloadButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [downloadButton setTitle:@"Download" forState:UIControlStateNormal];
//    [downloadButton setFrame:CGRectMake(0, 0, 100, 35)];
//    [tableView cellForRowAtIndexPath:indexPath].accessoryView = downloadButton;
    
    
    ALFingerspellingViewController *fsViewController = [[ALFingerspellingViewController alloc] init];
    
    ALASLanimalViewController *animalViewController = [[ALASLanimalViewController alloc] init];
    
    if (indexPath.section == 2 && indexPath.row == 0)
        return [self.navigationController pushViewController:fsViewController animated:YES];
    if (indexPath.section == 2 && indexPath.row == 2)
        return [self.navigationController pushViewController:animalViewController animated:YES];
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

 //In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Navigation logic may go here, for example:
//    // Create the next view controller.
//    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
//    
//    // Pass the selected object to the new view controller.
//    
//    // Push the view controller.
//    [self.navigationController pushViewController:detailViewController animated:YES];
//}


@end
