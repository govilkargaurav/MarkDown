//
//  NSMutableAttributedString+AttributedString.m
//  Markdown
//
//  Created by GAURAV GOVILKAR on 24/02/16.
//  Copyright © 2016 iMobDev. All rights reserved.
//

#import "NSMutableAttributedString+AttributedString.h"
#import <UIKit/UIKit.h>
@implementation NSMutableAttributedString (AttributedString)




-(void)clearUnwantedStrings:(NSString*)fromBaseString removeURL:(NSMutableArray *)arrURL{
    
    
    [[self mutableString] replaceOccurrencesOfString:@"_" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, fromBaseString.length)];
    [[self mutableString] replaceOccurrencesOfString:@"*" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, self.length)];
    [[self mutableString] replaceOccurrencesOfString:@"(" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, self.length)];
    [[self mutableString] replaceOccurrencesOfString:@")" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, self.length)];
    [[self mutableString] replaceOccurrencesOfString:@"[" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, self.length)];
    [[self mutableString] replaceOccurrencesOfString:@"]" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, self.length)];
    for (NSString *str in arrURL)
    {
        NSRange range = [[self mutableString] rangeOfString:str];
        [self replaceCharactersInRange:range withString:@""];
    }
}

-(void)getattributedBoldString :(NSMutableArray*)arrOfStings From:(NSString *)BaseString{
    for (NSString *str in arrOfStings)
    {
        NSRange range = [BaseString rangeOfString:str];
        [self addAttribute:NSFontAttributeName
                                 value:[UIFont boldSystemFontOfSize:21]
                                 range:range];
    }
}

-(void)getattributedUnderlineString :(NSMutableArray*)arrOfStings From:(NSString *)BaseString{
    for (NSString *str in arrOfStings)
    {
        NSRange range = [BaseString rangeOfString:str];
        [self addAttributes: @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)} range:range];
        [self addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:21] range:range];
        
    }
}
-(void)setTextAsLink:(NSString*) textToFind withLinkURL:(NSString*) url
{
    NSRange range = [self.mutableString rangeOfString:textToFind options:NSCaseInsensitiveSearch];
    
    if (range.location != NSNotFound) {
        
        [self addAttribute:NSLinkAttributeName value:url range:range];
        [self addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:range];
        [self addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:21] range:range];
    }
}

-(void)getattributedHyperlinkString :(NSMutableArray*)arrOfStings URLS:(NSMutableArray*)arrOfURLS From:(NSString *)BaseString{
   
        for (int i=0;i<[arrOfURLS count]; i++)
        {
            [self setTextAsLink:[arrOfStings objectAtIndex:i] withLinkURL:[arrOfURLS objectAtIndex:i]];
        }

}


@end
