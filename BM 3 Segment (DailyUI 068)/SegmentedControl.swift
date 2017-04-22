//
//  SegmentedControl.swift
//  BM 3 Segment (DailyUI 068)
//
//  Created by Mahmoud Hamad on 4/20/17.
//  Copyright © 2017 Mahmoud SMGL. All rights reserved.

//http://www.appdesignvault.com/custom-segmented-control-swift-tutorial/

import UIKit

@IBDesignable
class SegmentedControl: UIControl { //when it inherits from UIControl thats what all the controls in ur storyboard inherits from
    
    
    
    private var labels = [UILabel]()
    var thumbView = UIView()
    
    @IBInspectable var items : [String] = ["Round Trip", "One Way", "Multi-City"] {
        didSet {
            setupLabels()
        }
    }
    
    //really important for our segmented Control
    //make things really easy, say item 1 is selected then it will highlight it visualize it
    var selectedIndex: Int = 0 {
        didSet {
            displayNewSelectedIndex()
        }
    }
    
    //initializers that are required or that may be called by creating a UI Control
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    //the func that all init methods will call first
    func setupView() {
        
        //layer is part of uicontrol
        layer.cornerRadius = frame.height / 2
        layer.borderColor = UIColor(white: 0.7, alpha: 1.0).cgColor//(white: 1.0, alpha: 0.5).cgColor
        layer.borderWidth = 2
        
        backgroundColor = UIColor.clear
        
        setupLabels()
        
        //insert the thumbView at index 0 to make sure that order that they sit on sort of stage that youre looking at is correct
        insertSubview(thumbView, at: 0)
    }
    
    func setupLabels() {
        for label in labels {
            label.removeFromSuperview()
        }
        
        //once we remove that 
        
        //we can also remove it from our array 
        labels.removeAll(keepingCapacity: true)
        
        //now loop through count
        for index in 1...items.count {
            let label = UILabel(frame: .zero) //rectangle with x,y 0 and width, height 0
            label.text = items[index - 1]
            label.textAlignment = .center
            label.textColor = UIColor(white: 0.5, alpha: 1.0)// so its not gonna be transparent at all
            self.addSubview(label)
            labels.append(label)
        }
        
        //color the selected text color
        labels[selectedIndex].textColor = UIColor(white: 1.0, alpha: 1.0)
    }

    
    func displayNewSelectedIndex() {
        var label = labels[selectedIndex] //get the selected label by index
        
        //make all text are same then we change the selected one
        for label in labels {
            label.textColor = UIColor(white: 0.5, alpha: 1.0)
        }
        
        UIView.animate(withDuration: 0.3, delay: 0,
                       options: [ .curveEaseOut], //.repeat, .autoreverse,
                       animations: {
            
        //set the thumbView frame to label.frame
        self.thumbView.frame = label.frame //will put everything in the position
        label.textColor = UIColor(white: 1.0, alpha: 1.0)
                        
        },
                       completion: nil
        )
    }
    
    //there is two methods we need to override inorder for things to work properly, 1 is to layout subviews and the other is to lisen for the touch or respond to the touch
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        //get location where they touched
        let location = touch.location(in: self)
        
        //get calculated index
        var calculatedIndex: Int?
        
        //loop through all labels and get the index and the item
        for(index, item) in labels.enumerated() {
            if item.frame.contains(location) { //we want to look at that location
            //so if the frame contains that point we know that we can now set the calculated index to be the current index
                
                calculatedIndex = index
            }
        }
        
        if calculatedIndex != nil { //meaning we set it, then we set the selected Index
            selectedIndex = calculatedIndex! //we know its set, so we can force it out
            
            sendActions(for: .valueChanged)
        }
        return false
    }

    //once we have that begin tracking with touch all set up here we can go to our layout subvies
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var selectFrame = self.bounds //get the selected frame
        
        //create new width 
        let newWidth = selectFrame.width / CGFloat( items.count )
        selectFrame.size.width = newWidth
        
        //now we can set out thumb view (el nour bta3 selected segment)
        thumbView.frame = selectFrame
        thumbView.backgroundColor = UIColor(white: 0.6, alpha: 1.0) //UIColor.white
        thumbView.layer.cornerRadius = thumbView.frame.height / 2 //wil give us perfectley rounded edge
        
        let labelHeight = self.bounds.height
        let labelWidth = self.bounds.width / CGFloat(labels.count)
        
        //loop thorough all of our labels
        for index in 0...labels.count - 1 { //to included
            var label = labels[index]
            
            let xPostion = CGFloat(index) * labelWidth //this willl be where we place this in X coordinate 
            label.frame = CGRect(x: xPostion, y: 0, width: labelWidth, height: labelHeight)
            
            //basically needed to get all of those variables together so in the end we could call label.frame and put everything in the right position
        }
    }

}
