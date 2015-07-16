//
//  ViewController.h
//  Button Fun
//
//  Created by Rohan Bajaj on 7/15/15.
//  Copyright (c) 2015 Rohan Bajaj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong,nonatomic) IBOutlet UICollectionView * myGrid;


@end

