#import <iostream>
#import <Foundation/Foundation.h>

using namespace std;

NSMutableArray* getValues();

int pickBagWithMaxCashAndOneRope(NSMutableArray *b, NSMutableArray *r);

int getSumOfArray(NSMutableArray *array);

int main(int argc, const char * argv[]) {
    
    int myCash = 0;
    
    NSMutableArray *b = getValues();
    
    NSMutableArray *r = getValues();

    if([b count] != [r count]){
        return 401;
    }
    
    BOOL myStep = true;
    
    while(true){
        
        int m = pickBagWithMaxCashAndOneRope(b, r);
        
        if(m == 0){
            break;
        }
        
        if(myStep){
            myCash += m;
            myStep = false;
        }else{
            myStep = true;
        }
    }
    
    if(getSumOfArray(r) % 2){
        myCash +=getSumOfArray(b);
    }
    
    
    cout << "\n";
    cout << myCash << "\n";
    return 0;
}


int pickBagWithMaxCashAndOneRope(NSMutableArray *b, NSMutableArray *r){
    
    int result = 0;
    int index = 0;
    
    for(int i = 0; i < [r count]; i++){
        
        int ropeAmount = [[r objectAtIndex:i]intValue];
        int cashAmount = [[b objectAtIndex:i]intValue];
        
        if(ropeAmount == 1 && cashAmount > result){
            result = cashAmount;
            index = i;
        }
    }
    
    if(result != 0){
        [b removeObjectAtIndex:index];
        [r removeObjectAtIndex:index];
    }
    return result;
}

int getSumOfArray(NSMutableArray *array){
    
    int result = 0;
    
    for(int i = 0; i < [array count]; i++){
        
        result += [[array objectAtIndex:i]intValue];
    }
    
    return result;
}

NSMutableArray* getValues(){
    
    NSMutableString *str = [NSMutableString string];

    char value = 0;
    
    while((value = cin.get()) != '\n'){
        NSString *character = [NSString stringWithFormat:@"%c", value];
        [str appendString: character];
    }
    
    NSArray *array = [str componentsSeparatedByString:@" "];
    return [NSMutableArray arrayWithArray:array];
}
