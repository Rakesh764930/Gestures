//
//  SwipeViewController.swift
//  Grstures
//
//  Created by MacStudent on 2019-11-04.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {

    @IBOutlet weak var swipeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
          let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
              
          leftSwipe.direction = .left
          rightSwipe.direction = .right

          view.addGestureRecognizer(leftSwipe)
          view.addGestureRecognizer(rightSwipe)
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
            
        if (sender.direction == .left) {
                print("Swipe Left")
            let labelPosition = CGPoint(x: swipeLabel.frame.origin.x - 50.0, y: swipeLabel.frame.origin.y)
            swipeLabel.frame = CGRect(x: labelPosition.x, y: labelPosition.y, width: swipeLabel.frame.size.width, height: swipeLabel.frame.size.height)
        }
            
        if (sender.direction == .right) {
            print("Swipe Right")
            let labelPosition = CGPoint(x: self.swipeLabel.frame.origin.x + 50.0, y: self.swipeLabel.frame.origin.y)
            swipeLabel.frame = CGRect(x: labelPosition.x, y: labelPosition.y, width: self.swipeLabel.frame.size.width, height: self.swipeLabel.frame.size.height)
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

}
