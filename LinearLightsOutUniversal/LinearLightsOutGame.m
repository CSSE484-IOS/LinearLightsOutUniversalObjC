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
    return NO;
}
- (BOOL) isLightOnAtIndex:(NSInteger) lightIndex {
    return NO;
}
- (BOOL) checkForWin {
    return NO;
}

@end

//import Foundation
//
//class LinearLightsOutGame: CustomStringConvertible {
//    var movesTaken: Int
//    var numLights: Int
//    var lightStates: [Bool]
//
//    init(numLights: Int) {
//        movesTaken = 0
//        self.numLights = numLights
//        lightStates = [Bool](repeating: true, count: numLights)
//        initLightStates(numLights)
//    }
//
//    func initLightStates(_ numLights: Int) {
//        for index in 0..<numLights {
//            let randomNumber : Int = Int(arc4random_uniform(UInt32(2)))
//            lightStates[index] = randomNumber == 1
//        }
//    }
//
//    func pressedLightAtIndex(_ index: Int) -> Bool {
//        if checkForWin() {
//            return true
//        }
//        lightStates[index] = !lightStates[index]
//        if index > 0 {
//            lightStates[index - 1] = !lightStates[index - 1]
//        }
//        if index < numLights - 1 {
//            lightStates[index + 1] = !lightStates[index + 1]
//        }
//        movesTaken += 1
//        return checkForWin()
//    }
//
//    func checkForWin() -> Bool {
//        for isOn in lightStates {
//            if isOn {
//                return false
//            }
//        }
//        return true
//    }
//
//    func getLightsString() -> String {
//        var lightsString = ""
//        for state in lightStates {
//            lightsString += state ? "1" : "0"
//        }
//        return lightsString
//    }
//
//    var description: String {
//        return "Lights: \(getLightsString()) Moves: \(movesTaken)"
//    }
//}
