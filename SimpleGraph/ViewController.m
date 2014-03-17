//
//  ViewController.m
//  SimpleGraph
//
//  Created by Roll Development on 3/14/14.
//  Copyright (c) 2014 Demo. All rights reserved.
//

#import "ViewController.h"
#import "GraphCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	self.graphData = [NSMutableArray new];
	
	for (int i=0; i < 100; i++)
	{
		NSDateFormatter *df = [NSDateFormatter new];
		df.dateFormat = @"EEE";
		
		NSDateComponents *dc = [NSDateComponents new];
		dc.day = i;
		
		NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dc toDate:[NSDate date] options:0];
		
		NSDictionary *dict = @{@"x": [df stringFromDate:date],
							   @"y": [NSNumber numberWithUnsignedInteger:arc4random_uniform(100)+20]
							   };
		[self.graphData addObject:dict];
	}

}

#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return [self.graphData count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	GraphCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GraphCell" forIndexPath:indexPath];
	

	cell.xLabel.text = [self.graphData[indexPath.item][@"x"] uppercaseString];	

	cell.yLabel.text = [self.graphData[indexPath.item][@"y"] stringValue];
	

	// cell size is still undefined when animation starts, so force it to layout now
	[cell layoutIfNeeded];
	
	
	
	// ?????????????????
	// cant figure out why need this
	NSArray *cc = cell.imageView.constraints;
	[cell.imageView removeConstraints:cell.imageView.constraints];
	[cell.imageView addConstraints:cc];
	

	
	cell.heightConstraint.constant = 10;
	
	[cell.imageView layoutIfNeeded];	// draws the bar at starting point
	
	[cell.yLabel layoutIfNeeded];		// draws y label at starting point

	
	// set the place to animate to
	
	cell.heightConstraint.constant = [self.graphData[indexPath.item][@"y"] floatValue];
	[cell.imageView setNeedsUpdateConstraints];
	
	

//	NSLog(@"%@", cell.imageView.constraints);

	

	[UIView animateWithDuration:3.0
						  delay:0.0
		 usingSpringWithDamping:0.5
		  initialSpringVelocity:5.0
						options:(UIViewAnimationOptionCurveLinear)
					 animations:^{
						 
						 
						 // anmiate these views with the new constraints
						 [cell.imageView layoutIfNeeded];
						 [cell.yLabel layoutIfNeeded];
	}
					 completion:^(BOOL finished) {

	}];

	
	return cell;
}

@end
