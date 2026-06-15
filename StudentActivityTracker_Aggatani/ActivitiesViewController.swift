//
//  ActivitiesViewController.swift
//  StudentActivityTracker_Aggatani
//
//  Created by Tanish Aggarwal on 2026-06-15.
//

import UIKit

class ActivitiesViewController: UIViewController {

    @IBOutlet weak var activitiesTextView: UITextView!
    
    var activities: [String] = [
            "Assignment Submission",
            "Midterm Exam",
            "Project Meeting",
            "Final Presentation"
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        displayActivities()
    }
    
    func displayActivities() {
            var displayText = ""

            for (index, activity) in activities.enumerated() {
                displayText += "\(index + 1). \(activity)\n\n"
            }

            // If array is empty show a message
            if activities.isEmpty {
                activitiesTextView.text = "No activities yet. Tap + to add one."
            } else {
                activitiesTextView.text = displayText
            }
        }
    
    @IBAction func addActivityTapped(_ sender: UIButton) {

        let alert = UIAlertController(
                title: "Add Activity",
                message: "Enter the name of your new activity",
                preferredStyle: .alert)
            
            // Add text field
            alert.addTextField { field in
                field.placeholder = "e.g. Study Session"
                field.autocapitalizationType = .sentences
            }
            
            // Add button — reads from text field and appends to Array
            let addAction = UIAlertAction(title: "Add", style: .default) { _ in
                
                // Get text from the field, trim whitespace
                if let activityName = alert.textFields?[0].text,
                   !activityName.trimmingCharacters(in: .whitespaces).isEmpty {
                    
                    // Append to activities Array
                    self.activities.append(activityName)
                    
                    // Refresh display
                    self.displayActivities()
                    
                    // MARK: - Fade-in animation (Week 5)
                    self.activitiesTextView.alpha = 0
                    UIView.animate(withDuration: 0.6) {
                        self.activitiesTextView.alpha = 1
                    }
                }
            }
            
            // Cancel button
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(addAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true)
        }
    
    @IBAction func removeActivityTapped(_ sender: UIButton) {

        guard !activities.isEmpty else {
                let emptyAlert = UIAlertController(
                    title: "No Activities",
                    message: "There are no activities to remove.",
                    preferredStyle: .alert)
                emptyAlert.addAction(UIAlertAction(title: "OK", style: .default))
                present(emptyAlert, animated: true)
                return
            }
            
            // Create action sheet listing all activities
            let alert = UIAlertController(
                title: "Remove Activity",
                message: "Select an activity to remove",
                preferredStyle: .actionSheet)
            
            // Add one button per activity in the Array
            for (index, activity) in activities.enumerated() {
                let action = UIAlertAction(title: activity, style: .destructive) { _ in
                    
                    // Remove selected activity from Array by index
                    self.activities.remove(at: index)
                    
                    // Refresh display
                    self.displayActivities()
                    
                    self.activitiesTextView.alpha = 0
                            UIView.animate(withDuration: 0.6) {
                                self.activitiesTextView.alpha = 1
                            }
                }
                alert.addAction(action)
            }
            
            // Cancel button
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            present(alert, animated: true)
        }

}
