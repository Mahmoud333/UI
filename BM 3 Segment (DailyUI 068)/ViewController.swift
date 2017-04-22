//
//  ViewController.swift
//  BM 3 Segment (DailyUI 068)
//
//  Created by Mahmoud Hamad on 4/20/17.
//  Copyright © 2017 Mahmoud SMGL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var segment: SegmentedControl!
    
    @IBOutlet weak var FromToStack: UIStackView!
    @IBOutlet weak var DepartingStack: UIStackView!
    @IBOutlet weak var ReturningStack: UIStackView!
    
    @IBOutlet weak var departingReturningStack: UIStackView!
    
    @IBOutlet weak var PlusButton: FancyButton!
    
    var DepartingxPos: CGFloat!
    var ReturningxPos: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //PlusButton.isHidden = true]
        PlusButton.alpha = 0.0
        
        DepartingxPos = DepartingStack.center.x
        ReturningxPos = ReturningStack.center.x
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func newSegmentChanged(_ sender: SegmentedControl) {
        
        if sender.selectedIndex == 1 {
            
            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                
                //self.departingReturningStack.center.x += self.departingReturningStack.bounds.width/2
                
                self.ReturningStack.center.x += self.view.bounds.width
                self.DepartingStack.center.x = self.FromToStack.center.x
                
            }, completion: nil)
        
        } else {
            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                
               // self.departingReturningStack.center.x = self.xPos
                
                self.ReturningStack.center.x = self.ReturningxPos
                self.DepartingStack.center.x = self.DepartingxPos
                
            }, completion: nil)
        }
        
        if sender.selectedIndex == 2 {
            //PlusButton.isHidden = false
            PlusButton.alpha = 1.0
        } else {
            //PlusButton.isHidden = true
            PlusButton.alpha = 0.0
        }
        
    }

}

