//
//  FancyButton.swift
//  BM 3 Segment (DailyUI 068)
//
//  Created by Mahmoud Hamad on 4/20/17.
//  Copyright © 2017 Mahmoud SMGL. All rights reserved.
//

import UIKit

@IBDesignable
class FancyButton: UIButton {
    
    //Border
    @IBInspectable var BorderColor: UIColor = UIColor.clear {
        didSet {
            print("@IBInspectable")
            self.layer.borderColor = BorderColor.cgColor
        }
    }
    
    @IBInspectable var BorderWidth: CGFloat = 0.0 {
        didSet {
            print("@IBInspectable")
            self.layer.borderWidth = BorderWidth
        }
    }
    
    //Curve
    @IBInspectable var Circle: Bool = false {
        didSet {
            print("@IBInspectable")
            self.layer.cornerRadius = self.layer.bounds.width / 2
        }
    }
    
    @IBInspectable var CurveBorder: Bool = false {
        didSet {
            print("@IBInspectable")
            self.layer.cornerRadius = self.layer.bounds.height / 2
        }
    }
    
    @IBInspectable var CornerRadius: CGFloat = 0.0 {
        didSet {
            print("@IBInspectable")
            self.layer.cornerRadius = CornerRadius
        }
    }
    
    @IBInspectable var SelectedSMGL: Bool = false
    
    //Selected
    @IBInspectable var SelectedBGColor: UIColor = UIColor.clear {
        didSet {
            print("@IBInspectable")
            //backgroundColor = SelectedBGColor
            setupButton()
        }
    }
    
    @IBInspectable var SelectedTextColor: UIColor = UIColor.clear {
        didSet {
            print("@IBInspectable")
            //titleLabel?.textColor = SelectedTextColor
            //setTitleColor(SelectedTextColor, for: UIControlState.normal)
            setupButton()
        }
    }
    
    //UnSelected
    @IBInspectable var UnSelectedBGColor: UIColor = UIColor.clear  {
        didSet {
            print("@IBInspectable")
            //backgroundColor = UnSelectedBGColor
            setupButton()
        }
    }
        

    @IBInspectable var UnSelectedTextColor: UIColor = UIColor.clear {
        didSet {
            print("@IBInspectable")
            //titleLabel?.textColor = UnSelectedTextColor
            //setTitleColor(UnSelectedTextColor, for: UIControlState.normal)
            setupButton()
        }
    }
    
    var StartAsSelected = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
        
        //backgroundColor = UnSelectedBGColor
        setupButton()
    }
    
    func setupButton(){
        if SelectedSMGL {
            
            if StartAsSelected {
                backgroundColor = SelectedBGColor
                
                setTitleColor(SelectedTextColor, for: .normal)
            } else {
                backgroundColor = UnSelectedBGColor
                
                setTitleColor(UnSelectedTextColor, for: .normal)
            }
            
        } else {
            

        }
    }
    
    
//    override open var isHighlighted: Bool {
//        didSet {
//            //backgroundColor = isHighlighted ? UIColor.clear : UIColor.white
////            if isHighlighted {
////                backgroundColor = UIColor.lightGray
////                print("is Highlighted")
////            } else {
////                backgroundColor = UIColor.white
////                print("not Highlighted")
////            }
//        }
//    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        print(backgroundColor)
        
        if SelectedSMGL {
        
            if backgroundColor == SelectedBGColor {
                backgroundColor = UnSelectedBGColor
                
                setTitleColor(UnSelectedTextColor, for: .normal)
            } else {  //self.backgroundColor == self.UnSelectedBGColor
                backgroundColor = SelectedBGColor
                
                setTitleColor(SelectedTextColor, for: .normal)
            }
            
        } else {
            
        }
    }
 
}
