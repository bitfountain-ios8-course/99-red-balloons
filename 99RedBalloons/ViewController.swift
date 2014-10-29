//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Gustavo Cunha on 10/29/14.
//  Copyright (c) 2014 Gustavo Cunha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballonNameLabel: UILabel!
    @IBOutlet weak var bgImageView: UIImageView!
    
    var balloons:[Balloon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createBallons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        let balloon = balloons[Int(arc4random_uniform(UInt32(self.balloons.count)))]
        self.ballonNameLabel.text = balloon.name
        self.bgImageView.image = balloon.image
        
        self.ballonNameLabel.hidden = false
    }
    
    private func createBallons() {
        let maxBalloons = 99
        let images = ["RedBalloon1.jpg","RedBalloon2.jpg", "RedBalloon3.jpg", "RedBalloon4.jpg"]
        for var i = 1; i <= maxBalloons; i++ {
            var balloon = Balloon()
            balloon.name = "\(i) balloons"
            balloon.image = UIImage(named: images[Int(arc4random_uniform(UInt32(images.count)))])!
            self.balloons += [balloon]
        }
    }
}

