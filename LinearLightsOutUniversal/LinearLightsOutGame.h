//
//  LinearLightsOutGame.h
//  LinearLightsOutUniversal
//
//  Created by FengYizhi on 2018/4/2.
//  Copyright © 2018年 FengYizhi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAX_NUM_LIGHTS 100

@interface LinearLightsOutGame : NSObject {
    BOOL lightStates[MAX_NUM_LIGHTS];
}

@property (nonatomic) NSInteger numLights;
@property (nonatomic) NSInteger movesTaken;

- (id) initWithNumLights:(NSInteger) numLights;
- (BOOL) pressedLightAtIndex:(NSInteger) lightIndex;
- (BOOL) isLightOnAtIndex:(NSInteger) lightIndex;
- (BOOL) checkForWin;

@end
