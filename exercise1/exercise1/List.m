#import "List.h"

@implementation List

-(void) insert:(int) value
{
    List *list = [[List alloc]init];
    list.value = value;
    list.next = self;
    
    if(_next == nil){
        _next = list;
        return;
    }

    List *dx = _next;
    List *px = _next;
    
    while (dx != self && dx.value<=value)
        
    {
        px = dx;
        dx =dx.next;
    }
    
    if (dx==self) px.next = list;
    else {
        list.next = dx;
        if (dx== self.next) self.next = list;
        else px.next = list;
    }
}

@end
