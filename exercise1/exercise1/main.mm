#import <iostream>
#import <Foundation/Foundation.h>
#import "List.h"

using namespace std;

int main(int argc, const char * argv[]) {
    
    
    List *list = [[List alloc] init];

    int value;
    
    while(cin>>value){
        [list insert:value];
    }
     
    cout << "\n";
    
    List *pointer = list;
    while(pointer.next != list){
        pointer = pointer.next;
        cout << pointer.value<<" ";
    }
    
    cout << "\n";
    return 0;
}

