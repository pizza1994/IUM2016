//
//  ContainerViewController.swift
//  bubble_ios
//
//  Created by Brendan Lee on 7/23/14.
//  Copyright (c) 2014 Brendan Lee. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    // Outlet used in storyboard
    @IBOutlet var scrollView: UIScrollView?;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // 1) Create the three views used in the swipe container view       
        
        let helpView : HelpController =  HelpController(nibName: "HelpController", bundle: nil);
        let mapView : MapController =  MapController(nibName: "MapController", bundle: nil);
        let indicationsView : IndicationsController =  IndicationsController(nibName: "IndicationsController", bundle: nil);
        
        
        self.addChildViewController(helpView);
        self.scrollView!.addSubview(helpView.view);
        helpView.didMoveToParentViewController(self);
        
        self.addChildViewController(mapView);
        self.scrollView!.addSubview(mapView.view);
        mapView.didMoveToParentViewController(self);
        
        self.addChildViewController(indicationsView);
        self.scrollView!.addSubview(indicationsView.view);
        indicationsView.didMoveToParentViewController(self);
        

        
        
        // 3) Set up the frames of the view controllers to align
        //    with eachother inside the container view
       
        var HFrame : CGRect = helpView.view.frame;
        var MFrame :CGRect = mapView.view.frame;
        var IFrame :CGRect = indicationsView.view.frame;

        HFrame.origin.x = 0;
        MFrame.origin.x = HFrame.width;
        IFrame.origin.x = 2*HFrame.width;
        
        helpView.view.frame = HFrame;
        mapView.view.frame = MFrame;
        indicationsView.view.frame = IFrame;
        
        scrollView!.contentOffset = CGPointMake(view.frame.size.width, 0);
        

        

        
        
        // 4) Finally set the size of the scroll view that contains the frames
        let scrollWidth: CGFloat  = 3 * self.view.frame.width
        let scrollHeight: CGFloat  = self.view.frame.size.height
        self.scrollView!.contentSize = CGSizeMake(scrollWidth, scrollHeight);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    
}

