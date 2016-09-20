//
//  ViewPlayerQty.swift
//  Strike
//
//  Created by Shanee Dahler on 20/09/2016.
//  Copyright © 2016 Shanee Dahler. All rights reserved.
//

import Foundation
import UIKit


class ViewPlayerQty: ViewController {
    
    @IBOutlet var ButtonOnePlayer: UIButton!
    @IBOutlet var ButtonTwoPlayer: UIButton!
    @IBOutlet var ButtonThreePlayer: UIButton!
    @IBOutlet var ButtonFourPlayer: UIButton!
    @IBOutlet var ButtonFivePlayer: UIButton!
    
    var PlayerQty = Int()
    var LabelText = String()
    
    
    @IBAction func ButtonOnePlayerPress(sender: AnyObject) {
        PlayerQty = 1
    }
    
    @IBAction func ButtonTwoPlayerPress(sender: AnyObject) {
        PlayerQty = 2
    }
    
    @IBAction func ButtonThreePlayerPress(sender: AnyObject) {
        PlayerQty = 3
    }
    
    @IBAction func ButtonFourPlayerPress(sender: AnyObject) {
        PlayerQty = 4
    }
    
    @IBAction func ButtonFivePlayerPress(sender: AnyObject) {
        PlayerQty = 5
    }
    
    override func viewDidLoad() {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : ViewPlayerName = segue.destinationViewController as! ViewPlayerName
        
        DestViewController.PlayerQty = PlayerQty
    }
}