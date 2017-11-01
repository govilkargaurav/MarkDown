//
//  ViewController.m
//  Markdown
//
//  Created by GAURAV GOVILKAR on 23/02/16.
//  Copyright © 2016 iMobDev. All rights reserved.
//

#import "ViewController.h"
#import "InputViewController.h"
#import "NSString+String.h"
#import "NSString_FileString.h"
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/256.0f green:(g)/256.0f blue:(b)/256.0f alpha:1.0f]

@interface ViewController (){

    
    NSString * strTitleNote;
}
@property (nonatomic,strong)NSMutableArray *notesContent;
@end

@implementation ViewController

@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.notesContent = [[NSMutableArray alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = RGBCOLOR(255, 249, 236);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.titleTextAttributes = @{
                                                                    NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:22],
                                                                    NSForegroundColorAttributeName: [UIColor whiteColor]
                                                                    };
    self.navigationController.navigationBar.topItem.title = @"Markdown";
}

-(IBAction)addNewNotes: (id)sender{
    
    NSString *strNotesTitle = [NSString stringWithFormat:@"Note %ld",[self.notesContent count]+1];
    [self.notesContent addObject:strNotesTitle];
    
    [self.tableView reloadData];
    
}


#pragma mark - UITableView Delegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    strTitleNote = [NSString stringWithFormat:@"Note %ld",indexPath.row];
}

#pragma mark - UITableView Datasource Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.notesContent count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if ([self.notesContent count]==0) {
        UIView *sectionHeader = [[UIView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 40)];
        [sectionHeader setBackgroundColor:[UIColor clearColor]];
        return sectionHeader;
    }
    
    
    UIView *sectionHeader = [[UIView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 40)];
    [sectionHeader setBackgroundColor:RGBCOLOR(255, 249, 236)];
    UILabel *lblSeprator = [[UILabel alloc] initWithFrame:CGRectMake(20, 10 , self.view.frame.size.width,25)];
    lblSeprator.text = @"Notes";
    [lblSeprator setTextColor:[UIColor blackColor]];
    [sectionHeader addSubview:lblSeprator];
    return sectionHeader;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *simpleTableIdentifier = @"NotesCell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [self.notesContent objectAtIndex:indexPath.row];
    UILabel *lblSeprator = [[UILabel alloc] initWithFrame:CGRectMake(0, 59, self.view.frame.size.width, 1)];
    [lblSeprator setBackgroundColor:[UIColor blackColor]];
    [lblSeprator setTextColor:[UIColor clearColor]];
    [cell addSubview:lblSeprator];
    
    /*
     *   Now that we have a cell we can configure it to display the data corresponding to
     *   this row/section
     */
        /* Now that the cell is configured we return it to the table view so that it can display it */
    
    return cell;

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"Input"]) {
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSIndexPath *indexpath = [self.tableView indexPathForCell:cell];
        InputViewController *navController =
        (InputViewController*)[segue destinationViewController];
        navController.strTitle = [self.notesContent objectAtIndex:(int)indexpath.row];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
