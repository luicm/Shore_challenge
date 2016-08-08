//
//  ViewController.m
//  InterviewTest
//
//  Created by Alessandro Pricci on 11/02/16.
//  Copyright © 2016 Shore GmbH. All rights reserved.
//

#import "ViewController.h"
#import "FlickrKit.h"
#import "FlickrCell.h"
#import "UIImageView+AFNetworking.h"

#import "InterviewTest-Swift.h"



@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,PhotosListPresentable>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) FlickrPhotosPresenter *presenter;
@property (nonatomic, strong) FlickrPhoto *selectedPhoto;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.collectionView registerNib:[UINib nibWithNibName:@"FlickrCell" bundle:nil] forCellWithReuseIdentifier:@"FlickrCell"];

    self.presenter = [[FlickrPhotosPresenter alloc] initWithDelegate:self];
    [self.presenter loadImages];
    
    self.title = @"Nice List";
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.presenter.photos.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FlickrPhoto *photo  = [self.presenter photoForIndex:indexPath.row];

    FlickrCell *cell     = [collectionView dequeueReusableCellWithReuseIdentifier:@"FlickrCell" forIndexPath:indexPath];
    
    [cell.imageView setImageWithURL:photo.thubmnailURL];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedPhoto = [self.presenter photoForIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"ShowDetailSegue" sender:self];
}

- (void)photosListDidUpdate:(NSArray<FlickrPhoto *> *)photos {
    [self.collectionView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowDetailSegue"]) {
        
        DetailViewController *detail = (DetailViewController *)segue.destinationViewController;
        detail.photo = self.selectedPhoto;
    }
}

@end
