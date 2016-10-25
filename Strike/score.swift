//
//  score.swift
//  Strike
//
//  Created by Shanee Dahler on 17/10/2016.
//  Copyright © 2016 Shanee Dahler. All rights reserved.
//

import Foundation

public class Score{
    public var individualThrows: [Int] = []
    public var individualThrowsData: [String] = []
    public var cumulativeFrameScores: [Int] = []
    public var cumulativeFrameScoresData: [String] = []
    public var cumulativeScore = Int()
    public var isFinalised = Bool()
    var scoredFrames = Int()
    var throwsMade = Int()
    var calculateSingleStrikeFrameNine = Bool()
    var scoreData: [String] = []
    var scoreBoxFormats: [String] = []
    
    var queuedFrameCondition = String()
    var standard = "Standard"
    var singleStrike = "SingleStrike"
    var doubleStrike = "DoubleStrike"
    var tripleStrike = "TripleStrike"
    var spare = "Spare"
    var bonusThrow = "BonusThrow"
    
   public func Score(){
        cumulativeScore = 0
        scoredFrames = 0
        throwsMade = 0;
        isFinalised = false;
        queuedFrameCondition = "STANDARD"
        calculateSingleStrikeFrameNine = false
    
    }
    
    public func Score(LoadedScoreData: String){
        scoreData = LoadedScoreData.components(separatedBy: String ("-"))
        throwsMade = Int(scoreData[0])!
        scoredFrames = Int(scoreData[1])!
        cumulativeScore = Int(scoreData[2])!
        isFinalised = Bool(scoreData[3])!
        calculateSingleStrikeFrameNine = Bool(scoreData[4])!
        individualThrowsData = scoreData[5].components(separatedBy: String("~"))
        var individualThrowsIndex = 0
        while individualThrowsIndex < 21 {
            individualThrows[individualThrowsIndex] = Int(individualThrowsData[individualThrowsIndex])!
            individualThrowsIndex += 1
            
        }
        cumulativeFrameScoresData = scoreData[6].components(separatedBy: String("~"))
        var cumulativFrameScoreIndex = 0
        while cumulativFrameScoreIndex < 10 {
            cumulativeFrameScores[cumulativFrameScoreIndex] = Int(cumulativeFrameScoresData[cumulativFrameScoreIndex])!
            cumulativFrameScoreIndex += 1
        }
        scoreBoxFormats = scoreData[7].components(separatedBy: String("~"))
        queuedFrameCondition = scoreData[8]
        
    }
    
    public func update(pinsKnockedDown: Int){
        individualThrows[throwsMade] = pinsKnockedDown
        throwsMade += 1
        
        if throwsMade <= 18 {
            
            if throwsMade % 2 == 1 {
                
                if pinsKnockedDown == 10 {
                    scoreBoxFormats[throwsMade - 1] = "   "
                    scoreBoxFormats[throwsMade] = "  X"
                    individualThrows[throwsMade] = 0
                    throwsMade += 1;
                }
                else{
                    scoreBoxFormats[throwsMade - 1] = "  " + String(pinsKnockedDown)
                }
            }
            else{
                if (individualThrows[throwsMade - 2] + individualThrows[throwsMade - 1]) == 10{
                    scoreBoxFormats[throwsMade - 1] = "  /"
                }
                else{
                    scoreBoxFormats[throwsMade - 1] = "  " + String(pinsKnockedDown)
                }
            }
        }
        else if throwsMade == 19{
            if pinsKnockedDown == 10{
                scoreBoxFormats[throwsMade - 1] = "  X"
            }
            else{
                scoreBoxFormats[throwsMade - 1] = "  " + String(pinsKnockedDown)
            }
        }
        else if throwsMade == 20{
            if (individualThrows[18] + individualThrows[19]) < 10 {
                isFinalised = true
            }
        }
    }
    
    



}
