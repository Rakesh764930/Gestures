//
//  ScreenEdgeViewController.swift
//  Grstures
//
//  Created by MacStudent on 2019-11-02.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ScreenEdgeViewController: UIViewController {

    @IBOutlet weak var file: UIImageView!
    var currentRadius=0.0
    override func viewDidLoad() {
        super.viewDidLoad()
 let screenEdge=UIScreenEdgePanGestureRecognizer(target: self, action: #selector(addScreenEdge))
        screenEdge.edges = .left
        file.addGestureRecognizer(screenEdge)
        // Do any additional setup after loading the view.
    }
    
    @objc func addScreenEdge(sender:UIScreenEdgePanGestureRecognizer)
    {
        if sender.state == .ended {
               // 2
               if currentRadius==360.0 {
                   currentRadius=0.0
               }

               UIView.animate(withDuration: 1.0, animations: {
                   self.currentRadius += 90.0
                self.file.transform = CGAffineTransform(rotationAngle: CGFloat(self.currentRadius * .pi / 180.0))
               })
    }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/25.0, green: 149.0/25.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 25.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }

}
