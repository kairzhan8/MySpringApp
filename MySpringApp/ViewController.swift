//
//  ViewController.swift
//  MySpringApp
//
//  Created by Kairzhan Kural on 8/17/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet var label: SpringLabel!
    @IBOutlet var viewSpring: SpringView!
    @IBOutlet var button: SpringButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSpring.layer.cornerRadius = 10
        button.layer.cornerRadius = 10
        button.setTitle("Run animation", for: .normal)
        label.text = "Press run button"
    }
    
    @IBAction func run(_ sender: SpringButton) {
        switch sender.tag {
        case PressedTimeButtonTag.one.rawValue:
            zoomInAnimation(viewSpring)
            sender.tag = 2
        case PressedTimeButtonTag.two.rawValue:
            slideUpAnimation(viewSpring)
            sender.tag = 3
        case PressedTimeButtonTag.three.rawValue:
            fallAnimation(viewSpring)
            sender.tag = 1
        default:
            return
        }
    }
    
    func zoomInAnimation(_ layer: Springable) {
        layer.animation = "zoomIn"
        layer.curve = "easeIn"
        layer.duration = 1
        layer.scaleX = 1.2
        layer.scaleY = 1.2
        layer.rotate = 2.5
        layer.velocity = 0.5
        label.text = layer.animation
        button.setTitle("slideUp", for: .normal)
        layer.animate()
    }
    
    func slideUpAnimation(_ layer: Springable) {
        layer.animation = "slideUp"
        layer.curve = "spring"
        layer.duration = 1
        label.text = layer.animation
        button.setTitle("fall", for: .normal)
        layer.animate()
    }
    
    func fallAnimation(_ layer: Springable) {
        layer.animation = "fall"
        layer.curve = "linear"
        layer.duration = 1
        label.text = layer.animation
        button.setTitle("zoomIn", for: .normal)
        layer.animate()
    }
}

enum PressedTimeButtonTag: Int {
    case one = 1
    case two = 2
    case three = 3
}
