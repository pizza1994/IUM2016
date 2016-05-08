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

        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first {
            if(popupPreview != nil){
                self.popupPreview!.removeFromSuperview()
            }
            let position :CGPoint = touch.locationInView(self)
            popupPreview = Preview(opera: Opera(title: "Mona Lisa", author: "Gianni Fenu", year: 3011, textDescription: "", audioDescriprion: nil), x: position.x, y: position.y)
            self.addSubview(popupPreview!)
            
            
        }
       
    }

    
}
