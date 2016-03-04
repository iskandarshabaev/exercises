#import <Foundation/Foundation.h>

@interface List : NSObject

@property(readwrite) int value;

@property(readwrite) List *next;

-(void) insert:(int) value;

@end
