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
    var YFloatPoint = CGFloat(20)
    var userInput = String()
    var playerCount = 1
    
    override func viewDidLoad() {
        CreatePlayerLabels()
        
    }
    
    func CreatePlayerLabels(){
        for textField in ArrayPlayerNames {
            userInput = textField.text!
            if userInput == "" {
                userInput = "Player \(playerCount)"
            }
            playerCount += 1
            YFloatPoint += 50
          CreateLabel()
            
        }
    }
    
  func CreateLabel() {
    let label = UILabel(frame: CGRect(x: 0,y: 0,width: 110, height: 21))
    label.center = CGPoint(x: 50, y: YFloatPoint)
        label.textAlignment = NSTextAlignment.right
        label.text = "\(userInput):"
        label.textColor = UIColor.red
        self.view.addSubview(label)
    }
    

    
}
