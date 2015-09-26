//
//  GraphicsRecipesView.m
//  ch-12-1 Drawing Simple Shapes
//
//  Created by X on 26/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "GraphicsRecipesView.h"

@implementation GraphicsRecipesView

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //Call function to draw rectangle
    [self drawRectangleAtTopOfScreen:context];
    //Call function to draw circle
    [self drawEllipse:context];
}

-(void)drawRectangleAtTopOfScreen:(CGContextRef)context
{
    CGContextSaveGState(context);
    //Set color of current context
    [[UIColor lightGrayColor] set];
    //Draw rectangle
    CGRect drawingRect = CGRectMake(0.0, 0.0f, 320.0f, 60.0f);
    CGContextFillRect(context, drawingRect);
    CGContextRestoreGState(context);
}

-(void)drawEllipse:(CGContextRef)context
{
    CGContextSaveGState(context);
    //Set color of current context
    [[UIColor whiteColor] set];
    //Draw ellipse <- I know we’re drawing a circle, but a circle is just a special ellipse.
    CGRect ellipseRect = CGRectMake(60.0f, 150.0f, 200.0f, 200.0f);
    CGContextFillEllipseInRect(context, ellipseRect);
    CGContextRestoreGState(context);
}

@end
