//
//  LongPressViewController.swift
//  Grstures
//
//  Created by MacStudent on 2019-11-02.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class LongPressViewController: UIViewController {

    @IBOutlet weak var file: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let longPress=UILongPressGestureRecognizer(target: self, action: #selector(addLongPress))
        longPress.minimumPressDuration = 0.5
        file.addGestureRecognizer(longPress)
        // Do any additional setup after loading the view.
    }

    @objc func addLongPress(sender:UILongPressGestureRecognizer)
    {
        if sender.state == .began
        {
            
                    let alert = UIAlertController(title: "Long Press invoked", message: "You have pressed this icon for more than a second  ", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    
                    self.present(alert, animated: true)
        }
       
    
    }
    /*    // MARK: - Navigation

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
             let colorTop =  UIColor(red: 255.0/25.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
             let colorBottom = UIColor(red: 25.0/255.0, green: 94.0/25.0, blue: 58.0/255.0, alpha: 1.0).cgColor
             
             let gradientLayer = CAGradientLayer()
             gradientLayer.colors = [colorTop, colorBottom]
             gradientLayer.locations = [0.0, 1.0]
             gradientLayer.frame = self.view.bounds
             
             self.view.layer.insertSublayer(gradientLayer, at:0)
         }

}
