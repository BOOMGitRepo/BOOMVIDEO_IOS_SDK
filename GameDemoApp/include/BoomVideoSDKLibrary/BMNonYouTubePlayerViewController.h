//
//  BMNonYouTubePlayerViewController.h
//  Boom
//
//  Created by Boom on 11/10/14.
//  Copyright (c) 2014 Boom. All rights reserved.
//

#import "BMBasePlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface BMNonYouTubePlayerViewController : BMBasePlayerViewController

@property (strong, nonatomic) MPMoviePlayerController *videoPlayer;

@property (strong, nonatomic) IBOutlet UIView *videoView;

@end
