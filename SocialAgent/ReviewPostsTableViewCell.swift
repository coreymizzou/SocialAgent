//
//  ReviewPostsTableViewCell.swift
//  SocialAgent
//
//  Created by MU IT Program on 4/19/16.
//  Copyright © 2016 TequillaMockingbird. All rights reserved.
//

import UIKit

class ReviewPostsTableViewCell: UITableViewCell {

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
