#Google Chrome Patch - OSx 10.10.2

* * *

##To Use:

Run shellscript in terminal (or app/Automator App):
	
	sh GoogleChrome-10.10.2.sh


* * *

	
##Source Tutorial:

###1) Open up text edit and paste this code - save it as "GoogleChrome-10.10.2.m"

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

###2) Run this command in Terminal

	clang -dynamiclib -framework AppKit ~/Desktop/GoogleChrome-10.10.2.m -o ~/Desktop/GoogleChrome-10.10.2.dylib

###3) Run this command in Terminal to open Chrome.

	env DYLD_INSERT_LIBRARIES=~/Desktop/GoogleChrome-10.10.2.dylib "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
	
**Notes[1]:** Replace ~/Desktop/ for location of patch files

**Notes[2]:** This will leave Terminal open in the background, do not close it or Chrome will quit out. This doesn't modify anything permanently just fixes it temporarily. To reopen chrome a second time all you have to do is repeat step 3.


###Source:

[Google Group Forum](https://productforums.google.com/forum/#!topic/chrome/ZtLAwZIhheU)