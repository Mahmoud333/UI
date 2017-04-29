//
//  ViewController UI069.swift
//  BM 3 Segment (DailyUI 068)
//
//  Created by Mahmoud Hamad on 4/23/17.
//  Copyright © 2017 Mahmoud SMGL. All rights reserved.
//

import UIKit

class ViewController_UI069: UIViewController, CAAnimationDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var GradientV: UIView!
    
    
    ////TABLE VIEW {
    @IBOutlet weak var tableView: UITableView!
    
    let AroundMe = ["1","2"]
    let Country = ["3","4","5","1","2","6","7"]
    let World = ["6","7"]
    
    var tableData = [String]()
    
    var oldSegmentedIndex = -1
    var actualSegmentedIndex = 0
    
    ////} TABLE VIEW
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableData = AroundMe
        //tableView.estimatedRowHeight = 300
        tableView.rowHeight = 320
        
        currentTableYOffset = tableView.contentOffset.y
        /*
        let topColor = UIColor(red: (15/255.0),green: (118/255.0), blue: (128/255.0), alpha: 1)
        let bottomColor = UIColor(red: (84/255.0), green: (187/255.0), blue: (187/255.0), alpha: 1)
        
        var gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]?
        
        gradientLayer.frame =  GradientV.bounds
        GradientV.layer.insertSublayer(gradientLayer, at: 0)
        
        UIView.animate(withDuration: 2, delay: 2, options: [], animations: {
            
            //gradientColors += [bottomColor.cgColor]
            
            //self.GradientV.reloadInputViews()
            //self.GradientV.layer.insertSublayer(gradientLayer, at: 0)
            
        }, completion: nil)
        */
        
    }

    var gradient : CAGradientLayer?;
    
    //let Darkblue = UIColor(red: (15/255.0),green: (118/255.0), blue: (128/255.0), alpha: 1).cgColor
    //let Lightblue = UIColor(red: (84/255.0), green: (187/255.0), blue: (187/255.0), alpha: 1).cgColor
    
    
    //[ UIColor.blue.cgColor, UIColor.blue.cgColor]
    //[ UIColor.red.cgColor, UIColor.red.cgColor]
    
    
    //diff colors
    
    //var toColors: [CGColor] = [UIColor(red: (15/255.0),green: (118/255.0), blue: (128/255.0), alpha: 1).cgColor, UIColor(red: (15/255.0),green: (118/255.0), blue: (128/255.0), alpha: 1).cgColor]
    var fromColors = [UIColor(red: (84/255.0), green: (187/255.0), blue: (187/255.0), alpha: 1).cgColor, UIColor(red: (84/255.0), green: (187/255.0), blue: (187/255.0), alpha: 1).cgColor]
    
    var toColors: [CGColor] = [UIColor.red.cgColor, UIColor.orange.cgColor]
    //var fromColors: [CGColor] = [UIColor.orange.cgColor,UIColor.red.cgColor, UIColor.green.cgColor]
    
    
    var alwaysColors = [UIColor(red: (84/255.0), green: (187/255.0), blue: (187/255.0), alpha: 1).cgColor, UIColor(red: (15/255.0),green: (118/255.0), blue: (128/255.0), alpha: 1).cgColor]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.gradient = CAGradientLayer()
        self.gradient?.frame = GradientV.bounds//self.view.bounds//GradientV.frame
        self.gradient?.colors = fromColors//[ UIColor.red.cgColor, UIColor.red.cgColor]
        //self.view.layer.insertSublayer(self.gradient!, at: 0)
        
        self.gradient?.locations = [0.0, 0.5, 1.0]
        self.gradient?.startPoint = CGPoint(x: 0.0, y: 0.0)//1.0 0.0//0.0 0.5
        self.gradient?.endPoint = CGPoint(x: 1.0, y: 1.0)//0.0 1.0//0.5 0.0
            
        GradientV.layer.insertSublayer(self.gradient!, at: 0)
        
        animateLayer()
    }
    
    func animateLayer(){
        
        //var fromColors = self.gradient?.colors
        //let toColors: [AnyObject] = [ UIColor.blue.cgColor, UIColor.blue.cgColor]
        self.gradient?.colors = toColors // You missed this line
        var animation : CABasicAnimation = CABasicAnimation(keyPath: "colors")
        
        animation.fromValue = fromColors
        animation.toValue = toColors
        animation.duration = 10.00
        animation.isRemovedOnCompletion = true
        animation.fillMode =  kCATransitionFromLeft//kCATransitionReveal//, kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.delegate = self

        
        self.gradient?.add(animation, forKey:"animateGradient")
    }
    //2nd part of anim background part in viewDidAppear 2nd in this func
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        self.toColors = self.fromColors;
        self.fromColors = self.gradient?.colors as! [CGColor]
        animateLayer()
    }
    //delegate method when anim stop starts it again
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    ////TABLE VIEW
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as? ImageCell {
            
 
            if showTransition {
                
                //cell.configuerCell(img: tableData[indexPath.row], Trans: "Right")
                //cell.configuerCell(img: tableData[indexPath.row], Trans: "Left")
                print()
                //if currentTableYOffset > previousTableYOffset { //going down, in DidScroll
                    print("currentTableYOffset > previousTableYOffset")
                    cell.configuerCell(img: tableData[indexPath.row], Trans: trans)
                    
                //} else if currentTableYOffset < previousTableYOffset { //going up, in DidScroll
                    print("currentTableYOffset < previousTableYOffset")
                    
                    //cell.configuerCell(img: tableData[indexPath.row], Trans: trans)
                //}
                
                //Push Right and Left
                /*
                if oldSegmentedIndex < actualSegmentedIndex {
                    
                    cell.configuerCell(img: tableData[indexPath.row], Trans: "Right")
                } else if oldSegmentedIndex > actualSegmentedIndex {
                    
                    cell.configuerCell(img: tableData[indexPath.row], Trans: "Left")
                }
                */
 
                //showTransition = false
            } else { //without transition
                
                cell.ImageV.image = UIImage(named: tableData[indexPath.row]) //Image
            }
                
            return cell
        }
        return UITableViewCell()
    }
    var currentTableYOffset: CGFloat = 0.0 //in VDL we set it once
    var previousTableYOffset: CGFloat = 0.0
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        previousTableYOffset = currentTableYOffset
        currentTableYOffset = tableView.contentOffset.y
        
        if currentTableYOffset > previousTableYOffset { //going down
            print("currentTableYOffset > previousTableYOffset")
            
            trans = "up"
        } else if currentTableYOffset < previousTableYOffset { //going up
            print("currentTableYOffset < previousTableYOffset")
            
            trans = "down"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    /*
    func animateImageView() {
        CATransaction.begin()
        
        CATransaction.setAnimationDuration(animationDuration)
        CATransaction.setCompletionBlock {
            let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(self.switchingInterval * NSTimeInterval(NSEC_PER_SEC)))
            dispatch_after(delay, dispatch_get_main_queue()) {
                self.animateImageView()
            }
        }
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        /*
         transition.type = kCATransitionPush
         transition.subtype = kCATransitionFromRight
         */
        imageView.layer.addAnimation(transition, forKey: kCATransition)
        imageView.image = images[index]
        
        CATransaction.commit()
        
        index = index < images.count - 1 ? index + 1 : 0
    }*/
    
    //Segment
    
    var showTransition = false
    var trans = "down"
    
    @IBAction func SegmentPressed(_ sender: UISegmentedControl) {
        oldSegmentedIndex = actualSegmentedIndex
        actualSegmentedIndex = sender.selectedSegmentIndex
        trans = "down"
        if sender.selectedSegmentIndex == 0 {
            tableData = AroundMe
        } else if sender.selectedSegmentIndex == 1 {
            tableData = Country
        } else if sender.selectedSegmentIndex == 2 {
            tableData = World
        }
        showTransition = true
        tableView.reloadData()

    }
    //reload the data and know we went right or left so we use push left or right

}
