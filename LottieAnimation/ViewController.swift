//
//  ViewController.swift
//  LottieAnimation
//
//  Created by KO TING on 15/3/2017.
//  Copyright © 2017年 EdUHK. All rights reserved.
//

import UIKit
import Lottie


class ViewController: UIViewController {
    
    
    @IBOutlet weak var BUTshowAnimation: UIButton!
    var menuOn = false
    var hamburgerMenuButton:LOTAnimationView?
    var hamburgerMenuFrame = CGRect(x: 0, y: 10, width: 75, height: 75)

    override func viewDidLoad() {
        super.viewDidLoad()
        addHamburgerMenuButton(on: menuOn)
    }
    
    func addHamburgerMenuButton (on:Bool)
    {
        if hamburgerMenuButton != nil
        {
            hamburgerMenuButton?.removeFromSuperview()
            hamburgerMenuButton = nil
        }
        
        let animation = on ? "buttonOff" : "buttonOn"
        hamburgerMenuButton = LOTAnimationView.init(name: animation)
        hamburgerMenuButton?.isUserInteractionEnabled = true
        hamburgerMenuButton?.frame = hamburgerMenuFrame
        hamburgerMenuButton?.contentMode = .scaleAspectFill
        
        addMenuToggleRegonizer()
        
        self.view.addSubview(hamburgerMenuButton!)
    }
    
    func addMenuToggleRegonizer()
    {
        let tapRegonizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.toggleMenu(regonizer:)))
        tapRegonizer.numberOfTapsRequired = 1
        hamburgerMenuButton?.addGestureRecognizer(tapRegonizer)
    }
    
    func toggleMenu(regonizer:UITapGestureRecognizer)
    {
        if !menuOn
        {
            hamburgerMenuButton?.play(completion: { (success:Bool) in
                self.menuOn = true
                self.addHamburgerMenuButton(on: self.menuOn)
            })
        }
        else
        {
            hamburgerMenuButton?.play(completion: { (success:Bool) in
                self.menuOn = false
                self.addHamburgerMenuButton(on: self.menuOn)
            })
        }
    }
    
    @IBAction func showAnimation(_ sender: UIButton)
    {
        
        let animationView = LOTAnimationView.init(name: "PinJump")
        animationView?.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 250)
        animationView?.contentMode = .scaleAspectFill
        animationView?.loopAnimation = true
        self.view.addSubview(animationView!)
        
        animationView?.play()
        BUTshowAnimation.isHidden = true
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

