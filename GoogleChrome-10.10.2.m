#import <AppKit/AppKit.h>

__attribute((constructor)) void Patch_10_10_2_entry()
{
NSLog(@"10.10.2 patch loaded");
}

@interface NSTouch ()
- (id)_initWithPreviousTouch:(NSTouch *)touch newPhase:(NSTouchPhase)phase position:(CGPoint)position     isResting:(BOOL)isResting force:(double)force;
@end

@implementation NSTouch (Patch_10_10_2)
- (id)_initWithPreviousTouch:(NSTouch *)touch newPhase:(NSTouchPhase)phase position:(CGPoint)position     isResting:(BOOL)isResting
{
return [self _initWithPreviousTouch:touch newPhase:phase position:position isResting:isResting force:0];
}
@end