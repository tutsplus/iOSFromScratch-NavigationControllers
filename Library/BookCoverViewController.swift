//
//  BookCoverViewController.swift
//  Library
//
//  Created by Bart Jacobs on 07/12/15.
//  Copyright © 2015 Envato Tuts+. All rights reserved.
//

import UIKit

class BookCoverViewController: UIViewController {

    @IBOutlet var bookCoverView: UIImageView!
    
    var book: [String: String]!
    
    // MARK: -
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fileName = book["Cover"] {
            bookCoverView.image = UIImage(named: fileName)
            bookCoverView.contentMode = .ScaleAspectFit
        }
    }

}
