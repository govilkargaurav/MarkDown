//
//  ResultViewController.h
//  Markdown
//
//  Created by GAURAV GOVILKAR on 24/02/16.
//  Copyright © 2016 iMobDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultViewController : UIViewController<UITextViewDelegate>
@property (nonatomic,strong)NSString *strTitle;
@property (nonatomic,strong)IBOutlet UITextView *txtView;
@property (nonatomic,strong)NSMutableAttributedString *attributedString;
@property (nonatomic,strong)NSString *selectedText;
@property (nonatomic,strong)NSMutableDictionary *dictComments;
@property (nonatomic,strong)NSMutableArray *arrComments;
@property (nonatomic,strong)NSMutableArray *publisedNotes;
@property (nonatomic,strong)NSMutableDictionary *dictNotes;
@end
