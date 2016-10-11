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
    var scrollViewContentSize = CGFloat(60)

    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        scrollView.contentInset.top = -45
        
        CreateScoreCardLabels()
        
        CreatePlayerLabels()
    }
    
    func CreateScoreCardLabels(){
        
        var frameLabelQty = 0
        var xFrame = CGFloat(135)
        var xPoint = CGFloat(135)
        
        let label = UILabel(frame: CGRect(x: 0,y: 0,width: 70, height: 20))
        label.center = CGPoint(x: 70, y: 135)
        label.textAlignment = NSTextAlignment.center
        label.text = "Names"
        label.textColor = UIColor.red
        label.font = UIFont.boldSystemFont(ofSize: 18)
        self.view.addSubview(label)
        
        CreateFrameRectMain(xFrame: 70, yFrame: 0, width: 85, height: 20, xPoint: 70, yPoint: 135)
        
        self.view.addSubview(label)
        
        while frameLabelQty != 9 {
            CreateFrameRectMain(xFrame: Int(xFrame), yFrame: 0, width: 45, height: 20, xPoint: Int(xPoint), yPoint: 135)
            
            let scoreCardLabel = UILabel(frame: CGRect(x: xFrame, y: 0, width: 45, height: 20))
            scoreCardLabel.center = CGPoint(x: xPoint, y: 135)
            scoreCardLabel.textAlignment = NSTextAlignment.center
            scoreCardLabel.text = "\(frameLabelQty + 1)"
            scoreCardLabel.textColor = UIColor.red
            scoreCardLabel.font = UIFont.boldSystemFont(ofSize: 18)
            
           self.view.addSubview(scoreCardLabel)
            xFrame += 46
            xPoint += 45
            frameLabelQty += 1
        }
        /*let frameLabelRect = UIView(frame: CGRect(x: xFrame, y: 0, width: 65, height: 20))
        frameLabelRect.center = CGPoint(x: xPoint + 10, y: 135)
        frameLabelRect.layer.borderWidth = 1
        frameLabelRect.layer.borderColor = UIColor.black.cgColor*/
        
        CreateFrameRectMain(xFrame: Int(xFrame), yFrame: 0, width: 65, height: 20, xPoint: Int(xPoint + 10), yPoint: 135)
        
        let scoreCardLabel = UILabel(frame: CGRect(x: xFrame, y: 0, width: 65, height: 20))
        scoreCardLabel.center = CGPoint(x: xPoint + 10, y: 135)
        scoreCardLabel.textAlignment = NSTextAlignment.center
        scoreCardLabel.text = "\(frameLabelQty + 1)"
        scoreCardLabel.textColor = UIColor.red
        scoreCardLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        self.view.addSubview(scoreCardLabel)
        //self.view.addSubview(frameLabelRect)
        
    }
    
    func CreatePlayerLabels(){
        for textField in ArrayPlayerNames {
            userInput = textField.text!
            if userInput == "" {
                userInput = "Player \(playerCount)"
            }
            playerCount += 1
            YFloatPoint += 40
            CreateLabel()
            CreateScoreCard()
        }
    }
    
  func CreateLabel() {
    let label = UILabel(frame: CGRect(x: 0,y: 0,width: 70, height: 20))
        label.center = CGPoint(x: 70, y: YFloatPoint)
        label.textAlignment = NSTextAlignment.right
        label.text = "\(userInput):"
        label.textColor = UIColor.red
        label.font = UIFont.boldSystemFont(ofSize: 16)
    
        scrollView.addSubview(label)
        scrollViewContentSize += 45
        scrollView.contentSize = CGSize(width: 200, height:scrollViewContentSize)
        
    }
    
    func CreateScoreCard(){
        var frameQty = 0
        var xFrame = CGFloat(135)
        var xPoint = CGFloat(135)
        var frameRoll = 0
        var xPointRoll = CGFloat(135)
        
        CreateFrameRect(xFrame: 70, yFrame: 0, width: 85, height: 40, xPoint: 70, yPoint: Int(YFloatPoint + 10))
        
        while frameQty != 9 {
            CreateFrameRect(xFrame: Int(xFrame), yFrame: 0, width: 45, height: 40, xPoint: Int(xPoint), yPoint: Int(YFloatPoint + 10))
    
            while frameRoll != 2{
                CreateFrameRect(xFrame: Int(xFrame - 2.5), yFrame: 0, width: 20, height: 20, xPoint: Int(xPointRoll - 7.5), yPoint: Int(YFloatPoint))
                frameRoll += 1
                xPointRoll += 20
            }
            xPointRoll += 5
            frameRoll = 0
            xFrame += 46
            xPoint += 45
            frameQty += 1
        }
        
        CreateFrameRect(xFrame: Int(xFrame), yFrame: 0, width: 65, height: 40, xPoint: Int(xPoint + 10), yPoint: Int(YFloatPoint + 10))
        
        while frameRoll != 3{
            CreateFrameRect(xFrame: Int(xFrame - 2.5), yFrame: Int(YFloatPoint), width: 20, height: 20, xPoint: Int(xPointRoll - 7.5), yPoint: Int(YFloatPoint))
            frameRoll += 1
            xPointRoll += 20
        }
        
    }
    
    func CreateFrameRect(xFrame: Int, yFrame: Int, width: Int, height: Int, xPoint: Int, yPoint: Int){
        let frameRect = UIView(frame: CGRect(x: xFrame, y: yFrame, width: width, height: height))
        frameRect.center = CGPoint(x: xPoint, y: yPoint)
        frameRect.layer.borderWidth = 1
        frameRect.layer.borderColor = UIColor.black.cgColor
        scrollView.addSubview(frameRect)
    }
    
    func CreateFrameRectMain(xFrame: Int, yFrame: Int, width: Int, height: Int, xPoint: Int, yPoint: Int){
        let frameRect = UIView(frame: CGRect(x: xFrame, y: yFrame, width: width, height: height))
        frameRect.center = CGPoint(x: xPoint, y: yPoint)
        frameRect.layer.borderWidth = 1
        frameRect.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(frameRect)
    }
}


