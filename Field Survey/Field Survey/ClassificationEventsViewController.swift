//
//  ClassificationEventsViewController.swift
//  Field Survey
//
//  Created by Aidan Madden on 11/1/17.
//  Copyright © 2017 Aidan Madden. All rights reserved.
//

import UIKit

class ClassificationEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var classificationEventsTableView: UITableView!
    
    let classificationEvent = ClassificationEventsJSONLoader.load(fileName: "field_observations")

    let dateFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
 
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  //WATCH BELOW
        return classificationEvent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classificationEventCell", for: indexPath)
        
        if let cell = cell as? ClassificationEventTableViewCell {
            let classificationEvents = classificationEvent[indexPath.row]
            cell.classificationIconImageView.image = classificationEvents.classification.image
            cell.titleLabel.text = classificationEvents.title
            cell.dateLabel.text = dateFormatter.string(from: classificationEvents.date)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ClassificationEventDetailViewController,
            let row = classificationEventsTableView.indexPathForSelectedRow?.row{
            destination.classificationEvent = classificationEvent[row]
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
