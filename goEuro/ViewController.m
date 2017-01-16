//
//  ViewController.m
//  goEuro
//
//  Created by guzzle developer on 1/16/17.
//  Copyright © 2017 goEuro developer. All rights reserved.
//

#import "ViewController.h"
#import "FlightViewController.h"
#import "BusViewController.h"
#import "TrainViewController.h"
#import "DZNSegmentedControl.h"

@interface ViewController ()<CAPSPageMenuDelegate,DZNSegmentedControlDelegate>
{
    CAPSPageMenu *pageMenu;
    DZNSegmentedControl *segmentControl;

}
@property (weak, nonatomic) IBOutlet UIView *sortingView;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self populateViewControllers];
    [self populateSortingOptions];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)populateViewControllers
{
    NSMutableArray *controllerArray = [NSMutableArray new];
    FlightViewController *flightVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FlightViewController"];
    flightVC.title = @"Flight";

    TrainViewController *trainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TrainViewController"];
    trainVC.title = @"Train";

    BusViewController *busVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BusViewController"];
    busVC.title = @"Bus";
    [controllerArray addObject:flightVC];
    [controllerArray addObject:trainVC];
    [controllerArray addObject:busVC];

    NSDictionary *parameters = @{CAPSPageMenuOptionMenuItemSeparatorWidth: @(4.3),
                                 CAPSPageMenuOptionUseMenuLikeSegmentedControl: @(YES),
                                 CAPSPageMenuOptionScrollMenuBackgroundColor: UIColorFromRGB(guzzle_border),
                                 CAPSPageMenuOptionViewBackgroundColor: UIColorFromRGB(guzzle_border),
                                 CAPSPageMenuOptionSelectionIndicatorColor: UIColorFromRGB(goeuro_blue),
                                 CAPSPageMenuOptionSelectedMenuItemLabelColor:UIColorFromRGB(goeuro_blue),
                                 CAPSPageMenuOptionMenuItemSeparatorColor:UIColorFromRGB(goeuro_blue),
                                 CAPSPageMenuOptionUnselectedMenuItemLabelColor:[UIColor darkGrayColor],
                                 CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor whiteColor],
                                 CAPSPageMenuOptionMenuItemFont: [UIFont systemFontOfSize:14],
                                 CAPSPageMenuOptionMenuHeight: @(40.0),
                                 CAPSPageMenuOptionMenuItemWidth: @(90.0),
                                 CAPSPageMenuOptionCenterMenuItems: @(YES),
                                 CAPSPageMenuOptionEnableHorizontalBounce:@(YES),
                                 CAPSPageMenuOptionMenuItemSeparatorPercentageHeight: @(1.0)
                                 };
    pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0.0, 64.0, self.view.frame.size.width, self.view.frame.size.height-64-70) options:parameters];
    pageMenu.enableHorizontalBounce = YES;
    [self.view addSubview:pageMenu.view];
}

-(void)populateSortingOptions
{
    NSArray *items = @[@"Departure", @"Arrival" , @"Distance"];
    segmentControl = [[DZNSegmentedControl alloc] initWithItems:items];
    segmentControl.delegate = self;
    segmentControl.selectedSegmentIndex = 0;
    segmentControl.bouncySelectionIndicator = YES;
    segmentControl.showsGroupingSeparators = YES;
    segmentControl.inverseTitles = YES;
    segmentControl.backgroundColor = [UIColor clearColor];
    segmentControl.hairlineColor = [UIColor whiteColor];
    segmentControl.tintColor = [UIColor whiteColor];
    segmentControl.showsCount = NO;
    segmentControl.autoAdjustSelectionIndicatorWidth = NO;
    segmentControl.selectionIndicatorHeight = 4.0;
    segmentControl.adjustsFontSizeToFitWidth = NO;
    segmentControl.frame=CGRectMake(0,20, self.view.frame.size.width, 50);
    [segmentControl addTarget:self action:@selector(selectedSegment:) forControlEvents:UIControlEventValueChanged];
    [self.sortingView addSubview:segmentControl];

}
#pragma mark - DZNSegmentedControlDelegate Methods
- (void)selectedSegment:(id)sender
{
    single = [Singleton retrieveSingleton];
    if(segmentControl.selectedSegmentIndex==0)
    {
        //show outlet list and hide whatson
        single.selectedOption = 0;
    }
    else if(segmentControl.selectedSegmentIndex==1)
    {
        single.selectedOption = 1;
    }
    else if(segmentControl.selectedSegmentIndex==2)
    {
        single.selectedOption = 2;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationOptionSelected" object:nil];

}
- (UIBarPosition)positionForBar:(id <UIBarPositioning>)view
{
    return UIBarPositionBottom;
}

- (UIBarPosition)positionForSelectionIndicator:(id<UIBarPositioning>)bar
{
    return UIBarPositionBottom;
}
#pragma mark - CAPSPageMenu Delegate functions

- (void)willMoveToPage:(UIViewController *)controller index:(NSInteger)index
{
    
}
- (void)didMoveToPage:(UIViewController *)controller index:(NSInteger)index
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
