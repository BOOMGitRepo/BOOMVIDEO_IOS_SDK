//
//  BMNativeAdData.h
//  BoomVideoVAST_SDKLibrary
//
//  Created by Algene Pulido on 2/2/16.
//  Copyright © 2016 BM. All rights reserved.
//

/**
 Preliminary Native Ad Data
 as of Feb 2 2016
 
 */

#import <UIKit/UIKit.h>
//#import "BMConstant.h"
#import "Mediation/MediationConstants.h"

typedef NS_ENUM(NSInteger,NativeAdCampaignType) {
    OfferCampaign,
    VideoCampaign
};

@interface BMNativeAdData : NSObject

@property (nonatomic,copy) NSString *na_thumbnailImageUrl;      //NonVideoCampaign_ImgThumbnail (for offer), ImgThumbnail (for video)
@property (nonatomic,copy) NSString *na_sponsorImageUrl;        //NonVideoCampaign_SponsorLink
@property (nonatomic,copy) NSString *na_title;                  //NonVideoCampaign_Name                         Title (for video)
@property (nonatomic,copy) NSString *na_description;            //NonVideoCampaign_Description                Mobile Description (for video)
@property (nonatomic) NADestination na_destination;             //NonVideoCampaign_Type
@property (nonatomic,copy) NSString *na_sponsorName;            //NonVideoCampaign_Sponsorname                SponsorName (for video)
@property (nonatomic,copy) NSString *na_youtubeLink;            //YoutubeLink
@property (nonatomic,copy) NSString *na_websiteLink;            //NonVideoCampaign_WebSiteUrl
@property (nonatomic,copy) NSString *na_androidUrl;             //NonVideoCampaign_AndroidUrl
@property (nonatomic,copy) NSString *na_iosUrl;                 //NonVideoCampaign_IOSUrl
@property (nonatomic,copy) NSString *na_vastVideoLink;          //from a vast parse

//comments data
@property (nonatomic,copy) NSString *shareCount;
@property (nonatomic,copy) NSString *likeCount;
@property (nonatomic,copy) NSString *commentsCount;
@property (nonatomic,copy) NSMutableArray *comments;
@property (nonatomic) BOOL allow_comments;

//sponsoring data
@property (nonatomic) BOOL hasSponsoring;
@property (nonatomic,copy) NSString *sponsoring_Image_Video;
@property (nonatomic,copy) NSString *sponsoring_Logo;
@property (nonatomic,copy) NSString *sponsoring_SponsorName;
@property (nonatomic,copy) NSString *sponsoring_Subtitle;
@property (nonatomic,copy) NSString *sponsoring_Text;
@property (nonatomic,copy) NSString *sponsoring_Title;

//other important data
@property (nonatomic,copy) NSString *gameCampaignGUID;
@property (nonatomic,copy) NSString *vpid;
@property (nonatomic,copy) NSString *boomGUID;
@property (nonatomic,copy) NSString *affiliateId;

//icon from vast
@property (nonatomic,copy) NSString *iconLink;

@property (nonatomic) NativeAdCampaignType campaignType;

@end
