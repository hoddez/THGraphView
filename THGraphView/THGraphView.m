//
//  THGraphView.m
//  THGraphView
//
//  Created by Thomas Hoddes on 2012-12-12.
//  Copyright (c) 2012 Thomas Hoddes. All rights reserved.
//



#import "THGraphView.h"

@implementation THGraphView

-(id)initWithNumPoints:(int)nP
{
    self = [super init];
    if(self != nil)
    {
        points = malloc(sizeof(CGPoint)*nP*2);
        numPoints = nP;
        _strokeColor = [[UIColor blackColor] CGColor];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)dealloc
{
    
	[super dealloc];
}

//Used to update the graph points and redraw
- (void)updateGraphWithY:(float *)y
{
    float xDelta = self.frame.size.width/(numPoints-1);
    
    //default max on the y axis is set with a lower bound of 0.000001 (effectively 0, avoiding divByZero)
    float max = 0.000001;
    //default min on the y axis is set with an upper bound of 0
    float min = 0;
    
    //Check for better max/min
    for (int i=0; i<numPoints; i++) {
        if(y[i]>max)
            max = y[i];
        if(y[i]<min)
            min = y[i];
    }
    float viewHeight = self.frame.size.height;
    float yScale = viewHeight/(max-min);

    //generate points scaled to fit the frame
    for(int i=0;i<numPoints;i++)
    {
        points[i*2] = CGPointMake(i*xDelta, viewHeight-yScale*(y[i]-min));
        points[i*2+1] = CGPointMake((i+1)*xDelta, viewHeight-yScale*(y[i+1]-min));
    }
    
    [self setNeedsDisplay];
}

//Override UIView's drawRect to draw a graph with Core Graphics
-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //Drawing the graph
    
	CGContextSetStrokeColorWithColor(context, _strokeColor);
	CGContextStrokeLineSegments(context, points, numPoints*2);
}




@end

