//
//  HelloWorldLayer.m
//  LetterDrop
//
//  Created by Tyler Hargett on 1/5/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"



#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer



// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		self.isTouchEnabled=YES;
        CGSize s = [[CCDirector sharedDirector] winSize];
        
        clockTime = 10;
        sizeOfTiles =0;
        fallingTiles = [[NSMutableArray alloc]init];
        
        
        CCSprite *bg = [CCSprite spriteWithFile:@"woodbackground_1.png"];
        bg.position = ccp(s.width/2, s.height/2);
    
        [self addChild:bg];
        
        CCLOG(@"loaded background");
        
	}
    
    
    CCLOG(@"game created");
    [self play];
    
    
	return self;
}
-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    for (int i =0; i <sizeOfTiles; i++) 
    {
        if(CGRectContainsPoint([[self getChildByTag:i] boundingBox], location))
        {
            CCLOG(@"touched Letter: it hit, at: %0.2f, y:%0.2f" , location.x, location.y);
            [[self getChildByTag:i] runAction:[CCHide action]];
            
        }
        else
            CCLOG(@"missed Letter: it missed, at: %0.2f, y:%0.2f" , location.x, location.y);
    }
    
}

-(void)fallingLetters
{
    CGSize s = [[CCDirector sharedDirector] winSize];
    
    //NSMutableArray* tileList = [[CCSprite alloc] init];
    
    
    
    CCSprite *tile = [CCSprite spriteWithFile:[self randLetter]];
    tile.position = ccp(s.width/2, s.height);
    [self addChild:tile];
    tile.tag = 1;
    
    [tile runAction:[CCMoveBy actionWithDuration:2 position:ccp(0, -400)]];
    
     
     
}

-(void)play
{
  
        while (clockTime > 0) {
        clockTime--;
   
        [self schedule:@selector(addFallingTile:) interval:1.0f];
        
    }
    
}

-(void)removeTile:(int)i
{
    [[fallingTiles objectAtIndex:i] dealloc];
    
    
}



-(void)addFallingTile:(ccTime) dt
{
    sleep(1);
    CGSize s = [[CCDirector sharedDirector] winSize];
    
    NSString* letter = [self randLetter];
    CCSprite *tile = [CCSprite spriteWithFile:letter];
    CCLOG(letter);
    
    int x = arc4random()%300+32;
    tile.position = ccp(x, s.height);
    [self addChild:tile];
    tile.tag = sizeOfTiles +1;
    CCLOG(@"show falling label");
    
    //[tile runAction: [CCMoveBy actionWithDuration:arc4random()%5+2 position:ccp(0,-400)]];
    
    id moveAction = [CCMoveBy actionWithDuration:arc4random()%5+2 position:ccp(0,-400)];
    id hideAction = [CCHide action];
    
    [tile runAction:[CCSequence actions:moveAction,hideAction, nil]];
    
    
    [fallingTiles addObject:tile];
    sizeOfTiles++;
    
    
    
}
-(NSString*)randLetter
{
    int rand = arc4random()% 100;
    CCLOG(@"random number is : %0i", rand);
    
    
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
            return @"tile1_A_67.png";
            break;
    }
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
