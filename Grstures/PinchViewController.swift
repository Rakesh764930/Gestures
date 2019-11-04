//
//  PinchViewController.swift
//  Grstures
//
//  Created by MacStudent on 2019-11-02.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class PinchViewController: UIViewController {

    @IBOutlet weak var file: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        addPinchGesture()
      

        // Do any additional setup after loading the view.
    }
    func addPinchGesture() {
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(sender:)))
         file.addGestureRecognizer(pinch)
     }
  
    
    @objc func handlePinchGesture(sender: UIPinchGestureRecognizer) {
        if let view = sender.view {
          view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1.0
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
           let colorTop =  UIColor(red: 155.0/255.0, green: 149.0/255.0, blue: 25.0/255.0, alpha: 1.0).cgColor
           let colorBottom = UIColor(red: 155.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
           
           let gradientLayer = CAGradientLayer()
           gradientLayer.colors = [colorTop, colorBottom]
           gradientLayer.locations = [0.0, 1.0]
           gradientLayer.frame = self.view.bounds
           
           self.view.layer.insertSublayer(gradientLayer, at:0)
       }
   }
