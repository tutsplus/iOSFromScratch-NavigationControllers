//
//  AuthorsViewController.swift
//  Library
//
//  Created by Bart Jacobs on 06/12/15.
//  Copyright © 2015 Envato Tuts+. All rights reserved.
//

import UIKit

class AuthorsViewController: UITableViewController {

    let CellIdentifier = "Cell Identifier"
    let SegueBooksViewController = "BooksViewController"
    
    var authors = [AnyObject]()
    
    // MARK: -
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Title
        title = "Authors"
        
        let filePath = NSBundle.mainBundle().pathForResource("Books", ofType: "plist")
        
        if let path = filePath {
            authors = NSArray(contentsOfFile: path) as! [AnyObject]
        }
        
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: CellIdentifier)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == SegueBooksViewController {
            if let indexPath = tableView.indexPathForSelectedRow, let author = authors[indexPath.row] as? [String: AnyObject]  {
                let destinationViewController = segue.destinationViewController as! BooksViewController
                destinationViewController.author = author
            }
        }
    }
    
    // MARK: -
    // MARK: Table View Data Source Methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return authors.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Dequeue Resuable Cell
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath)
        
        if let author = authors[indexPath.row] as? [String: AnyObject], let name = author["Author"] as? String {
            // Configure Cell
            cell.textLabel?.text = name
        }
        
        return cell;
    }
    
    // MARK: -
    // MARK: Table View Delegate Methods
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Perform Segue
        performSegueWithIdentifier(SegueBooksViewController, sender: self)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}
