//
//  CoursesViewController.swift
//  StudentActivityTracker_Aggatani
//
//  Created by Tanish Aggarwal on 2026-06-15.
//

import UIKit

class CoursesViewController: UIViewController {

    @IBOutlet weak var coursesTextView: UITextView!
    @IBOutlet weak var totalLabel: UILabel!
    
    var courses: [String] = [
            "iOS app Development",
            "Advanced Enterprise Java Programming",
            "Android App Development",
            "Capstone Prototype Development",
            "Innovation: From Idea to Execution",
            "Software Process Management"
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        displayCourses()
    }
    

    func displayCourses() {

        var displayText = ""

            for (index, course) in courses.enumerated() {
                displayText += "\(index + 1). \(course)\n\n"
            }

            // Set the text view content
            coursesTextView.text = displayText

            // Update total count label
            totalLabel.text = "Total Courses: \(courses.count)"
        }
    
}
