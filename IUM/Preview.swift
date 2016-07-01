//
//  Preview.swift
//  IUM
//
//  Created by Luca Pitzalis on 06/05/16.
//  Copyright © 2016 Luca Pitzalis. All rights reserved.
//

import UIKit

@IBDesignable class Preview : UIScrollView{

    private var opera: Opera!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    var view:UIView!
    var popup : Popup?

    
    init(opera: Opera!, x_: CGFloat, y_: CGFloat, width_: CGFloat, height_: CGFloat){
        super.init(frame: CGRect(x: x_-(width_/2), y: y_-height_, width: width_ , height: height_))
        self.opera = opera
        xibSetup()
        showInfo()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        xibSetup()
        showInfo()
        
    }
    
    func showInfo(){
       
        authorLabel.text = opera.getAuthor()
        if(opera.getYear() != nil){
            yearLabel.text = opera.getYear()
        }
        else{
            yearLabel.text = "Sconosciuto"
        }
        titleLabel.text = opera.getTitle()
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "previewView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        addSubview(view)
    }
    
    func getOpera() -> Opera!{
        return opera
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first {
            let position :CGPoint = self.frame.origin
            if(popup != nil){
                self.removeFromSuperview()
            }
            popup = Popup(opera: opera, x_: position.x+150, y_: position.y+96, width_: 300, height_: 482)
            superview!.addSubview(popup!)
            let scrollView = superview as! UIScrollView;
            scrollView.setContentOffset(CGPoint(x: position.x-40 , y: position.y-480), animated: true)
            self.removeFromSuperview()
            
        }
        
    }
    

    
}
