//
//  FlightViewController.m
//  goEuro
//
//  Created by guzzle developer on 1/16/17.
//  Copyright © 2017 goEuro developer. All rights reserved.
//

#import "FlightViewController.h"
#import "OfferCell.h"
#import "OfferObject.h"
@interface FlightViewController ()<RequestDelegate,LGRefreshViewDelegate>
{
    NSMutableArray *offerArray;
    LGRefreshView *refreshView;
    NSString *sortingKey;
}
@property (weak, nonatomic) IBOutlet UITableView *offerTableView;
@end

@implementation FlightViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // sorted with departure time
    sortingKey = @"departureTime";
    
    // fetching data from server
    [self callOfferData];
    
    offerArray = [NSMutableArray new];
    
    // check if data in cache then show
    if ([SWDefaults flightArray].count > 0)
    {
        [self populateOfferData:[SWDefaults flightArray]];
    }
    
    //pull to refresh
    refreshView = [[LGRefreshView alloc] initWithScrollView:self.offerTableView];
    refreshView.tintColor = [UIColor whiteColor];
    refreshView.backgroundColor = UIColorFromRGB(goeuro_blue);
    refreshView.delegate=self;
    
    //notification for sorting selection
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(selectedSortingOption) name:@"NotificationOptionSelected" object:nil];
}

#pragma mark - Class Methods

-(void) selectedSortingOption
{
    single = [Singleton retrieveSingleton];
    if(single.selectedOption==0)
    {
        //show outlet list and hide whatson
        sortingKey = @"departureTime";
    }
    else if(single.selectedOption==1)
    {
        sortingKey = @"arrivalTime";
    }
    else if(single.selectedOption==2)
    {
        sortingKey = @"durationTime";
    }
    [self reloadOfferData];
}
-(void)callOfferData
{
    if([self isConnectionAvailable])
    {
        [self showCustomLoadingIndicator:self.view];
        [httpManager callGetService:self withName:@"w60i"];
    }
    else
    {
        [self showErrorAlert:ConnectionLostTitle andMessage:ConnectionLost];
        [refreshView endRefreshing];
    }
}
-(void)reloadOfferData
{
    offerArray = [self sortArray:offerArray forKey:sortingKey Ascending:YES];
    [self.offerTableView reloadData];
}

-(void)populateOfferData:(NSMutableArray *)data
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    
    if (data.count > 0)
    {
        [offerArray removeAllObjects];
        //save in to cache
        [SWDefaults setFlightArray:data];
        
        for (int i = 0; i < data.count; i++)
        {
            OfferObject *obj = [OfferObject new];
            obj.offer_id = [data[i][@"id"] intValue];
            obj.provider_logo = data[i][@"provider_logo"];
            obj.price_in_euros = data[i][@"price_in_euros"];
            obj.departure_time = data[i][@"departure_time"];
            obj.arrival_time = data[i][@"arrival_time"];
            obj.number_of_stops = [data[i][@"number_of_stops"] intValue];
            obj.duration_time = [self calculateDuration:obj.departure_time secondDate:obj.arrival_time];
            obj.durationTime = [dateFormatter dateFromString:obj.duration_time];
            obj.departureTime = [dateFormatter dateFromString:obj.departure_time];
            obj.arrivalTime = [dateFormatter dateFromString:obj.arrival_time];
            [offerArray addObject:obj];
        }
        [self reloadOfferData];
    }
    else
    {
        [self showErrorAlert:@"No data found." andMessage:@"Please try again."];
    }
}

#pragma mark - RequestDelegate

- (void) didReceiveResponse:(id) data
{
    [self hideCustomIndicator];
    [refreshView endRefreshing];
    [self populateOfferData:(NSMutableArray*)data];
}

- (void) didFailWithError:(NSError *)error
{
    [self hideCustomIndicator];
    [refreshView endRefreshing];
    [self showErrorAlert:@"Time out!" andMessage:@"Please check your connection and try again."];
    NSLog(@"Error : %@",error.localizedDescription);
}

#pragma mark - UITableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [offerArray count];
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier=@"OfferCell";
    OfferCell *cell=[self.offerTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    OfferObject *obj = [offerArray objectAtIndex:indexPath.row];
    
    cell.lblPrice.text = [@"€ " stringByAppendingString:obj.price_in_euros];
    cell.lblHour.text = [NSString stringWithFormat:@"%@h",obj.duration_time];
    cell.lblTime.text = [obj.departure_time stringByAppendingString:[NSString stringWithFormat:@" - %@",obj.arrival_time]];
    [cell.imgThumbnail setImageWithURL:[NSURL URLWithString:[obj.provider_logo stringByReplacingOccurrencesOfString:@"{size}" withString:@"63"]] placeholderImage:[UIImage imageNamed:@"placeHolder" cache:YES]];
    
    if (obj.number_of_stops == 0)
    {
        cell.lblStop.text = @"Direct";
    }
    else
    {
        cell.lblStop.text = [NSString stringWithFormat:@"Stops : %d",obj.number_of_stops];
    }

    [cell.lblHour sizeToFit];

    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self showSuccessAlert:@"Oops!" andMessage:@"Offer details are not yet implemented!"];
}

#pragma mark - LGRefreshView Delegate
- (void)refreshViewRefreshing:(LGRefreshView *)refreshView1
{
    [self callOfferData];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    //    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
