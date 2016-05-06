//
//  Preview.swift
//  IUM
//
//  Created by Luca Pitzalis on 06/05/16.
//  Copyright © 2016 Luca Pitzalis. All rights reserved.
//

import UIKit

class Preview : UIView{

    private var opera: Opera!
    var authorLabel: UILabel!
    var yearLabel: UILabel!
    var titleLabel: UILabel!
    
    init(opera: Opera!){
        super.init(frame: CGRect(x: 0, y: 0, width: 600/4, height: 183/4))
        self.opera = opera
        self.backgroundColor = UIColor(patternImage: UIImage(named: "popup_small.png")!)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showInfo(){
       
        authorLabel.text = opera.getAuthor()
        yearLabel.text = String(opera.getYear())
        titleLabel.text = opera.getTitle()
    }
    
}
