//
//  SampleTableViewController.swift
//  SwiftSample
//
//

import UIKit

// We chose to create a table view controller that can open another view controller which will contain
// the BlipparSDKView to demonstrate initialising and shutting down the BlipparSDKViewController subclass.

class SampleTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: .zero)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        // For this example we will have one section only.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // For this example we will have one row only.
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // The cell in the Storyboard must have this identifier.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowBlippsCell", for: indexPath)

        // A simple cell with a label.
        cell.textLabel?.text = "Start Blipping"

        return cell
    }

}
