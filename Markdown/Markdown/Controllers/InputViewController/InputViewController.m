//
//  InputViewController.m
//  Markdown
//
//  Created by GAURAV GOVILKAR on 24/02/16.
//  Copyright © 2016 iMobDev. All rights reserved.
//

#import "InputViewController.h"
#import "NSString+String.h"
#import "NSMutableAttributedString+AttributedString.h"
#import "ResultViewController.h"

@interface InputViewController ()<UITextViewDelegate>{
    IBOutlet UITextView *txtView;
    NSMutableAttributedString *attributedString;
}

@end

@implementation InputViewController
@synthesize strTitle;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.titleTextAttributes = @{
                                                                    NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:22],
                                                                    NSForegroundColorAttributeName: [UIColor whiteColor]
                                                                    };
    
    self.navigationController.navigationBar.topItem.title = strTitle;
    
}

-(IBAction)backtoNotes:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)PublishText:(id)sender{
    
    attributedString = [[NSMutableAttributedString alloc] initWithString:txtView.text];
    [attributedString getattributedUnderlineString:[txtView.text stringsBetweenString:@"_" andString:@"_"] From:txtView.text];
   
    if ([[txtView.text stringsBetweenString:@"(" andString:@")"] count]==[[txtView.text stringsBetweenString:@"[" andString:@"]"] count]) {
         [attributedString getattributedHyperlinkString:[txtView.text stringsBetweenString:@"(" andString:@")"] URLS:[txtView.text stringsBetweenString:@"[" andString:@"]"] From:txtView.text];
    }
    NSRange range = [[attributedString mutableString] rangeOfString:[attributedString mutableString]];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:21] range:range];
     [attributedString getattributedBoldString:[txtView.text stringsBetweenString:@"*" andString:@"*"] From:txtView.text];
 
    [attributedString clearUnwantedStrings:txtView.text removeURL:[txtView.text stringsBetweenString:@"[" andString:@"]"]];
   
//    txtView.text = @"";
//    txtView.attributedText = attributedString;
//    txtView.editable = false;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    
    if (URL.absoluteString) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URL.absoluteString]];
        return YES;

        
    }
    return false;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"Result"]) {
        ResultViewController *navController =
        (ResultViewController*)[segue destinationViewController];
        navController.strTitle = strTitle;
        navController.attributedString = attributedString;
    }
}

@end
