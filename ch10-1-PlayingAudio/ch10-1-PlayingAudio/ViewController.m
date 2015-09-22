//
//  ViewController.m
//  ch10-1-PlayingAudio
//
//  Created by X on 22/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *fileName      = @"fairytale";
    NSString *fileType      = @"mp3";
    NSString *soundFilePath =[[NSBundle mainBundle] pathForResource:fileName
                                                             ofType:fileType];
    NSURL *soundFileURL     = [NSURL fileURLWithPath:soundFilePath];
    NSError *error;

    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                         error:&error];
    if (error)
    {
        NSLog(@"Error creating the audio player: %@", error);
    }

    self.player.enableRate      = YES; //Allows us to change the playback rate.
    self.player.meteringEnabled = YES; //Allows us to monitor levels
    self.player.delegate        = self;

    self.volumeSlider.value = self.player.volume;
    self.rateSlider.value   = self.player.rate;
    self.panSlider.value    = self.player.pan;

    [self.player prepareToPlay]; //Preload audio to decrease lag

    [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:self
                                   selector:@selector(updateLabels)
                                   userInfo:nil
                                    repeats:YES];
}

-(void)updateLabels
{
    [self.player updateMeters];
    self.averageLabel.text = [NSString stringWithFormat:@"%f",
                              [self.player averagePowerForChannel:0]];
    self.peakLabel.text    = [NSString stringWithFormat:@"%f",
                              [self.player peakPowerForChannel:0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)updateRate:(id)sender
{
    self.player.rate = self.rateSlider.value;
}

- (IBAction)updatePan:(id)sender
{
    self.player.pan = self.panSlider.value;
}

- (IBAction)updateVolume:(id)sender
{
    self.player.volume = self.volumeSlider.value;
}

- (IBAction)playVibrateSound:(id)sender
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (IBAction)startPlayer:(id)sender
{
    [self.player play];
}

- (IBAction)pausePlayer:(id)sender
{
    [self.player pause];
}

#pragma mark - AVAudioPlayerDelegate methods

-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player
                                error:(NSError *)error
{
    NSLog(@"Error playing file: %@", [error localizedDescription]);
}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player
                       withOptions:(NSUInteger)flags
{
    if (flags == AVAudioSessionInterruptionOptionShouldResume)
    {
        [player play];
    }
}

@end
