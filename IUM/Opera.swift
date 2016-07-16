//
//  Opera.swift
//  IUM
//
//  Created by Luca Pitzalis on 06/05/16.
//  Copyright © 2016 Luca Pitzalis. All rights reserved.
//

import UIKit
import AVFoundation

class Opera : NSObject{
    
    private var title: String!
    private var author: String?
    private var year: String?
    private var textDescription: String!
    private var audioDescription: AVAudioPlayer?
    static var opere = [Opera]()
    
    
    
    init(title: String, author: String?, year: String, textDescription: String!, audioDescriprion: AVAudioPlayer?){
        
        self.title = title
        self.author = author
        self.year = year
        self.textDescription = textDescription
        self.audioDescription = audioDescriprion
        super.init()
        
    }
    
    func getTitle() -> String! {
        
        return self.title
    
    }
    func getAuthor() -> String?{
        
        return self.author
        
    }
    func getYear() -> String?{
        
        return self.year
        
    }
    func getTextDescription() -> String! {
        
        return self.textDescription
        
    }
    func getAudioDescription() -> AVAudioPlayer? {
        
        return self.audioDescription
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

