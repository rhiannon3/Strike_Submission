//
//  scoreCard.swift
//  Strike
//
//  Created by Shanee Dahler on 17/10/2016.
//  Copyright © 2016 Shanee Dahler. All rights reserved.
//

import Foundation
import UIKit

public class scoreCard{
    
   public func CreateFrameRect(xFrame: Int, yFrame: Int, width: Int, height: Int, xPoint: Int, yPoint: Int, view: UIView){
        let frameRect = UIView(frame: CGRect(x: xFrame, y: yFrame, width: width, height: height))
        frameRect.center = CGPoint(x: xPoint, y: yPoint)
        frameRect.layer.borderWidth = 1
        frameRect.layer.borderColor = UIColor.black.cgColor
        view.addSubview(frameRect)
    }
    
    func CreateNameLabels(name: String, YFloatPoint: CGFloat, view: UIView) {
        let label = UILabel(frame: CGRect(x: 0,y: 0,width: 70, height: 20))
        label.center = CGPoint(x: 70, y: YFloatPoint)
        label.textAlignment = NSTextAlignment.right
        label.text = "\(name):"
        label.textColor = UIColor.red
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        view.addSubview(label)
    }

    
    func CreateScoreCard(view: UIView, YFloatPoint: CGFloat){
        var frameQty = 0
        var xFrame = CGFloat(135)
        var xPoint = CGFloat(135)
        var frameRoll = 0
        var xPointRoll = CGFloat(135)
        
        scoreCard().CreateFrameRect(xFrame: 70, yFrame: 0, width: 85, height: 40, xPoint: 70, yPoint: Int(YFloatPoint + 10), view: view)
        
        while frameQty != 9 {
            scoreCard().CreateFrameRect(xFrame: Int(xFrame), yFrame: 0, width: 45, height: 40, xPoint: Int(xPoint), yPoint: Int(YFloatPoint + 10), view: view)
            
            while frameRoll != 2{
                scoreCard().CreateFrameRect(xFrame: Int(xFrame - 2.5), yFrame: 0, width: 20, height: 20, xPoint: Int(xPointRoll - 7.5), yPoint: Int(YFloatPoint), view: view)
                frameRoll += 1
                xPointRoll += 20
            }
            xPointRoll += 5
            frameRoll = 0
            xFrame += 46
            xPoint += 45
            frameQty += 1
        }
        
        scoreCard().CreateFrameRect(xFrame: Int(xFrame), yFrame: 0, width: 65, height: 40, xPoint: Int(xPoint + 10), yPoint: Int(YFloatPoint + 10), view: view)
        
        while frameRoll != 3{
            scoreCard().CreateFrameRect(xFrame: Int(xFrame - 2.5), yFrame: Int(YFloatPoint), width: 20, height: 20, xPoint: Int(xPointRoll - 7.5), yPoint: Int(YFloatPoint), view: view)
            frameRoll += 1
            xPointRoll += 20
        }
    }
    
    func CreateScoreCardLabels(view: UIView){
        
        var frameLabelQty = 0
        var xFrame = CGFloat(135)
        var xPoint = CGFloat(135)
        
        let label = UILabel(frame: CGRect(x: 0,y: 0,width: 70, height: 20))
        label.center = CGPoint(x: 70, y: 135)
        label.textAlignment = NSTextAlignment.center
        label.text = "Names"
        label.textColor = UIColor.red
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        view.addSubview(label)
        
        scoreCard().CreateFrameRect(xFrame: 70, yFrame: 0, width: 85, height: 20, xPoint: 70, yPoint: 135, view: view)
        
        view.addSubview(label)
        
        while frameLabelQty != 9 {
            scoreCard().CreateFrameRect(xFrame: Int(xFrame), yFrame: 0, width: 45, height: 20, xPoint: Int(xPoint), yPoint: 135, view: view)
            
            let scoreCardLabel = UILabel(frame: CGRect(x: xFrame, y: 0, width: 45, height: 20))
            scoreCardLabel.center = CGPoint(x: xPoint, y: 135)
            scoreCardLabel.textAlignment = NSTextAlignment.center
            scoreCardLabel.text = "\(frameLabelQty + 1)"
            scoreCardLabel.textColor = UIColor.red
            scoreCardLabel.font = UIFont.boldSystemFont(ofSize: 18)
            
            view.addSubview(scoreCardLabel)
            
            xFrame += 46
            xPoint += 45
            frameLabelQty += 1
        }
        scoreCard().CreateFrameRect(xFrame: Int(xFrame), yFrame: 0, width: 65, height: 20, xPoint: Int(xPoint + 10), yPoint: 135, view: view)
        
        let scoreCardLabel = UILabel(frame: CGRect(x: xFrame, y: 0, width: 65, height: 20))
        scoreCardLabel.center = CGPoint(x: xPoint + 10, y: 135)
        scoreCardLabel.textAlignment = NSTextAlignment.center
        scoreCardLabel.text = "\(frameLabelQty + 1)"
        scoreCardLabel.textColor = UIColor.red
        scoreCardLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        view.addSubview(scoreCardLabel)
        
    }
    
    func displayScoreInput(xFrame: Int, yFrame: Int, rollScore: String, view: UIView) {
        let label = UILabel(frame: CGRect(x: 0,y: 0,width: 60, height: 20))
        label.center = CGPoint(x: xFrame, y: yFrame)
        label.textAlignment = NSTextAlignment.center
        label.text = "\(rollScore)"
        label.textColor = UIColor.red
        label.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(label)
    }

}

