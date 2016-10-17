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
    var ArrayPlayerNamesStr: [String] = []
    var YFloatPoint = CGFloat(20)
    var playerCount = 1
    var scrollViewContentSize = CGFloat(60)
    var ArrayGameScore: [frameRolls] = []
    var ArrayOfRolls: [Int] = []
    var Rolls = 21
    
    struct frameRolls {
        var rollOne: Int
        var rollTwo: Int
        
        init(rollOne: Int, rollTwo: Int) {
            self.rollOne = rollOne
            self.rollTwo = rollTwo
        }
        
        func DisplayFramePoint(){
            print(rollOne + rollTwo)
        }
    }

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var playInfoLabel: UILabel!
    @IBOutlet var onePinDown: UIButton!
    @IBOutlet var twoPinDown: UIButton!
    @IBOutlet var threePinDown: UIButton!
    @IBOutlet var fourPinDown: UIButton!
    @IBOutlet var fivePinDown: UIButton!
    @IBOutlet var sixPinDown: UIButton!
    @IBOutlet var sevenPinDown: UIButton!
    @IBOutlet var eightPinDown: UIButton!
    @IBOutlet var ninePinDown: UIButton!
    @IBOutlet var tenPinDown: UIButton!
    
    var currentScore = 0
    var buttonPress = false
    
    
    override func viewDidLoad() {
        scrollView.contentInset.top = -45
        scoreCard().CreateScoreCardLabels(view: view)
        CreatePlayerLabels()
    }
    
    func CheckScore(pinsDown: Int) {
        print(currentScore)
        
    }
    

    @IBAction func pinsKnockedDown(_ sender: UIButton) {
        currentScore = sender.tag
        CheckScore(pinsDown: currentScore)
    }
    
    
    func CreatePlayerLabels(){
        for textField in ArrayPlayerNames {
            var userInput = textField.text!
            if userInput == "" {
                userInput = "Player \(playerCount)"
            }
            self.ArrayPlayerNamesStr.append(userInput)
            playerCount += 1
        }
        for name in ArrayPlayerNamesStr{
            YFloatPoint += 40
            scrollViewContentSize += 45
            scrollView.contentSize = CGSize(width: 200, height:scrollViewContentSize)
            scoreCard().CreateNameLabels(name: name, YFloatPoint: YFloatPoint, view: scrollView)
            scoreCard().CreateScoreCard(view: scrollView, YFloatPoint: YFloatPoint)
            print(name)
        }
    }
    
        
}



