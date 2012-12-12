//
//  ViewController.m
//  THGraphView
//
//  Created by Thomas Hoddes on 2012-12-12.
//  Copyright (c) 2012 Thomas Hoddes. All rights reserved.
//

#import "ViewController.h"
#import "THGraphView.h"
#define NUM_POINTS 500
@interface ViewController ()

@end

@implementation ViewController

- (void) updateGraph
{
    NSLog(@"test");
    for(int i=0;i<NUM_POINTS;i++)
    {
        y[i]=sin((2.0*M_PI*i+offset)/NUM_POINTS);
    }
    offset++;
    [_graphView updateGraphWithY:y];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _graphView = [[THGraphView alloc] initWithNumPoints:NUM_POINTS];
    _graphView.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
    [self.view addSubview:_graphView];
    y = malloc(sizeof(float)*NUM_POINTS);
    offset = 0;
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateGraph) userInfo:nil repeats:YES];
}

- (void) dealloc
{
    [_graphView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
