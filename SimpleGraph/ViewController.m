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
	
	for (int i=0; i < 30; i++)
	{
		NSDateFormatter *df = [NSDateFormatter new];
		df.dateFormat = @"EEE";
		
		NSDateComponents *dc = [NSDateComponents new];
		dc.day = i;
		
		NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dc toDate:[NSDate date] options:0];
		
		NSDictionary *dict = @{@"x": [df stringFromDate:date],
							   @"y": [NSNumber numberWithUnsignedInteger:arc4random_uniform(100)]
							   };
		[self.graphData addObject:dict];
	}
	
	NSLog(@"count %zd", [self.graphData count]);
	

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
	
//	[cell.imageView setTranslatesAutoresizingMaskIntoConstraints:NO];

	[cell layoutIfNeeded];
	
	
/*
	cell.heightConstraint.constant = 10;
	[cell.imageView layoutIfNeeded];
*/
	
	cell.heightConstraint.constant = [self.graphData[indexPath.item][@"y"] floatValue];
	[cell.imageView setNeedsUpdateConstraints];


	[cell.imageView layoutIfNeeded];
	
	NSLog(@"%@", cell.imageView.constraints);
	NSLog(@"%@", cell.constraints);
	
/*
	[UIView animateWithDuration:3.0
						  delay:0.0
		 usingSpringWithDamping:0.5
		  initialSpringVelocity:5.0
						options:(UIViewAnimationOptionCurveLinear)
					 animations:^{
							[cell.imageView layoutIfNeeded];
	}
					 completion:^(BOOL finished) {

	}];
*/
	
	return cell;
}

@end
