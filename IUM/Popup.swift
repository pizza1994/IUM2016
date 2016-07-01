//
//  Popup.swift
//  IUM
//
//  Created by Luca Pitzalis on 10/05/16.
//  Copyright © 2016 Luca Pitzalis. All rights reserved.
//

import UIKit

@IBDesignable class Popup : Preview{
    
    @IBOutlet var descrizione: UITextView!
    @IBOutlet var scrollDown: UIButton!
    @IBOutlet var scrollUp: UIButton!
    

    
    
    override init(opera: Opera!, x_: CGFloat, y_: CGFloat, width_: CGFloat, height_: CGFloat){
        super.init(opera: opera, x_: x_, y_: y_, width_: width_, height_: height_)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    override func showInfo(){
        authorLabel.text = getOpera().getAuthor()
        if(getOpera().getYear() != nil){
            yearLabel.text = getOpera().getYear()
        }
        else{
            yearLabel.text = "Sconosciuto"
        }
        titleLabel.text = getOpera().getTitle()
        descrizione.text = getOpera().getTextDescription()
        
    }
    
    override func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "popupView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    override func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        addSubview(view)
    }
    
    @IBAction func scrollDown(sender: UIButton!){
        self.setContentOffset(CGPoint(x: 0.0,y: 0.0), animated: true)
    }
    
    @IBAction func scrollUp(sender: UIButton!){
        self.setContentOffset(CGPoint(x: 0.0,y: 0.0), animated: true)

    }
    
    @IBAction func play(sender: UIButton!){
        getOpera().getAudioDescription()!.prepareToPlay()
        getOpera().getAudioDescription()!.play()
    }
    
    @IBAction func pause(sender: UIButton!){
        getOpera().getAudioDescription()!.pause()
    }


    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }


}