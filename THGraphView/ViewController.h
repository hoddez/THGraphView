//
//  ViewController.h
//  THGraphView
//
//  Created by Thomas Hoddes on 2012-12-12.
//  Copyright (c) 2012 Thomas Hoddes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THGraphView.h"
@interface ViewController : UIViewController
{
    float *y;
    int offset;
}
@property (nonatomic, retain) THGraphView *graphView;

- (void)updateGraph;
@end
