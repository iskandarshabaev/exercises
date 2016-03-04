#import <iostream>
#import <Foundation/Foundation.h>

using namespace std;

NSMutableArray* getValues();

void printError();

BOOL checkInput(NSMutableArray *x,
                NSMutableArray *y,
                int p, int min);

int main(int argc, const char * argv[]) {
    
    int col = 0;
    int min = 0;
    int max = 0;
    int p;
    
    NSMutableArray *x = getValues();
    
    NSMutableArray *y = getValues();
    
    cin>>p;

    min = [[y objectAtIndex:0]intValue];
    
    if(!checkInput(x,y,p,min)) return 2;
    for(int i = p; i>0; i--){
        col = i;
        BOOL valid = true;
        for(int j = 0; j < [x count]; j++){
            
            int getOut = [[y objectAtIndex:j]intValue];
            int getIn = [[x objectAtIndex:j]intValue];
            col -= getOut;
            col += getIn;
            
            if(getOut > p || getIn > p){
                printError();
                return 2;
            }
            
            if(col > p){
                valid = false;
                break;
            }
        }
        if(valid){
            max = i;
            break;
        }
    }
    
    
    cout << "\n";
    cout << min <<" " << max;
    cout << "\n";
    return 0;
}

BOOL checkInput(NSMutableArray *x,
                NSMutableArray *y,
                int p, int min){
    
    if([x count] != [y count] || min < 0)
    {
        printError();
        return false;
    }
    
    int count = min;
    for(int j = 0; j < [x count]; j++){
        int getOut = [[y objectAtIndex:j]intValue];
        int getIn = [[x objectAtIndex:j]intValue];
        count -= getOut;
        count += getIn;

        
        if(getOut > p || getIn > p || count > p){
            printError();
            return false;
        }
    }
    return true;
}

void printError(){
    cout << "\n";
    cout << "0 0";
    cout << "\n";
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
