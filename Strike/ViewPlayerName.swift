//
//  ViewPlayerName.swift
//  Strike
//
//  Created by Shanee Dahler on 20/09/2016.
//  Copyright © 2016 Shanee Dahler. All rights reserved.
//

import Foundation
import UIKit

class ViewPlayerName: ViewController {
    
    var PlayerQty = Int()
    var YFloatPoint = CGFloat(215)
    var PlayerNumber = Int(1)
    var ArrayPlayerNames: [UITextField] = []
    
    @IBOutlet var StartGameButton: UIButton!
    
    override func viewDidLoad() {
        print(PlayerQty)
        
        while PlayerNumber <= PlayerQty {
            print(PlayerNumber)
            CreateLabel()
            CreateTextField()
            PlayerNumber += 1
            YFloatPoint += 28
        }
        
    }
    
    func CreateLabel() {
        let label = UILabel(frame: CGRectMake(0,0,200,21))
        label.center = CGPointMake(87, YFloatPoint)
        label.textAlignment = NSTextAlignment.Center
        label.text = "Player \(PlayerNumber):"
        label.textColor = UIColor.redColor()
        self.view.addSubview(label)
    }
    
    func CreateTextField() {
        let textField = UITextField(frame: CGRectMake(20, 35, 120, 21))
        textField.center = CGPointMake(200, YFloatPoint)
        textField.textAlignment = NSTextAlignment.Left
        textField.textColor = UIColor.redColor()
        textField.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
        textField.layer.cornerRadius = 5
        self.ArrayPlayerNames.append(textField)
        self.view.addSubview(textField)
    }
    
    @IBAction func StartGameButtonPressed(sender: AnyObject) {
        for textField in ArrayPlayerNames{
            print(textField.text)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : ViewGameCalculator = segue.destinationViewController as! ViewGameCalculator
        
        DestViewController.ArrayPlayerNames = ArrayPlayerNames
    }
    
}