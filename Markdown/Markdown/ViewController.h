//
//  ViewController.h
//  Markdown
//
//  Created by GAURAV GOVILKAR on 23/02/16.
//  Copyright © 2016 iMobDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)IBOutlet UITableView *tableView;
@end

