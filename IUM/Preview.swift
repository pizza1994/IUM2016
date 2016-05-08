//
//  Preview.swift
//  IUM
//
//  Created by Luca Pitzalis on 06/05/16.
//  Copyright © 2016 Luca Pitzalis. All rights reserved.
//

import UIKit

@IBDesignable class Preview : UIView{

    private var opera: Opera!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    var view:UIView!
    
    init(opera: Opera!, x: CGFloat, y: CGFloat){
        super.init(frame: CGRect(x: x-150, y: y-100, width: 300, height: 100))
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
            yearLabel.text = String(opera.getYear()!)
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
    
}
