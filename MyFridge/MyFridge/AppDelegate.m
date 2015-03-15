//
//  AppDelegate.m
//  MyFridge
//
//  Created by Alice Fredine on 2015-03-13.
//  Copyright (c) 2015 Alice Fredine. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]){
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    /*ViewController* mainController = (ViewController *)  self.window.rootViewController;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    
    [defaults setInteger:*(mainController.foodEaten) forKey:@"foodEaten"];
    [defaults setInteger:*(mainController.garbage) forKey:@"garbage"];
    [defaults setObject:mainController.collectionData forKey:@"collectionData"];*/
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.

    /*NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    ViewController* mainController = (ViewController *)  self.window.rootViewController;
    
    NSInteger fe = [defaults integerForKey:@"foodEaten"];
    NSInteger fta = [defaults integerForKey:@"garbage"];
    NSMutableArray *col = [defaults objectForKey:@"collectionData"];

    
    mainController.foodEaten = &(fe);
    mainController.garbage = &(fta);
    mainController.collectionData = col; */

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    ViewController* mainController = (ViewController *)  self.window.rootViewController;
    
    NSInteger fe = [defaults integerForKey:@"foodEaten"];
    NSInteger fta = [defaults integerForKey:@"garbage"];
    NSMutableArray *col = [defaults objectForKey:@"collectionData"];
    
    
    mainController.foodEaten = &(fe);
    mainController.garbage = &(fta);
    mainController.collectionData = col;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    ViewController* mainController = (ViewController *)  self.window.rootViewController;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    
    [defaults setInteger:*(mainController.foodEaten) forKey:@"foodEaten"];
    [defaults setInteger:*(mainController.garbage) forKey:@"garbage"];
    [defaults setObject:mainController.collectionData forKey:@"collectionData"];
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Your food needs you!"
                                                       message:notification.alertBody
                                                      delegate:self
                                             cancelButtonTitle:notification.alertAction
                                             otherButtonTitles:nil];
    [theAlert show];

}

@end
