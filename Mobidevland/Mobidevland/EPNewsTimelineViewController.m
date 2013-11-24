//
//  EPNewsTimelineViewController.m
//  Mobidevland
//
//  Created by Francis Visoiu Mistrih on 23/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import "EPNewsTimelineViewController.h"

@interface EPNewsTimelineViewController ()

@end

@implementation EPNewsTimelineViewController {
    NSMutableArray *dataArray;
}

@synthesize newsTableView;
@synthesize carousel;

- (void)awakeFromNib {
    
    dataArray = [EPTools newsArray];
}

- (void)viewDidLoad
{
    newsTableView.dataSource = self;
    newsTableView.delegate = self;
    
    carousel.type = iCarouselTypeLinear;
    [carousel setPagingEnabled:YES];
    [carousel setBackgroundColor:[UIColor colorWithRed:229.0/255 green:229.0/255 blue:229.0/255 alpha:1.0]];
   [super viewDidLoad];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [newsTableView addSubview:refreshControl];
}

-(void)refresh:(UIRefreshControl *)refreshControl {
    [EPTools reloadNewsArray];
    refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"Refreshing..."];
    NSDateFormatter *formattedDate = [[NSDateFormatter alloc]init];
    [formattedDate setDateFormat:@"MMM d, h:mm a"];
    NSString *lastupdated = [NSString stringWithFormat:@""];
    refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:lastupdated];
    [refreshControl endRefreshing];
    dataArray = [EPTools newsArray];
    [newsTableView reloadData];
    [carousel reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BOOL isEven = (indexPath.row % 2 == 0);
    
    EPNewsTimelineCell *cell = (EPNewsTimelineCell *)[tableView dequeueReusableCellWithIdentifier:@"NewsTimelineCell"];
    
    if (isEven) {
        [cell setBackgroundColor:[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1]];
    }
    else
    {
        [cell setBackgroundColor:[UIColor colorWithRed:228.0/255 green:228.0/255 blue:228.0/255 alpha:1]];
    }
    
    PFObject *object = [dataArray objectAtIndex:indexPath.row];
    NSString *title = object[@"title"];
    NSString *description = object[@"description"];
    NSString *htmlURL = object[@"htmlURL"];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd-MM-yyy"];
    NSString *date = [df stringFromDate:object[@"date"]];
    
    NSString *imagePath = [NSString stringWithFormat:@"%@_big@2x.png",object[@"imageURL"]];
    NSURL *url = [NSURL URLWithString:imagePath];
    NSError* error = nil;
    UIImage *image;
    NSData* data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
    if (error) {
        image = [UIImage imageNamed:@"place_holder_big"];
        NSLog(@"Image not found.");
        
    } else {
        image = [UIImage imageWithData:data];
    }
    
    [cell.titleLabel setText:title];
    [cell.descriptionLabel setText:description];
    [cell.dateLabel setText:date];
    [cell.imgView setImage:image];
    cell.htmlURL = htmlURL;
    cell.objectID = object.objectId;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [carousel scrollToItemAtIndex:indexPath.row animated:YES];
}

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    
    return [dataArray count];
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel {

    return 0;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view {
    
    PFObject *object = [dataArray objectAtIndex:index];
    NSString *imagePath = [NSString stringWithFormat:@"%@_big@2x.png",object[@"imageURL"]];
    NSURL *url = [NSURL URLWithString:imagePath];
    NSError* error = nil;
    UIImage *image;
    NSData* data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
    if (error) {
        image = [UIImage imageNamed:@"place_holder_big"];
        NSLog(@"Image not found.");
        
    } else {
        image = [UIImage imageWithData:data];
    }
    
    image = [EPTools imageWithImage:image scaledToSize:CGSizeMake(70, 70)];
    UIView *imageView = [[UIImageView alloc] initWithImage:image];
    
    return imageView;
}

- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
    return 0;
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    //usually this should be slightly wider than the item views
    return 100;
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    //wrap all carousels
    return NO;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    //add code when cell is selected
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EPNewsTimelineCell *cell = (EPNewsTimelineCell*)sender;
    EPNewsItem *newsItem = [[EPNewsItem alloc] initWithDate:[cell dateLabel].text title:[cell titleLabel].text image:[cell imgView].image htmlURL:[cell htmlURL] objectID:[cell objectID]];
    
    EPNewsDetailViewController *destination = segue.destinationViewController;
    
    destination.newsItem = newsItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
