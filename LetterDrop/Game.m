//
//  Game.m
//  LetterDrop
//
//  Created by Tyler Hargett on 1/5/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "cocos2d.h"


@implementation Game

-(Game*)init{
    clockTime = 90;
    sizeOfTiles =0;
    fallingTiles = [[NSMutableArray alloc]init];
    
    return self;
}

-(void)pause{
    
}


-(void)play
{
    
    
    
    while(clockTime >0)
    {
        [self scheduleOnce:@selector(addFallingTile) delay:1.0f];
        clockTime--;
        
        for (int i = 0; i < sizeOfTiles;i++)
        {
            if ([fallingTiles[i] position].y < 100)
            {
                [self removeTile:i];
                i--;
            }
        }
        
    }
    
}

-(void)removeTile:(int)i
{
    [fallingTiles removeObjectAtIndex:i];
    sizeOfTiles--;
    
}


            
-(void)addFallingTile
{
    CGSize s = [[CCDirector sharedDirector] winSize];
    
    CCSprite *tile = [CCSprite spriteWithFile:[self randLetter]];
    int x = arc4random()%300+32;
    tile.position = ccp(x, s.height);
    [self addChild:tile];
    [tile runAction: [CCMoveBy actionWithDuration:arc4random()%2+2 position:ccp(0,-400)]];
    
    [fallingTiles addObject:tile];
    sizeOfTiles++;
}
-(NSString*)randLetter
{
    int rand = arc4random()% 100;
    
    switch (rand) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
            return @"tile1_A_67.png";
        case 9:
        case 10:
            return @"tile1_B_67.png";
        case 11:
        case 12:
            return @"tile1_C_67.png";
        case 13:
        case 14:
        case 15:
        case 16:
            return @"tile1_D_67.png";
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
            return @"tile1_E_67.png";
        case 29:
        case 30:
            return @"tile1_F_67.png";
        case 31:
        case 32:
        case 33:
            return @"tile1_G_67.png";
        case 34:
        case 35:
            return @"tile1_H_67.png";
        case 36:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 43:
        case 44:
            return @"tile1_I_67.png";
        case 45:
            return @"tile1_J_67.png";
        case 46:
            return @"tile1_K_67.png";
        case 47:
        case 48:
        case 49:
        case 50:
            return @"tile1_L_67.png";
        case 51:
        case 52:
            return @"tile1_M_67.png";
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
            return @"tile1_N_67.png";
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
            return @"tile1_O_67.png";
        case 67:
        case 68:
            return @"tile1_P_67.png";
        case 69:
            return @"tile1_Q_67.png";
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
            return @"tile1_R_67.png";
        case 76:
        case 77:
        case 78:
        case 79:
            return @"tile1_S_67.png";
        case 80:
        case 81:
        case 82:
        case 83:
        case 84:
        case 85:
            return @"tile1_T_67.png";
        case 86:
        case 87:
        case 88:
        case 89:
            return @"tile1_U_67.png";
        case 90:
        case 91:
            return @"tile1_V_67.png";
        case 92:
        case 93:
            return @"tile1_W_67.png";
        case 94:
            return @"tile1_X_67.png";
        case 95:
        case 96:
            return @"tile1_Y_67.png";
        case 97:
            return @"tile1_Z_67.png";
        case 98:
        case 99:
            return @"tile1_blank_67.png";
            
        default:
            return @"tile1_blank_67.png";
            break;
    }
}



@end
