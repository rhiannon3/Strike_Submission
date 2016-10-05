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
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func ButtonOnePressed(_ sender: AnyObject) {
        PlayerQty = 1
    }
    
    @IBAction func ButtonTwoPressed(_ sender: AnyObject) {
        PlayerQty = 2
    }
    
    @IBAction func ButtonThreePressed(_ sender: AnyObject) {
        PlayerQty = 3
    }

    @IBAction func ButtonFourPressed(_ sender: AnyObject) {
        PlayerQty = 4
    }
    
    @IBAction func ButtonFivePressed(_ sender: AnyObject) {
        PlayerQty = 5
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "PlayerQtySegue") {
            let DestViewController : ViewPlayerName = segue.destination as! ViewPlayerName
            DestViewController.PlayerQty = PlayerQty
            print(PlayerQty)
        }
    }
    
}
