//
//  LinearLightsOutGame.m
//  LinearLightsOutUniversal
//
//  Created by FengYizhi on 2018/4/2.
//  Copyright © 2018年 FengYizhi. All rights reserved.
//

#import "LinearLightsOutGame.h"\

@implementation LinearLightsOutGame

- (id) initWithNumLights:(NSInteger) numLights {
    self = [super init];
    if (self) {
        self.numLights = numLights;
        self.movesTaken = 0;
        [self initLightStates];
    }
    return self;
}

- (void) initLightStates {
    for (int i=0; i<self.numLights; i++) {
        int r = arc4random_uniform(2);
        lightStates[i] = r == 1;
    }
}

- (BOOL) pressedLightAtIndex:(NSInteger) lightIndex {
    if ([self checkForWin]) {
        return YES;
    }
    lightStates[lightIndex] = !lightStates[lightIndex];
    if (lightIndex > 0) {
        lightStates[lightIndex - 1] = !lightStates[lightIndex - 1];
    }
    if (lightIndex < self.numLights - 1) {
        lightStates[lightIndex + 1] = !lightStates[lightIndex + 1];
    }
    self.movesTaken++;
    return [self checkForWin];
}

- (BOOL) isLightOnAtIndex:(NSInteger) lightIndex {
    return lightStates[lightIndex];
}

- (BOOL) checkForWin {
    for (int i = 0; i < self.numLights; i++) {
        if (lightStates[i]) {
            return NO;
        }
    }
    return YES;
}

- (NSString*) description {
    NSMutableString* gameStateString = [[NSMutableString alloc] init];
    [gameStateString appendString:@"Lights: "];
    for (int i = 0; i < self.numLights; i++) {
        [gameStateString appendString:lightStates[i] ? @"1" : @"0"];
    }
    [gameStateString appendString:[NSString stringWithFormat:@" Moves: %d", (int)self.movesTaken]];
    return gameStateString;
}

@end
