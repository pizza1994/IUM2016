//
//  MapView.swift
//  IUM
//
//  Created by Luca Pitzalis on 06/05/16.
//  Copyright © 2016 Luca Pitzalis. All rights reserved.
//

import UIKit

class MapView : UIScrollView{
   
    var imageView : UIImageView!
    var popupPreview : Preview?

    init(){
        super.init(frame: CGRect(x: 0, y: 82, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height))
        imageView = UIImageView(image: UIImage(named: "map.png"))
        imageView.userInteractionEnabled = true
        self.contentSize = imageView.bounds.size
        self.bounces = false
        self.userInteractionEnabled = true
        self.addSubview(imageView)
        
        let buttonArray = NSMutableArray()
        let coordinates = [CGRectMake(160, 80, 20, 20), CGRectMake(160, 130, 20, 20), CGRectMake(160, 250, 20, 20), CGRectMake(325, 400, 20, 20), CGRectMake(500, 200, 20, 20)]
        
        for i in 0 ... (coordinates.count-1){
            let button   = UIButton(type: UIButtonType.Custom) as UIButton
            button.frame = coordinates[i]
            let image = UIImage(named: "punto_interesse.png") as UIImage?
            button.addTarget(self, action: #selector(MapView.buttonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            button.setImage(image, forState: .Normal)
            buttonArray.addObject(button)

        }
        
        for button in buttonArray{
            self.addSubview(button as! UIView)
        }

        

    }
    
    func buttonPressed(sender: UIButton!){
        for view in self.subviews{
            if (view.isKindOfClass(Popup)){
                view.removeFromSuperview()
            }
        }
        let position :CGPoint = CGPoint(x: sender.frame.origin.x+10, y: sender.frame.origin.y+25);
        popupPreview = Preview(opera: Opera(title: "Mona Lisa", author: "Gianni Fenu", year: 3011, textDescription: "", audioDescriprion: nil), x_: position.x, y_: position.y, width_: 300, height_:100)
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        

        if let touch = touches.first {
            if touch.isKindOfClass(UIButton){
                print("entrato")
            }
            if(popupPreview != nil){
                self.popupPreview!.removeFromSuperview()
            }
            for view in self.subviews{
                if (view.isKindOfClass(Popup)){
                    view.removeFromSuperview()
                }
            }
            

            
            
        }
        
       
    }

    
}
