//
//  GraphCell.h
//  SimpleGraph
//
//  Created by Roll Development on 3/14/14.
//  Copyright (c) 2014 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraphCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UILabel *xLabel;
@property (nonatomic, weak) IBOutlet UILabel *yLabel;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *heightConstraint;

@end
