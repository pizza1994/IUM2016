//
//  MapView.swift
//  IUM
//
//  Created by Luca Pitzalis on 06/05/16.
//  Copyright © 2016 Luca Pitzalis. All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation

class MapView : UIScrollView, CLLocationManagerDelegate{
   
    var imageView : UIImageView!
    var popupPreview : Preview?
    var text: [String]?
    static var staticMap : MapView?
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "ACFD065E-C3C0-11E3-9BBE-1A514932AC03")!, identifier: "Estimotes")
    let buttonArray = NSMutableArray()

    init(){
        super.init(frame: CGRect(x: 0, y: 82, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height))
        
        let opera_width = CGFloat(20);
        let opera_height = CGFloat(25);
        let coordinates = [CGRectMake(160, 80, opera_width, opera_height), CGRectMake(165, 500, opera_width, opera_height), CGRectMake(330, 500, opera_width, opera_height), CGRectMake(330, 400, opera_width, opera_height), CGRectMake(1000, 55, opera_width, opera_height), CGRectMake(930, 500, opera_width, opera_height), CGRectMake(370, 1030, opera_width, opera_height), CGRectMake(800, 1000, opera_width, opera_height), CGRectMake(650, 1150, opera_width, opera_height)]
        let location =  NSBundle.mainBundle().pathForResource("Opere", ofType: "txt")
        let fileContent : String = try! String(contentsOfFile: location!, encoding: NSUTF8StringEncoding)
        let separators = NSCharacterSet(charactersInString: "$\n")
        
        
        imageView = UIImageView(image: UIImage(named: "map001.png"))
        imageView.userInteractionEnabled = true
        self.contentSize = imageView.bounds.size
        self.bounces = false
        self.userInteractionEnabled = true
        self.addSubview(imageView)
        
        
        
        text = fileContent.componentsSeparatedByCharactersInSet(separators);
        
        for i in 0 ... (coordinates.count-1){
            
            let button   = UIButton(type: UIButtonType.Custom) as UIButton
            button.frame = coordinates[i]
            let image = UIImage(named: "punto-opera.png") as UIImage?
            button.addTarget(self, action: #selector(MapView.buttonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            button.setImage(image, forState: .Normal)
            button.tag = (i+1)
            buttonArray.addObject(button)

        }
        
        for button in buttonArray{
            self.addSubview(button as! UIView)
        }
        
        let myPosition = UIImageView(image: UIImage(named: "posizione_utente.png"))
        myPosition.frame = CGRectMake(250, 90, 25, 25)
        self.addSubview(myPosition)
        
        MapView.staticMap = self
        
        locationManager.delegate = self
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startRangingBeaconsInRegion(region)

    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        let knownBeacons = beacons.filter{ $0.proximity != CLProximity.Unknown }
        if (knownBeacons.count > 0 && popupPreview == nil) {
            let closestBeacon = knownBeacons[0] as CLBeacon
            let butt : UIButton = buttonArray[closestBeacon.minor.integerValue-1] as! UIButton
            print(closestBeacon.minor.integerValue)
            
            buttonPressed(butt)
        }
    }

    
    func buttonPressed(sender: UIButton!){
        
        if(popupPreview != nil){
            self.popupPreview!.removeFromSuperview()
        }
        for view in self.subviews{
            if (view.isKindOfClass(Popup)){
                view.removeFromSuperview()
            }
        }
        let position :CGPoint = CGPoint(x: sender.frame.origin.x+10, y: sender.frame.origin.y+25);
        
        var operaTitle : String = ""
        var operaAuthor : String = ""
        var operaYear : String = ""
        var textDescription : String = ""
        var audioDescription : String = ""
        var flag : Bool = false
        var i : Int = 0
        
        for word in text!{
            
            if(word == String(sender.tag)+"("){
                flag = true
            }
            if flag{
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
                }
                
            }
            if audioDescription != ""{
                flag = false
                break
            }
            i += 1
        }
    
        let sound: NSURL? =   NSURL(fileURLWithPath: (NSBundle.mainBundle().pathForResource("1", ofType: "mp3"))!)
        let audio = try? AVAudioPlayer(contentsOfURL:sound!)
        
        popupPreview = Preview(opera: Opera(title: operaTitle, author: operaAuthor, year: operaYear, textDescription: textDescription, audioDescriprion: audio), x_: position.x, y_: position.y, width_: 300, height_:100)
        
        
        self.addSubview(popupPreview!)
        
        
        if (position.x+150 > UIScreen.mainScreen().bounds.size.width){
            self.setContentOffset(CGPointMake(position.x-187, 0), animated: true)
        }
        else if(position.x < UIScreen.mainScreen().bounds.size.width){
            self.setContentOffset(CGPointMake(position.x-187, 0), animated: true)
            
        }
        
        if (position.y-86 < 0){
            
            self.setContentOffset(CGPointMake(position.x-187, position.y-100), animated: true)
        }

    }
    
    func getOperaValues(operaTtile: String, operaAuthor: String, operaYear: Int, textDescription: String, audioDescription: String) -> Void{
        
    
        
    }
    
    func searchedOpera(){
        for view in self.subviews as [UIView] {
            if let btn = view as? UIButton {
                if btn.tag == IndicationsController.operaCercata!{
                    let image = UIImage(named: "punto-opera_blu.png") as UIImage?
                    btn.setImage(image, forState: .Normal)

                }
                else{
                    let image = UIImage(named: "punto-opera.png") as UIImage?
                    btn.setImage(image, forState: .Normal)
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        

        if let touch = touches.first {

            if(popupPreview != nil){
                self.popupPreview!.removeFromSuperview()
                popupPreview = nil
            }
            for view in self.subviews{
                if (view.isKindOfClass(Popup)){
                    view.removeFromSuperview()
                }
            }
            

            
            
        }
        
       
    }

    
}
