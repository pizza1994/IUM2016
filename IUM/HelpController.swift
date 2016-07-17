//
//  HelpView.swift
//  IUM
//
//  Created by Luca Pitzalis on 20/04/16.
//  Copyright © 2016 Luca Pitzalis. All rights reserved.
//

import UIKit

class HelpController: UIViewController{
    @IBOutlet var mapImage : UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let goToMap = UITapGestureRecognizer(target:self, action:#selector(HelpController.goToMap(_:)))
        
        mapImage!.userInteractionEnabled = true
        mapImage!.addGestureRecognizer(goToMap)
        
    }
    
    func goToMap(img: AnyObject)
    {
        
        let scrollView = self.view.superview as! UIScrollView!
        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
