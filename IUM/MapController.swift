//
//  ViewController.swift
//  IUM
//
//  Created by Luca Pitzalis on 20/04/16.
//  Copyright © 2016 Luca Pitzalis. All rights reserved.
//

import UIKit

class MapController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var scrollView : UIScrollView
        var imageView : UIImageView
        
        // 1
        imageView = UIImageView(image: UIImage(named: "map.png"))
        // 2
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 82, width: view.frame.width, height: view.frame.height))
        scrollView.backgroundColor = UIColor.blackColor()
        // 3
        scrollView.contentSize = imageView.bounds.size
        scrollView.bounces = false

        // 4
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

