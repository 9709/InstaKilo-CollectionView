//
//  ViewController.m
//  InstaKilo
//
//  Created by Matthew Chan on 2019-01-23.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

#import "ViewController.h"
#import "PhotoData.h"
#import "MyCollectionViewCell.h"
#import "MyHeaderView.h"

@interface ViewController () <UICollectionViewDataSource>

// Outlet for CollectionView
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

// Properties for FlowLayout
@property (nonatomic, strong) UICollectionViewFlowLayout *standardLayout;

@property (nonatomic, strong) NSMutableArray *listOfImages;
@property (nonatomic, strong) NSMutableArray *uniqueSubjects;


@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // we are the datasource for the collectionView (sending the buisiness card)
    self.collectionView.dataSource = self;
    
    // Create and setup all properties of layout object
    [self setupStandardLayout];
    
    // MUST DO:  Assigning the layout to the collection
    self.collectionView.collectionViewLayout = self.standardLayout;
    
    // Setting up array of image objects
    PhotoData *photoData1 = [[PhotoData alloc] initWithImageName:[UIImage imageNamed:@"Animal"] andSubject:@"Animal" andLocation:@"Hong Kong"];
    PhotoData *photoData2 = [[PhotoData alloc] initWithImageName:[UIImage imageNamed:@"Bike"] andSubject:@"Wheels" andLocation:@"Vancouver"];
    PhotoData *photoData3 = [[PhotoData alloc] initWithImageName:[UIImage imageNamed:@"Building"] andSubject:@"Buildings" andLocation:@"Victoria"];
    PhotoData *photoData4 = [[PhotoData alloc] initWithImageName:[UIImage imageNamed:@"Building2"] andSubject:@"Buildings" andLocation:@"White Rock"];
    PhotoData *photoData5 = [[PhotoData alloc] initWithImageName:[UIImage imageNamed:@"Car"] andSubject:@"Wheels" andLocation:@"Vancouver"];
    PhotoData *photoData6 = [[PhotoData alloc] initWithImageName:[UIImage imageNamed:@"Car2"] andSubject:@"Wheels" andLocation:@"Richmond"];
    PhotoData *photoData7 = [[PhotoData alloc] initWithImageName:[UIImage imageNamed:@"Car3"] andSubject:@"Wheels" andLocation:@"Richmond"];
    PhotoData *photoData8 = [[PhotoData alloc] initWithImageName:[UIImage imageNamed:@"Event"] andSubject:@"Events" andLocation:@"Vancouver"];
    PhotoData *photoData9 = [[PhotoData alloc] initWithImageName:[UIImage imageNamed:@"Event2"] andSubject:@"Events" andLocation:@"Vancouver"];
    PhotoData *photoData10 = [[PhotoData alloc] initWithImageName:[UIImage imageNamed:@"Event3"] andSubject:@"Events" andLocation:@"Whistler"];
    PhotoData *photoData11 = [[PhotoData alloc] initWithImageName:[UIImage imageNamed:@"Food"] andSubject:@"Foods" andLocation:@"White Rock"];
    PhotoData *photoData12 = [[PhotoData alloc] initWithImageName:[UIImage imageNamed:@"Nature"] andSubject:@"Natures" andLocation:@"Vancouver Island"];
    PhotoData *photoData13 = [[PhotoData alloc] initWithImageName:[UIImage imageNamed:@"Nature2"] andSubject:@"Events" andLocation:@"Vancouver Island"];
    PhotoData *photoData14 = [[PhotoData alloc] initWithImageName:[UIImage imageNamed:@"Nature3"] andSubject:@"Events" andLocation:@"Whistler"];
    PhotoData *photoData15 = [[PhotoData alloc] initWithImageName:[UIImage imageNamed:@"People"] andSubject:@"People" andLocation:@"Richmond"];
    
    self.listOfImages = [@[
                            photoData1, photoData2, photoData3, photoData4, photoData5, photoData6, photoData7, photoData8, photoData9, photoData10, photoData11, photoData12, photoData13, photoData14, photoData15
                            ] mutableCopy];
                         
        
    
    for (int x=0; x < self.listOfImages.count; x++)
    {
        PhotoData *photoData = self.listOfImages[x]; //photo 1
        NSMutableArray *uniqueSubejcts = self.uniqueSubjects; //[]
        NSString *subject = photoData.subject; // "animal"
        NSLog(@"%@", uniqueSubejcts);
//        if (photo1 has subject-"animal", then add subject-"animal" to uniqueSubejcts.  Otherwise, check photo2)
        
        if ([uniqueSubejcts containsObject:subject] == YES )
        {
            return;
        } else
        {
            [uniqueSubejcts addObject:subject];
        }
    }
    
}

// ============================================================================================================================

// Custom function to create and setup all properties of layout object (will be called in viewDidLoad)
- (void) setupStandardLayout
{
    self.standardLayout = [[UICollectionViewFlowLayout alloc] init];
    
    self.standardLayout.itemSize = CGSizeMake(123, 123);
    self.standardLayout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
    self.standardLayout.minimumLineSpacing = 2;
    self.standardLayout.minimumInteritemSpacing = 2;
    self.standardLayout.headerReferenceSize = CGSizeMake(CGRectGetWidth(self.collectionView.frame), 25);
    self.standardLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
}


// Mark: UICollectionViewDataSource properocol methods ========================================================================

// MUST HAVE: 1of2 protocol methods
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
        NSLog(@"%li", indexPath.row);
    PhotoData *photoData = self.listOfImages[indexPath.row];
    [cell addImageFrom:photoData];
    
    return cell;
}


// MUST HAVE: 1of2 protocol methods
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 4;
        case 2:
            return 2;
        case 3:
            return 5;
        case 4:
            return 1;
        case 5:
            return 1;
        case 6:
            return 1;
        default:
            return 15;
    }
}

// Setting Number of Sections
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 7;
}

// Creating header
- (UICollectionReusableView *)collectionView: (UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(nonnull NSString *)kind
                                 atIndexPath:(nonnull NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        MyHeaderView *headerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MyHeaderView" forIndexPath:indexPath];
     
        NSLog(@"header: %li", (long)indexPath.section);
        
        [headerView addHeaderTitleFrom:self.uniqueSubjects[indexPath.section]];
        return headerView;
    } else {
        return nil;
    }
}



@end
