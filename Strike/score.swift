//
//  score.swift
//  Strike
//
//  Created by Shanee Dahler on 17/10/2016.
//  Copyright © 2016 Shanee Dahler. All rights reserved.
//

import Foundation

public class Score{
    public var individualThrows = Int()
    public var cumulativeFrameScores = Int()
    public var cumulativeScore = Int()
    public var isFinalised = Bool()
    var completedFrames = Int()
    var scoredFrames = Int()
    var throwsMade = Int()
    var calculateSingeStrikeFrameNine = Bool()
    
    var queuedFrameCondition = String()
    var standard = "Standard"
    var singleStrike = "SingleStrike"
    var doubleStrike = "DoubleStrike"
    var tripleStrike = "TripleStrike"
    var spare = "Spare"
    var bonusThrow = "BonusThrow"
    
   public func Score(){
        individualThrows = 21
    
    
    }
    
    



}
