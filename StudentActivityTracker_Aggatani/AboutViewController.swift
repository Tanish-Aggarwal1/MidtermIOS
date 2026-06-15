//
//  AboutViewController.swift
//  StudentActivityTracker_Aggatani
//
//  Created by Tanish Aggarwal on 2026-06-15.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var skillsLabel: UILabel!

    var skills: Set<String> = [
        "Swift",
        "Xcode",
        "UIKit",
        "Auto Layout",
        "iOS Development",
        "Storyboard",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        displaySkills()
    }

    func displaySkills() {

        let sortedSkills = skills.sorted()

        // Join all skills with a separator
        skillsLabel.text = sortedSkills.joined(separator: " · ")
    }

}
