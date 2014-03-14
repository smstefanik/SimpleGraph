//
//  ViewController.h
//  SimpleGraph
//
//  Created by Roll Development on 3/14/14.
//  Copyright (c) 2014 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic,strong) NSMutableArray *graphData;

@property (nonatomic,strong) IBOutlet UICollectionView *collectionView;

@end
