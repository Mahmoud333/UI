//
//  ViewController UI065.swift
//  BM 3 Segment (DailyUI 068)
//
//  Created by Mahmoud Hamad on 4/21/17.
//  Copyright © 2017 Mahmoud SMGL. All rights reserved.
//

import UIKit

class ViewController_UI065: UIViewController {

    @IBOutlet var DescView: UIView!
    
    @IBOutlet weak var pencilBTN: FancyButton!
    
    @IBOutlet weak var BTNs3Stack: UIStackView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(DescView.frame)
        
        //DescView.frame = CGRect(x: pencilBTN.frame.origin.x, y: pencilBTN.frame.origin.y, width: pencilBTN.bounds.width*1.2, height: pencilBTN.bounds.height*1.2)
        
        self.DescView.bounds.size = CGSize(width: self.pencilBTN.bounds.width * 1.25, height: self.pencilBTN.bounds.height * 1.1)
        //self.DescView.bounds.width = self.pencilBTN.bounds.width * 1.4
        //self.DescView.bounds.height = self.pencilBTN.bounds.height * 1.4
        self.DescView.center.x = BTNs3Stack.center.x
        self.DescView.center.y = BTNs3Stack.center.y
        
        print(DescView.frame)
        //DescView.center.x = pencilBTN.center.x
        //DescView.center.y = pencilBTN.center.y + pencilBTN.bounds.height
        DescView.layer.cornerRadius = 14
        view.addSubview(DescView)
        DescView.alpha = 0
        if let textView = self.DescView.subviews[0] as? UITextView {
            textView.alpha = 0.0
        }
        print(DescView.frame)
        print(DescView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func PencilTapped(_ sender: Any) {
        print()
        
        if DescView.alpha == 0 {
            
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            print("transparent at bottom and going up and appearing ")
            
            
            //self.DescView.transform = CGAffineTransform(translationX: 0, y: self.pencilBTN.bounds.height)
            //self.DescView.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            
            /*
            self.DescView.frame = CGRect(x: self.view.center.x-self.DescView.frame.width/2,//self.pencilBTN.frame.origin.x,
                                         y: self.pencilBTN.frame.origin.y,
                                         width: self.pencilBTN.bounds.width*3.0,
                                         height: self.pencilBTN.bounds.height*3.0)
            */
            

            
            self.DescView.bounds.size = CGSize(width: self.view.bounds.width * 0.8, height: self.view.bounds.height * 0.3)
            //self.DescView.bounds.width = self.pencilBTN.bounds.width * 3.0
            //self.DescView.bounds.height = self.pencilBTN.bounds.height * 3.6
            self.DescView.center.x = self.BTNs3Stack.center.x
            self.DescView.center.y = self.BTNs3Stack.center.y - self.DescView.bounds.height * 0.8
            
 
            self.DescView.alpha = 1.0
            print(self.DescView)
        }, completion: { Boool in
            if let textView = self.DescView.subviews[0] as? UITextView {
                textView.alpha = 1.0
            }
            
        })
        
        } else if DescView.alpha == 1 {
            print("at top and visible and will go down and disappear")
            
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                
                //self.DescView.transform = CGAffineTransform(translationX: 0, y: -self.pencilBTN.bounds.height)
                //self.DescView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                
                

                /*
                self.DescView.frame = CGRect(x: self.view.center.x-self.DescView.frame.width/2 ,//self.pencilBTN.frame.origin.x,
                                             y: self.pencilBTN.frame.origin.y ,
                                             width: self.pencilBTN.bounds.width*1.2,
                                             height: self.pencilBTN.bounds.height*1.2)
                */
                

                
                self.DescView.bounds.size = CGSize(width: self.pencilBTN.bounds.width * 1.25, height: self.pencilBTN.bounds.height * 1.1)
                //self.DescView.bounds.width = self.pencilBTN.bounds.width * 1.4
                //self.DescView.bounds.height = self.pencilBTN.bounds.height * 1.4
                self.DescView.center.x = self.BTNs3Stack.center.x
                self.DescView.center.y = self.BTNs3Stack.center.y
                    
                    self.DescView.alpha = 0.0
                print(self.DescView)
            }, completion: { Boool in
                if let textView = self.DescView.subviews[0] as? UITextView {
                    textView.alpha = 0.0
                }
                
            })
        }
    }


}
