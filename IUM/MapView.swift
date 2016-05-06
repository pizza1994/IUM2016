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

    init(){
        super.init(frame: CGRect(x: 0, y: 82, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height))
        imageView = UIImageView(image: UIImage(named: "map.png"))
        imageView.userInteractionEnabled = true
        self.contentSize = imageView.bounds.size
        self.bounces = false
        self.userInteractionEnabled = true
        self.addSubview(imageView)

        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first {
            let position :CGPoint = touch.locationInView(self)
            self.addSubview(Preview(opera: Opera(title: "", author: "", year: 1991, textDescription: "", audioDescriprion: nil)))
            print("entrato");
            
            
        }
        else{
            //self.view.willRemoveSubview(<#T##subview: UIView##UIView#>)
        }
    }

    
}
