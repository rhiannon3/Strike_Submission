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
    var scrollViewContentSize = CGFloat(60)
    var playerCount = Int()
    var frameCount = Int()
    
    var rollCount = "First"
    var frames = 9
    var rollOne = Int()
    var rollTwo = Int()
    
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
    
    var ArrayPlayerScores: [Int] = []
    var ArrayFrameScores: [frameRolls] = []
    
    struct frameRolls {
        var rollOneScore = Int()
        var rollTwoScore = Int()
        
        func ScorePoints(){
            
        }
    }
    
    
    
    
    override func viewDidLoad() {
        scrollView.contentInset.top = -45
        scoreCard().CreateScoreCardLabels(view: view)
        
        CreatePlayerNameArray()
        CreatePlayerLabels()
        
    }

    @IBAction func pinsKnockedDown(_ sender: UIButton) {
      //  print(sender.tag)
        let rollScore = sender.tag
        ArrayPlayerScores.append(rollScore)
        SetScore(rollScore: rollScore)
        
        playInfoLabel.text = "\(ArrayPlayerNamesStr[playerCount]) is rolling \(rollCount) roll for frame \(frameCount)"
        
    }
    
    func SetScore(rollScore: Int){
        if rollCount == "First" {
            rollOne = rollScore
            switch rollScore {
            case 1:
                tenPinDown.isHidden = true
            case 2:
                tenPinDown.isHidden = true
                ninePinDown.isHidden = true
            case 3:
                tenPinDown.isHidden = true
                ninePinDown.isHidden = true
                eightPinDown.isHidden = true
            case 4:
                tenPinDown.isHidden = true
                ninePinDown.isHidden = true
                eightPinDown.isHidden = true
                sevenPinDown.isHidden = true
            case 5:
                tenPinDown.isHidden = true
                ninePinDown.isHidden = true
                eightPinDown.isHidden = true
                sevenPinDown.isHidden = true
                sixPinDown.isHidden = true
            case 6:
                tenPinDown.isHidden = true
                ninePinDown.isHidden = true
                eightPinDown.isHidden = true
                sevenPinDown.isHidden = true
                sixPinDown.isHidden = true
                fivePinDown.isHidden = true
            case 7:
                tenPinDown.isHidden = true
                ninePinDown.isHidden = true
                eightPinDown.isHidden = true
                sevenPinDown.isHidden = true
                sixPinDown.isHidden = true
                fivePinDown.isHidden = true
                fourPinDown.isHidden = true
            case 8:
                tenPinDown.isHidden = true
                ninePinDown.isHidden = true
                eightPinDown.isHidden = true
                sevenPinDown.isHidden = true
                sixPinDown.isHidden = true
                fivePinDown.isHidden = true
                fourPinDown.isHidden = true
                threePinDown.isHidden = true
            case 9:
                tenPinDown.isHidden = true
                ninePinDown.isHidden = true
                eightPinDown.isHidden = true
                sevenPinDown.isHidden = true
                sixPinDown.isHidden = true
                fivePinDown.isHidden = true
                fourPinDown.isHidden = true
                threePinDown.isHidden = true
                twoPinDown.isHidden = true
                
                
            default:
                print("nothing")
            }
            rollCount = "Second"
        }
        else {
            rollTwo = rollScore
            
            ArrayFrameScores.append(frameRolls(rollOneScore: rollOne, rollTwoScore: rollTwo))
            print(ArrayFrameScores)
            
            playerCount += 1
            if playerCount == ArrayPlayerNamesStr.count{
                playerCount = 0
            }
            
            frameCount += 1
            rollCount = "First"
            
            tenPinDown.isHidden = false
            ninePinDown.isHidden = false
            eightPinDown.isHidden = false
            sevenPinDown.isHidden = false
            sixPinDown.isHidden = false
            fivePinDown.isHidden = false
            fourPinDown.isHidden = false
            threePinDown.isHidden = false
            twoPinDown.isHidden = false
        }
        
        
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



