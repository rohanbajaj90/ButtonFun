//
//  ViewController.m
//  Button Fun
//
//  Created by Rohan Bajaj on 7/15/15.
//  Copyright (c) 2015 Rohan Bajaj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

@synthesize myGrid =_myGrid;



// Issues - Using auto-layout on UICollectionView from Storyboard / Programatically
// Partial Fix - call viewDidLoad on rotation, however, problem with upside-down potrait.



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationFade];
    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    
    layout.minimumInteritemSpacing = 2;
    layout.minimumLineSpacing = 2;
    
    _myGrid=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [_myGrid setDataSource:self];
    [_myGrid setDelegate:self];
    [_myGrid registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_myGrid setBackgroundColor:[UIColor whiteColor]];
    _myGrid.scrollEnabled = NO;
    
    [self.view addSubview:_myGrid];
    
}

// To hide status bar, additional change in PList file
- (BOOL)prefersStatusBarHidden {
    return YES;
}



// random color return
-(UIColor *)randomColor
{
    CGFloat red = arc4random() % 255 / 255.0;
    CGFloat green = arc4random() % 255 / 255.0;
    CGFloat blue = arc4random() % 255 / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    return color;
}


// return number of cells
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    return (screenHeight * screenWidth / 1600 );
}


// create random color cells
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.backgroundColor=[self randomColor];
    
    return cell;
}


// Size of each cell
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(40, 40);
}



// Change color on cell click
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath

{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:(UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [cell setBackgroundColor:[UIColor whiteColor]];
                     }
                     completion:^(BOOL finished){
                         [cell setBackgroundColor:[self randomColor]];
                     }
                ];
}


-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrient{
    
    [self viewDidLoad];
    
}


@end
