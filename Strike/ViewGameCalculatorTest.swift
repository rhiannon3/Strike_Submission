//
//  ViewGameCalculator.swift
//  Strike
//
//  Created by Shanee Dahler on 20/09/2016.
//  Copyright © 2016 Shanee Dahler. All rights reserved.
//

import Foundation
import UIKit


class ViewGameCalculatorTest: UIViewController {
    

    
    var ArrayPlayerOne: [Int] = []
    var ArrayPlayerTwo: [Int] = []
    var ArrayPlayerThree: [Int] = []
    var ArrayPlayerFour: [Int] = []
    var ArrayPlayerFive: [Int] = []
    var ArrayPlayerSix: [Int] = []
    

    var playerQty = Int()
    var playerCount = Int()
    var frameCount = 1
    var currentScore = Int()
    var frameScore = Int()
    
    var currentScorePlayerOne = Int()
    var currentScorePlayerTwo = Int()
    var currentScorePlayerThree = Int()
    var currentScorePlayerFour = Int()
    var currentScorePlayerFive = Int()
    var currentScorePlayerSix = Int()
    
    
    
    var rollCount = 0
    var frames = 9
    var rollOne = Int()
    var rollTwo = Int()
    
    
    //Layout Generation variables
    var ArrayPlayerNames: [UITextField] = []
    var ArrayPlayerNamesStr: [String] = []
    var xFrame = 127
    var yFrame = 60
    var YFloatPoint = CGFloat(20)
    var scrollViewContentSize = CGFloat(60)
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var playInfoLabel: UILabel!
    @IBOutlet var zeroPinDown: UIButton!
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
    
    
    override func viewDidLoad() {
        scrollView.contentInset.top = -45
        scoreCard().CreateScoreCardLabels(view: view)
        
        CreatePlayerNameArray()
        CreatePlayerLabels()
        playerQty = ArrayPlayerNamesStr.count
        
    }
    
    @IBAction func pinsKnockedDown(_ sender: UIButton) {
        print(sender.tag)
        let rollScore = sender.tag
        SetScore(rollScore: rollScore)
        playInfoLabel.text = "\(ArrayPlayerNamesStr[playerCount]) is rolling \(rollCount) roll for frame \(frameCount)"
        
    }
    
    func SetScore(rollScore: Int){
        
    }
    
    func CreatePlayerNameArray() {
        var playerCounter = 1
        for textField in ArrayPlayerNames {
            var userInput = textField.text!
            if userInput == "" {
                userInput = "Player \(playerCounter)"
            }
            self.ArrayPlayerNamesStr.append(userInput)
            playerCounter += 1
        }
    }
    
    func CreatePlayerLabels(){
        for name in ArrayPlayerNamesStr{
            YFloatPoint += 40
            scrollViewContentSize += 45
            scrollView.contentSize = CGSize(width: 200, height:scrollViewContentSize)
            scoreCard().CreateNameLabels(name: name, YFloatPoint: YFloatPoint, view: scrollView)
            scoreCard().CreateScoreCard(view: scrollView, YFloatPoint: YFloatPoint)
            print(name)
        }
        playInfoLabel.text = "\(ArrayPlayerNamesStr[0]) is rolling First roll for frame 1"
    }
    
    
}



