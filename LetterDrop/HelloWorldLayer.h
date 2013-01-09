//
//  HelloWorldLayer.h
//  LetterDrop
//
//  Created by Tyler Hargett on 1/5/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
 
    //graphic items
    NSMutableArray* fallingTiles;
    
    int sizeOfTiles;
    
    int clockTime;
    
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
