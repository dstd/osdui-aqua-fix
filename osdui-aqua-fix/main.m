//
//  osdui-aqua-fix
//
//  Created by Denis Stanishevskiy on 09.09.2020.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import <OSD/OSDManager.h>

int main(int argc, const char * argv[]) {
    system("killall -9 OSDUIHelper 2> /dev/null");
    system("defaults write -g NSRequiresAquaSystemAppearance -bool NO");

    CGDirectDisplayID currentDisplayId = [NSScreen.mainScreen.deviceDescription[@"NSScreenNumber"] unsignedIntValue];
    [OSDManager.sharedManager showImage:0 onDisplayID:currentDisplayId priority:0x1F4 msecUntilFade:100 withText:@"Fixed"];
    usleep(500000);

    system("defaults write -g NSRequiresAquaSystemAppearance -bool YES > /dev/null");

    return 0;
}
