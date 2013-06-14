//
//  DFMAppDelegate.h
//  TestNSDateFormatterOnMac
//
//  Created by Balun Software on 2013/06/14.
//  Copyright (c) 2013 Toshihiko FUNAKURA - Balun Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DFMAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
- (IBAction)refreshPressed:(NSButton *)sender;

@property (strong, nonatomic, readonly) NSDate *now;

@property (strong, nonatomic, readonly) NSString *calendarIdentifierDefault;
@property (strong, nonatomic, readonly) NSString *formatDefault;
@property (strong, nonatomic, readonly) NSString *formatDefaultMatch;
@property (strong, nonatomic, readonly) NSString *formattedDefault;
@property (strong, nonatomic, readonly) NSString *formatDefaultA;
@property (strong, nonatomic, readonly) NSString *formatDefaultMatchA;
@property (strong, nonatomic, readonly) NSString *formattedDefaultA;
@property (strong, nonatomic, readonly) NSString *defaultIsCurrent;

@property (strong, nonatomic, readonly) NSString *calendarIdentifierSystem;
@property (strong, nonatomic, readonly) NSString *formatSystem;
@property (strong, nonatomic, readonly) NSString *formatSystemMatch;
@property (strong, nonatomic, readonly) NSString *formattedSystem;
@property (strong, nonatomic, readonly) NSString *formatSystemA;
@property (strong, nonatomic, readonly) NSString *formatSystemMatchA;
@property (strong, nonatomic, readonly) NSString *formattedSystemA;

@property (strong, nonatomic, readonly) NSString *calendarIdentifierJapanese;
@property (strong, nonatomic, readonly) NSString *formatJapanese;
@property (strong, nonatomic, readonly) NSString *formattedJapanese;
@property (strong, nonatomic, readonly) NSString *formatJapaneseA;
@property (strong, nonatomic, readonly) NSString *formattedJapaneseA;

@property (strong, nonatomic, readonly) NSString *calendarIdentifierGregorian;
@property (strong, nonatomic, readonly) NSString *formatGregorian;
@property (strong, nonatomic, readonly) NSString *formattedGregorian;

@end
