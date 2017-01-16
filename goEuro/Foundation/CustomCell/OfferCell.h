//
//  OfferCell.h
//  goEuro
//
//  Created by guzzle developer on 1/16/17.
//  Copyright © 2017 goEuro developer. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface OfferCell : UITableViewCell

@property (nonatomic,weak)IBOutlet UILabel *lblPrice;
@property (nonatomic,weak)IBOutlet UILabel *lblTime;
@property (nonatomic,weak)IBOutlet UILabel *lblHour;
@property (nonatomic,weak)IBOutlet UILabel *lblStop;
@property (nonatomic,weak)IBOutlet UIImageView *imgThumbnail;
@end
