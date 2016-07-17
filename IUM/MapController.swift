//
//  ViewController.swift
//  IUM
//
//  Created by Luca Pitzalis on 20/04/16.
//  Copyright © 2016 Luca Pitzalis. All rights reserved.
//

import UIKit

class MapController: UIViewController {
    
    @IBOutlet var indicazioniImage : UIImageView?
    @IBOutlet var helpImage : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // 1
        
        // 2
        // 3


        // 4
        
        view.addSubview(MapView())
        
       
    
        let goToIndications = UITapGestureRecognizer(target:self, action:#selector(MapController.goToIndications(_:)))
        let goToHelp = UITapGestureRecognizer(target:self, action:#selector(MapController.goToHelp(_:)))

        indicazioniImage!.userInteractionEnabled = true
        indicazioniImage!.addGestureRecognizer(goToIndications)
        helpImage!.userInteractionEnabled = true
        helpImage!.addGestureRecognizer(goToHelp)
        
    }
    
    func goToIndications(img: AnyObject)
    {
        
        let scrollView = self.view.superview as! UIScrollView!
        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width*2, 0);
        
    }
    
    func goToHelp(img: AnyObject)
    {
        
        let scrollView = self.view.superview as! UIScrollView!
        scrollView.contentOffset = CGPointMake(0, 0);
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

