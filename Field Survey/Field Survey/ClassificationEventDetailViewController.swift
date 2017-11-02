//
//  ClassificationEventDetailViewController.swift
//  Field Survey
//
//  Created by Aidan Madden on 11/1/17.
//  Copyright © 2017 Aidan Madden. All rights reserved.
//

import UIKit

class ClassificationEventDetailViewController: UIViewController {
   
    var classificationEvent: ClassificationEvent?
    
    var dateFormatter = DateFormatter()
    
    @IBOutlet weak var classificationIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Observation"
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        if let date = classificationEvent?.date {
            dateLabel.text = dateFormatter.string(from: date)
        } else {
            dateLabel.text = ""
        }
       
        classificationIconImageView.image = classificationEvent?.classification.image
        titleLabel.text = classificationEvent?.title
        descriptionLabel.text = classificationEvent?.description
        
        
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
