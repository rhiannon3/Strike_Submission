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
        CreatePlayerContentFields()
        
    }
    
    func CreatePlayerContentFields(){
        while PlayerNumber <= PlayerQty {
            print(PlayerNumber)
           CreateLabel()
           CreateTextField()
            PlayerNumber += 1
            YFloatPoint += 28
        }
    }
    
   func CreateLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 87, y: YFloatPoint)
        label.textAlignment = NSTextAlignment.center
        label.text = "Player \(PlayerNumber):"
        label.textColor = UIColor.red
        self.view.addSubview(label)
    }
    
    func CreateTextField() {
        let textField = UITextField(frame: CGRect(x: 20, y: 35, width: 120, height: 21))
        textField.center = CGPoint(x: 200, y: YFloatPoint)
        textField.textAlignment = NSTextAlignment.left
        textField.textColor = UIColor.red
        textField.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1
        self.view.addSubview(textField)
        self.ArrayPlayerNames.append(textField)
    }
    
    @IBAction func StartGameButtonPressed(_ sender: AnyObject) {
        for playerName in ArrayPlayerNames{
            print(playerName.text)
        }
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "PlayerNamesSegue"){
        let DestViewController : ViewGameCalculator = segue.destination as! ViewGameCalculator
        DestViewController.ArrayPlayerNames = ArrayPlayerNames
        }
    }
    
    
}
