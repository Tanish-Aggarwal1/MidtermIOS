//
//  ProfileViewController.swift
//  StudentActivityTracker_Aggatani
//
//  Created by Tanish Aggarwal on 2026-06-15.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var programLabel: UILabel!
    @IBOutlet weak var semesterLabel: UILabel!
    
    var studentProfile: [String: String] = [
            "name"     : "Tanish Aggarwal",
            "id"       : "991760172",
            "program"  : "SDNE",
            "semester" : "5"
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text     = studentProfile["name"]
                idLabel.text       = studentProfile["id"]
                programLabel.text  = studentProfile["program"]
                semesterLabel.text = studentProfile["semester"]
    }
    @IBAction func editTapped(_ sender: UIButton) {
        // Create the alert with text fields
            let alert = UIAlertController(
                title: "Edit Profile",
                message: "Update your information",
                preferredStyle: .alert)
            // Add a text field for each piece of info, pre-filled with current values
            alert.addTextField { field in
                field.text = self.studentProfile["name"]
                field.placeholder = "Name"
            }
            alert.addTextField { field in
                field.text = self.studentProfile["id"]
                field.placeholder = "Student ID"
            }
            alert.addTextField { field in
                field.text = self.studentProfile["program"]
                field.placeholder = "Program"
            }
            alert.addTextField { field in
                field.text = self.studentProfile["semester"]
                field.placeholder = "Semester"
            }
            // Save button — reads from text fields, updates dictionary, updates labels
            let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
                // Update the dictionary with new values
                self.studentProfile["name"]     = alert.textFields?[0].text ?? ""
                self.studentProfile["id"]       = alert.textFields?[1].text ?? ""
                self.studentProfile["program"]  = alert.textFields?[2].text ?? ""
                self.studentProfile["semester"] = alert.textFields?[3].text ?? ""
                
                // Refresh the labels on screen
                self.nameLabel.text     = self.studentProfile["name"]
                self.idLabel.text       = self.studentProfile["id"]
                self.programLabel.text  = self.studentProfile["program"]
                self.semesterLabel.text = self.studentProfile["semester"]
            }
            // Cancel button — does nothing
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(saveAction)
            alert.addAction(cancelAction)
            present(alert, animated: true)
    }
}
