//
//  ViewController.swift
//  StudentActivityTracker_Aggatani
//
//  Created by Tanish Aggarwal on 2026-06-15.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoImageView.alpha = 0
            UIView.animate(withDuration: 2) {
                self.logoImageView.alpha = 1
            }
    }

    
    @IBAction func profileTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToProfile", sender: nil)
    }
    
    @IBAction func coursesTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToCourses", sender: nil)
    }

    @IBAction func activitiesTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToActivities", sender: nil)
    }

    @IBAction func aboutTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToAbout", sender: nil)
    }
}

