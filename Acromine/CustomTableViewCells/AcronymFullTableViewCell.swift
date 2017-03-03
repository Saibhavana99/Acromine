//
//  AcronymFullTableViewCell.swift
//  Acromine
//
//  Created by Bhavana on 03/03/17.
//  Copyright © 2017 Sai Bhavana. All rights reserved.
//

import UIKit

final class AcronymFullTableViewCell: UITableViewCell,Reusable {
    @IBOutlet private weak var FullFormLabel: UILabel!
    @IBOutlet private weak var SinceLabel: UILabel!
    @IBOutlet private weak var FrequencyLabel: UILabel!
    
    func fill(_ dict: NSDictionary) {
        FullFormLabel.text = dict.value(forKey: "lf") as! String?
        if let since = dict.value(forKey:"since") as? NSNumber
        {
            SinceLabel.text = "Usage Since : "+"\(since)"
        }
        if let frequency = dict.value(forKey:"freq") as? NSNumber
        {
            FrequencyLabel.text = "Frequency : "+"\(frequency)"
        }
    }
}

