//
//  NSMutableAttributedString+AttributedString.h
//  Markdown
//
//  Created by GAURAV GOVILKAR on 24/02/16.
//  Copyright © 2016 iMobDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (AttributedString)
-(void)setTextAsLink:(NSString*) textToFind withLinkURL:(NSString*) url;
-(void)clearUnwantedStrings:(NSString*)fromBaseString removeURL:(NSMutableArray *)arrURL;
-(void)getattributedBoldString :(NSMutableArray*)arrOfStings From:(NSString *)BaseString;
-(void)getattributedUnderlineString :(NSMutableArray*)arrOfStings From:(NSString *)BaseString;
-(void)getattributedHyperlinkString :(NSMutableArray*)arrOfStings URLS:(NSMutableArray*)arrOfURLS From:(NSString *)BaseString;
@end
