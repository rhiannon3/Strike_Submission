//
//  ViewGameCalculator.swift
//  Strike
//
//  Created by Shanee Dahler on 20/09/2016.
//  Copyright © 2016 Shanee Dahler. All rights reserved.
//

import Foundation
import UIKit

class ViewGameCalculator: UIViewController {
    
    var ArrayPlayerNames: [UITextField] = []
    var YFloatPoint = CGFloat(215)
    var userInput = String()
    
    override func viewDidLoad() {
        
        for textField in ArrayPlayerNames {
            print(textField.text)
            userInput = textField.text!
            CreateLabel()
            YFloatPoint += 28
        }
        
    }
    
    func CreateLabel() {
        
        let label = UILabel(frame: CGRectMake(0,0,110,21))
        label.center = CGPointMake(70, YFloatPoint)
        label.textAlignment = NSTextAlignment.Right
        label.text = "\(userInput):"
        label.textColor = UIColor.redColor()
        self.view.addSubview(label)
    }
    

    
}