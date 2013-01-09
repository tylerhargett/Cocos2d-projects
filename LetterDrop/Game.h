//
//  Game.h
//  LetterDrop
//
//  Created by Tyler Hargett on 1/5/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Game : CCNode {
    
    
    //graphic items
    NSMutableArray* fallingTiles;
    
    int sizeOfTiles;
    
    int clockTime;
    
    
}
-(NSString*)randLetter;
-(void)play;
-(Game*)init;
-(void)removeTile;
-(void)pause;



@end
