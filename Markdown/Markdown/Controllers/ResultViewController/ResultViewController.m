//
//  ResultViewController.m
//  Markdown
//
//  Created by GAURAV GOVILKAR on 24/02/16.
//  Copyright © 2016 iMobDev. All rights reserved.
//

#import "ResultViewController.h"

@implementation ResultViewController
@synthesize strTitle;
@synthesize txtView;
@synthesize attributedString;
@synthesize dictComments;
@synthesize arrComments;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrComments = [[NSMutableArray alloc] init];
    dictComments = [[NSMutableDictionary alloc] init];
    _publisedNotes = [[NSMutableArray alloc] init];
    _dictNotes = [[NSMutableDictionary alloc] init];
    
    txtView.attributedText = attributedString;
    txtView.editable = false;
    
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    UIMenuItem *resetMenuItem = [[UIMenuItem alloc] initWithTitle:@"Comment" action:@selector(menuItemClicked:)];
     [menuController setMenuItems:[NSArray arrayWithObject:resetMenuItem]];
    [menuController setMenuVisible:NO animated:YES];
    
    
    
    [[NSUserDefaults standardUserDefaults] setObject:arrComments forKey:@"COMMENTS"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

- (void) menuItemClicked:(id) sender {

    NSString *str = @"Comment Added";
    [dictComments setValue:str forKey:_selectedText];
    NSRange range = [attributedString.mutableString rangeOfString:_selectedText options:NSCaseInsensitiveSearch];
    [attributedString addAttribute:NSLinkAttributeName value:str range:range];
    [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor yellowColor] range:range];
    txtView.attributedText = attributedString;
    [arrComments addObject:dictComments];
    [[NSUserDefaults standardUserDefaults] setObject:arrComments forKey:@"COMMENTS"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

- (BOOL) canPerformAction:(SEL)selector withSender:(id) sender {
    if (selector == @selector(menuItemClicked:)) {
        return YES;
    }
    return NO;
}

- (BOOL) canBecomeFirstResponder {
    return YES;
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.titleTextAttributes = @{
                                                                    NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:22],
                                                                    NSForegroundColorAttributeName: [UIColor whiteColor]
                                                                    };
    
    self.navigationController.navigationBar.topItem.title = strTitle;
    
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    
    UITextRange *selectedRange = [textView selectedTextRange];
     _selectedText= [textView textInRange:selectedRange];

}

-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    
    
    NSLog(@"%@",[arrComments valueForKey:[txtView.text substringWithRange:characterRange]]);
    return false;
}


-(IBAction)backtoNotes:(id)sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}



@end
