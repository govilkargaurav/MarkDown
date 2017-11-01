//
//  NSString_FileString.h
//  Markdown
//
//  Created by GAURAV GOVILKAR on 01/03/16.
//  Copyright © 2016 iMobDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

@property (nonatomic,strong) NSString *strValue;
- (NSString *)substringFromIndex:(NSUInteger)from;
@end
