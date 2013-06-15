//
//  DFMAppDelegate.m
//  TestNSDateFormatterOnMac
//
//  Created by Balun Software on 2013/06/14.
//  Copyright (c) 2013 Toshihiko FUNAKURA - Balun Software. All rights reserved.
//

#import "DFMAppDelegate.h"

@interface DFMAppDelegate ()

@property (strong, nonatomic, readwrite) NSDate *now;

@property (strong, nonatomic, readwrite) NSString *calendarIdentifierDefault;
@property (strong, nonatomic, readwrite) NSString *formatDefault;
@property (strong, nonatomic, readwrite) NSString *formatDefaultMatch;
@property (strong, nonatomic, readwrite) NSString *formattedDefault;
@property (strong, nonatomic, readwrite) NSString *formatDefaultA;
@property (strong, nonatomic, readwrite) NSString *formatDefaultMatchA;
@property (strong, nonatomic, readwrite) NSString *formattedDefaultA;
@property (strong, nonatomic, readwrite) NSString *defaultIsCurrent;

@property (strong, nonatomic, readwrite) NSString *calendarIdentifierSystem;
@property (strong, nonatomic, readwrite) NSString *formatSystem;
@property (strong, nonatomic, readwrite) NSString *formatSystemMatch;
@property (strong, nonatomic, readwrite) NSString *formattedSystem;
@property (strong, nonatomic, readwrite) NSString *formatSystemA;
@property (strong, nonatomic, readwrite) NSString *formatSystemMatchA;
@property (strong, nonatomic, readwrite) NSString *formattedSystemA;

@property (strong, nonatomic, readwrite) NSString *calendarIdentifierJapanese;
@property (strong, nonatomic, readwrite) NSString *formatJapanese;
@property (strong, nonatomic, readwrite) NSString *formattedJapanese;
@property (strong, nonatomic, readwrite) NSString *formatJapaneseA;
@property (strong, nonatomic, readwrite) NSString *formattedJapaneseA;

@property (strong, nonatomic, readwrite) NSString *calendarIdentifierGregorian;
@property (strong, nonatomic, readwrite) NSString *formatGregorian;
@property (strong, nonatomic, readwrite) NSString *formattedGregorian;

@end

#pragma mark -

@implementation DFMAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshResult)
                                                 name:NSCurrentLocaleDidChangeNotification
                                               object:nil];
    
    [self refreshResult];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}

- (IBAction)refreshPressed:(NSButton *)sender
{
    [self refreshResult];
}

- (void)refreshResult
{
    NSDateFormatter *dateFormatter;
    
    // Now
    self.now = [NSDate date];
    
    // Default
    dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.formatterBehavior = NSDateFormatterBehavior10_4;
    self.defaultIsCurrent = [[NSCalendar currentCalendar] isEqual:dateFormatter.calendar] ? @"Yes" : @"No";
    
    self.calendarIdentifierDefault = dateFormatter.calendar.calendarIdentifier;
    dateFormatter.dateFormat = self.formatDefault = @"yyyy/MM/dd HH:mm:ss zzz";
    self.formatDefaultMatch = ![dateFormatter.calendar.calendarIdentifier isEqualToString:NSJapaneseCalendar] ? @"#" : @"";
    self.formattedDefault = [dateFormatter stringFromDate:self.now];
    dateFormatter.dateFormat = self.formatDefaultA = @"GGyy/MM/dd HH:mm:ss zzz";
    self.formatDefaultMatchA = [dateFormatter.calendar.calendarIdentifier isEqualToString:NSJapaneseCalendar] ? @"#" : @"";
    self.formattedDefaultA = [dateFormatter stringFromDate:self.now];
    
    // System
    dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.calendar = [NSCalendar currentCalendar];
    dateFormatter.formatterBehavior = NSDateFormatterBehavior10_4;
    
    self.calendarIdentifierSystem = dateFormatter.calendar.calendarIdentifier;
    dateFormatter.dateFormat = self.formatSystem = @"yyyy/MM/dd HH:mm:ss zzz";
    self.formatSystemMatch = ![dateFormatter.calendar.calendarIdentifier isEqualToString:NSJapaneseCalendar] ? @"#" : @"";
    self.formattedSystem = [dateFormatter stringFromDate:self.now];
    dateFormatter.dateFormat = self.formatSystemA = @"GGGGGyy/MM/dd HH:mm:ss zzz";
    self.formatSystemMatchA = [dateFormatter.calendar.calendarIdentifier isEqualToString:NSJapaneseCalendar] ? @"#" : @"";
    self.formattedSystemA = [dateFormatter stringFromDate:self.now];
    
    // Japanese
    dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSJapaneseCalendar];
    dateFormatter.formatterBehavior = NSDateFormatterBehavior10_4;
    
    self.calendarIdentifierJapanese = dateFormatter.calendar.calendarIdentifier;
    dateFormatter.dateFormat = self.formatJapanese = @"GGyy/MM/dd HH:mm:ss zzz";
    self.formattedJapanese = [dateFormatter stringFromDate:self.now];
    dateFormatter.dateFormat = self.formatJapaneseA = @"GGGGGyy/MM/dd HH:mm:ss zzz";
    self.formattedJapaneseA = [dateFormatter stringFromDate:self.now];
    
    // Gregorian
    dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    dateFormatter.formatterBehavior = NSDateFormatterBehavior10_4;
    
    self.calendarIdentifierGregorian = dateFormatter.calendar.calendarIdentifier;
    dateFormatter.dateFormat = self.formatGregorian = @"yyyy/MM/dd HH:mm:ss zzz";
    self.formattedGregorian = [dateFormatter stringFromDate:self.now];
}

@end
