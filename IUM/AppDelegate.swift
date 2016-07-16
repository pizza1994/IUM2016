//
//  AppDelegate.swift
//  IUM
//
//  Created by Luca Pitzalis on 20/04/16.
//  Copyright © 2016 Luca Pitzalis. All rights reserved.
//

import UIKit
import AVFoundation


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
       
        application.statusBarHidden = true
        
        var text: [String]?
        var operaTitle : String = ""
        var operaAuthor : String = ""
        var operaYear : String = ""
        var textDescription : String = ""
        var audioDescription : String = ""
        var flag : Bool = false
        var audio: AVAudioPlayer?
        var i : Int = 0
        
        let location =  NSBundle.mainBundle().pathForResource("Opere", ofType: "txt")
        let fileContent : String = try! String(contentsOfFile: location!, encoding: NSUTF8StringEncoding)
        let separators = NSCharacterSet(charactersInString: "$\n")
        
        text = fileContent.componentsSeparatedByCharactersInSet(separators);

        
        for word in text!{
            
            if word == "<titolo>"{
                operaTitle = text![i+1]
            }
            else if word == "<autore>"{
                operaAuthor = text![i+1]
            }
            else if word == "<anno>"{
                operaYear = text![i+1]
            }
            else if word == "<testo>"{
                textDescription = text![i+1]
            }
            else if word == "<audio>"{
                audioDescription = text![i+1]
                let sound: NSURL? =   NSURL(fileURLWithPath: (NSBundle.mainBundle().pathForResource("1", ofType: "mp3"))!)
                audio = try? AVAudioPlayer(contentsOfURL:sound!)
            }
            
            
            if audioDescription != ""{
                Opera.opere.append(Opera(title: operaTitle, author: operaAuthor, year: operaYear, textDescription: textDescription, audioDescriprion: audio))
                audioDescription = ""
            }
            i += 1
        }


        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    



}

