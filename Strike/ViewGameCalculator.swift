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
    
    var ArrayPlayerOne: [Int] = []
    var ArrayPlayerTwo: [Int] = []
    var ArrayPlayerThree: [Int] = []
    var ArrayPlayerFour: [Int] = []
    var ArrayPlayerFive: [Int] = []
    var ArrayPlayerSix: [Int] = []
    
    var YFloatPoint = CGFloat(20)
    var scrollViewContentSize = CGFloat(60)
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
    
    
    
    var rollCount = "First"
    var rollCounter = 0
    var frames = 9
    var rollOne = Int()
    var rollTwo = Int()
    var xFrame = 127
    var yFrame = 60
    
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
    
    var ArrayPlayerScores: [Int] = []
    var ArrayFrameScores: [frameRolls] = []
    
    struct frameRolls {
        var player = Int()
        var rollOneScore = Int()
        var rollTwoScore = Int()
    }
    
    override func viewDidLoad() {
        scrollView.contentInset.top = -45
        scoreCard().CreateScoreCardLabels(view: view)
        
        CreatePlayerNameArray()
        CreatePlayerLabels()
        playerQty = ArrayPlayerNamesStr.count
        
    }

    @IBAction func pinsKnockedDown(_ sender: UIButton) {
      //  print(sender.tag)
        let rollScore = sender.tag
        ArrayPlayerScores.append(rollScore)
        SetScore(rollScore: rollScore)
        
        playInfoLabel.text = "\(ArrayPlayerNamesStr[playerCount]) is rolling \(rollCount) roll for frame \(frameCount)"
        
    }
    
    func SetScore(rollScore: Int){
        
        hidePins(rollScore: rollScore)
        AppendPlayerIndividualThrow(rollScore: rollScore)
        
        if rollCount == "First" {
            rollOne = rollScore
            
            switch rollScore {
            case 0:
                rollCount = "Second"
                scoreCard().displayScoreInput(xFrame: xFrame, yFrame: yFrame,rollScore: "-", view: scrollView)
                
            case 10:
                currentScore = rollScore
                scoreCard().displayScoreInput(xFrame: xFrame + 20, yFrame: yFrame,rollScore: "X", view: scrollView)
                ArrayFrameScores.append(frameRolls(player: playerCount, rollOneScore: rollOne, rollTwoScore: 0))
                AppendPlayerIndividualThrow(rollScore: 0)
                scoreCard().displayScoreInput(xFrame: xFrame + 10, yFrame: yFrame + 20,rollScore: String(currentScore), view: scrollView)
                
                playerCount += 1
                if playerCount == ArrayPlayerNamesStr.count{
                    playerCount = 0
                    frameCount += 1
                    xFrame += 25
                    yFrame = 60
                }
                    
                else{
                    xFrame = 107 + ( 45 * (frameCount - 1))
                    yFrame += 40
                }
                
                print(ArrayFrameScores)
                
            default:
                rollCount = "Second"
                scoreCard().displayScoreInput(xFrame: xFrame, yFrame: yFrame,rollScore: String(rollScore), view: scrollView)
            }
            
           xFrame += 20
            
            
            
        }
        else if rollCount == "Second"{
            rollTwo = rollScore
            frameScore = (rollOne + rollTwo)
            ArrayFrameScores.append(frameRolls(player: playerCount ,rollOneScore: rollOne, rollTwoScore: rollTwo))
            print(ArrayFrameScores)
            
            switch playerCount {
            case 0:
                ArrayPlayerOne.append(rollScore)
                currentScorePlayerOne += frameScore
                currentScore = currentScorePlayerOne
                
            case 1:
                ArrayPlayerTwo.append(rollScore)
                currentScorePlayerTwo += frameScore
                currentScore = currentScorePlayerTwo
            case 2:
                ArrayPlayerThree.append(rollScore)
                currentScorePlayerThree += frameScore
                currentScore = currentScorePlayerThree
            case 3:
                ArrayPlayerFour.append(rollScore)
                currentScorePlayerFour += frameScore
                currentScore = currentScorePlayerFour
            case 4:
                ArrayPlayerFive.append(rollScore)
                currentScorePlayerFive += frameScore
                currentScore = currentScorePlayerFive
            case 5:
                ArrayPlayerSix.append(rollScore)
                currentScorePlayerSix += frameScore
                currentScore = currentScorePlayerSix
            default:
                break;
            }
            
            switch rollScore{
            case 0:
                scoreCard().displayScoreInput(xFrame: xFrame, yFrame: yFrame,rollScore: "-", view: scrollView)
            case 10:
                scoreCard().displayScoreInput(xFrame: xFrame, yFrame: yFrame, rollScore: "X", view: scrollView)
                
                
            default:
                if frameScore == 10 {
                    scoreCard().displayScoreInput(xFrame: xFrame, yFrame: yFrame,rollScore: "/", view: scrollView)
                }
                else{
              scoreCard().displayScoreInput(xFrame: xFrame, yFrame: yFrame,rollScore: String(rollScore), view: scrollView)
                }
            }
            
            
            
            playerCount += 1
            
            
            scoreCard().displayScoreInput(xFrame: xFrame - 10, yFrame: yFrame + 20,rollScore: String(currentScore), view: scrollView)
            
            
            if playerCount == ArrayPlayerNamesStr.count{
                playerCount = 0
                frameCount += 1
                xFrame += 25
                yFrame = 60
                rollCounter += 1
            }
                
            else{
                xFrame = 127 + ( 45 * (frameCount - 1))
                yFrame += 40
            }
            
            
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
        if frameCount > 10{
            if frameScore == 10 {
                rollCount = "Third"
            }else{
                tenPinDown.isHidden = true
                ninePinDown.isHidden = true
                eightPinDown.isHidden = true
                sevenPinDown.isHidden = true
                sixPinDown.isHidden = true
                fivePinDown.isHidden = true
                fourPinDown.isHidden = true
                threePinDown.isHidden = true
                twoPinDown.isHidden = true
                onePinDown.isHidden = true
                zeroPinDown.isHidden = true
            }
            
            print(ArrayPlayerOne)
            print(ArrayPlayerOne.count)
            print(ArrayPlayerTwo)
            print(ArrayPlayerTwo.count)
            print(ArrayPlayerThree)
            print(ArrayPlayerThree.count)
            print(ArrayPlayerFour)
            print(ArrayPlayerFour.count)
            print(ArrayPlayerFive)
            print(ArrayPlayerFive.count)
            print(ArrayPlayerSix)
            print(ArrayPlayerSix.count)
            }
        if rollCount == "Third" {
            rollOne = rollScore
            
            switch rollScore {
            case 0:
                scoreCard().displayScoreInput(xFrame: xFrame, yFrame: yFrame,rollScore: "-", view: scrollView)
                
            case 10:
                scoreCard().displayScoreInput(xFrame: xFrame + 20, yFrame: yFrame,rollScore: "X", view: scrollView)
                ArrayFrameScores.append(frameRolls(player: playerCount, rollOneScore: rollOne, rollTwoScore: 0))
                AppendPlayerIndividualThrow(rollScore: 0)
                scoreCard().displayScoreInput(xFrame: xFrame + 10, yFrame: yFrame + 20,rollScore: String(currentScore), view: scrollView)
                
                playerCount += 1
                if playerCount == ArrayPlayerNamesStr.count{
                    playerCount = 0
                    frameCount += 1
                    xFrame += 25
                    yFrame = 60
                }
                    
                else{
                    xFrame = 107 + ( 45 * (frameCount - 1))
                    yFrame += 40
                }
                
                print(ArrayFrameScores)
                
            default:
                scoreCard().displayScoreInput(xFrame: xFrame, yFrame: yFrame,rollScore: String(rollScore), view: scrollView)
            }
            
            xFrame += 20
            
            
        }
    }
    
    func AppendPlayerIndividualThrow(rollScore: Int){
        switch playerCount {
        case 0:
            ArrayPlayerOne.append(rollScore)
        case 1:
            ArrayPlayerTwo.append(rollScore)
        case 2:
            ArrayPlayerThree.append(rollScore)
        case 3:
            ArrayPlayerFour.append(rollScore)
        case 4:
            ArrayPlayerFive.append(rollScore)
        case 5:
            ArrayPlayerSix.append(rollScore)
        default:
            break;
        }
        
    }
    func hidePins(rollScore: Int){
        switch rollScore {
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
        case 8:
            tenPinDown.isHidden = true
            ninePinDown.isHidden = true
            eightPinDown.isHidden = true
            sevenPinDown.isHidden = true
            sixPinDown.isHidden = true
            fivePinDown.isHidden = true
            fourPinDown.isHidden = true
            threePinDown.isHidden = true
            
        case 7:
            tenPinDown.isHidden = true
            ninePinDown.isHidden = true
            eightPinDown.isHidden = true
            sevenPinDown.isHidden = true
            sixPinDown.isHidden = true
            fivePinDown.isHidden = true
            fourPinDown.isHidden = true
            
        case 6:
            tenPinDown.isHidden = true
            ninePinDown.isHidden = true
            eightPinDown.isHidden = true
            sevenPinDown.isHidden = true
            sixPinDown.isHidden = true
            fivePinDown.isHidden = true
        
        case 5:
            tenPinDown.isHidden = true
            ninePinDown.isHidden = true
            eightPinDown.isHidden = true
            sevenPinDown.isHidden = true
            sixPinDown.isHidden = true
            
        case 4:
            tenPinDown.isHidden = true
            ninePinDown.isHidden = true
            eightPinDown.isHidden = true
            sevenPinDown.isHidden = true
            
        case 3:
            tenPinDown.isHidden = true
            ninePinDown.isHidden = true
            eightPinDown.isHidden = true
            
        case 2:
            tenPinDown.isHidden = true
            ninePinDown.isHidden = true
            
        case 1:
            tenPinDown.isHidden = true
            
        default:
            break;
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



