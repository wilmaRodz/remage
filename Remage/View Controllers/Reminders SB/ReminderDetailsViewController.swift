//
//  ReminderDetailsViewController.swift
//  Remage
//
//  Created by macbook on 8/13/20.
//  Copyright © 2020 WilmaRodz. All rights reserved.
//

import UIKit

class ReminderDetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    var themeController: ThemeController?
    var reminderController: ReminderController?
    
    var reminder: Reminder?
    
    var titleLabel = UILabel()
    var noteTextView = UITextView()
    var photoImageView = UIImageView()
    
    // MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Update Views
    
    private func updateViews() {
        addSubViews()
        
        setTitleLabel()
        setNoteTextView()
        setPhotoImageView()
    }
    
    private func addSubViews() {
        view.addSubview(titleLabel)
        view.addSubview(noteTextView)
        view.addSubview(photoImageView)
    }
    
    // Title Label
    private func setTitleLabel() {
        guard let reminder = reminder else { return }
        
        // 1.   Text Attributes
        
        var titleString = ""
        
        // From Reminder
        if let title = reminder.title,
            !title.isEmpty {
            
            titleString = title
            
        // Else, display Empty Title message
        } else {
            titleString = "Update Title"
        }
        
        // Attributes
        let titleAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        let attributedText = NSMutableAttributedString(string: titleString, attributes: titleAttributes)
        
        // 2.   Setup
        
        titleLabel.attributedText = attributedText
        titleLabel.textAlignment = .center
        
        // 3.   Constraint
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    private func setNoteTextView() {
        guard let reminder = reminder else { return }

        // 1.   Text Attributes

        var noteString = ""

        // From Reminder
        if let note = reminder.note,
            !note.isEmpty {

            noteString = note

        // Else, display No Note message
        } else {
            noteString = "No Note"
        }

        // Attributes
        let noteAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        let attributedText = NSMutableAttributedString(string: noteString, attributes: noteAttributes)
        
        // 2.   Setup
        
        noteTextView.attributedText = attributedText
        noteTextView.textAlignment = .center
        
        // 3.   Constraint
        
        noteTextView.translatesAutoresizingMaskIntoConstraints = false
        
        noteTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        noteTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        noteTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        //noteTextView.bottomAnchor.constraint(equalTo: photoImageView.topAnchor, constant: -20).isActive = true
    }
    
    private func setPhotoImageView() {
        
        guard let reminder = reminder,
            let imageData = reminder.defaultImage,
            let image = UIImage(data: imageData) else { return }
        
        // 2.   Setup
        
        photoImageView.image = image
        
        // 3.   Constraint
        
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor).isActive = true
        
        photoImageView.topAnchor.constraint(equalTo: noteTextView.bottomAnchor, constant: 20).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
}
