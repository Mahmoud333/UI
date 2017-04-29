//
//  ImageCell.swift
//  BM 3 Segment (DailyUI 068)
//
//  Created by Mahmoud Hamad on 4/25/17.
//  Copyright © 2017 Mahmoud SMGL. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    
    
    @IBOutlet weak var ImageV: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configuerCell(img: String,Trans: String ) {
        
        //the paging animation
        
        if Trans == "up" {
            UIView.transition(with: ImageV, duration: 0.5, options: [.transitionCurlDown], animations: {
                self.ImageV.image = UIImage(named: img)
            }, completion: nil)
        } else if Trans == "down" {
            UIView.transition(with: ImageV, duration: 0.5, options: [.transitionCurlUp], animations: {
                self.ImageV.image = UIImage(named: img)
            }, completion: nil)
        }
        
        //another way that worked really well did push to left and right according to change segment have a video for it on twitter
        /*
        let transition = CATransition()
        
        if Trans == "Right" {
            transition.type = kCATransitionPush //kCICategoryTransition////kCATransitionFade
            transition.subtype = kCATransitionFromRight
        } else if Trans == "Left" {
            transition.type = kCATransitionPush //kCICategoryTransition//kCATransitionFade
            transition.subtype = kCATransitionFromLeft
        }
        /*
         transition.type = kCATransitionPush
         transition.subtype = kCATransitionFromRight
         */
        ImageV.layer.add(transition, forKey: kCATransition)
        ImageV.image = UIImage(named: img)
         */
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
