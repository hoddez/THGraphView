THGraphView
===========

A real-time capable view for simple lines graphs in iOS

This is a very basic start. Constant x-axis intervals are assumed so you just supply y values and the view will automatically fit the graph in the frame.

Example usage:

//init the view outside of real-time update

_graphView = [[THGraphView alloc] initWithNumPoints:NUM_POINTS];

_graphView.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);

...

//update the view, y is a float pointer with >= NUM_POINTS

[_graphView updateGraphWithY:y];

![screenshot](https://raw.github.com/hoddez/THGraphView/master/example.png)
