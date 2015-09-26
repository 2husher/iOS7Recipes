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

    //Call function to draw triangle
    [self drawTriangle:context];

    //Call function to draw arc
    [self drawArc:context];

    //Call function to draw text
    [self drawTextAtTopOfScreen:context];
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

    //Set shadow and color of shadow
    CGContextSetShadowWithColor(context, CGSizeZero, 10.0f, [[UIColor blackColor] CGColor]);

    //Set color of current context
    [[UIColor whiteColor] set];

    //Draw ellipse <- I know we’re drawing a circle, but a circle is just a special ellipse.
    CGRect ellipseRect = CGRectMake(60.0f, 150.0f, 200.0f, 200.0f);
    CGContextFillEllipseInRect(context, ellipseRect);

    CGContextRestoreGState(context);
}

-(void)drawTriangle:(CGContextRef)context
{
    CGContextSaveGState(context);

    //Set color of current context
    [[UIColor colorWithRed:0.80f
                     green:0.85f
                      blue:0.95f
                     alpha:1.0f] set];

    // Draw Triangle
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 140.0f, 380.0f);
    CGContextAddLineToPoint(context, 190.0f, 400.0f);
    CGContextAddLineToPoint(context, 140.0f, 420.0f);
    CGContextClosePath(context);
    CGContextSetGrayFillColor(context, 0.1f, 0.85f);
    CGContextSetGrayStrokeColor(context, 0.0, 0.0);
    CGContextFillPath(context);

    CGContextRestoreGState(context);
}

-(void)drawArc:(CGContextRef)context
{
    CGContextSaveGState(context);

    //Set color of current context
    [[UIColor colorWithRed:0.30f
                     green:0.30f
                      blue:0.30f
                     alpha:1.0f] set];

    //Draw Arc
    CGContextAddArc(context, 160.0f, 250.0f, 70.0f, 0.0f, 3.14, 0);
    CGContextSetLineWidth(context, 50.0f);
    CGContextDrawPath(context, kCGPathStroke);

    CGContextRestoreGState(context);
}

-(void)drawTextAtTopOfScreen:(CGContextRef)context
{
    CGContextSaveGState(context);

    //Create UIColor to pass into text attributes
    UIColor *textColor = [UIColor colorWithRed:0.80f
                                         green:0.85f
                                          blue:0.95f
                                         alpha:1.0f];

    //Set shadow and color of shadow
    CGContextSetShadowWithColor(context, CGSizeZero, 10.0f, [[UIColor blackColor] CGColor]);

    //Set font
    UIFont *customFont = [UIFont fontWithName:@"OleoScriptSwashCaps-Bold"
                                         size:40.0f ];
    //UIFont *customFont = [UIFont systemFontOfSize:20.0f];
    NSString *titleText = @"iOS Recipes!";
    [titleText drawAtPoint:CGPointMake(55,5)
            withAttributes:@{
                             NSFontAttributeName:customFont,
                             NSForegroundColorAttributeName:textColor
                             }];

    CGContextRestoreGState(context);
}

@end
