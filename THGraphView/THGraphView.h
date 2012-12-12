#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface THGraphView : UIView
{
    int numPoints;
    CGPoint *points;
}

@property (nonatomic,assign) CGColorRef strokeColor;

- (void)updateGraphWithY:(float *)y;
-(id)initWithNumPoints:(int)nP;
@end
