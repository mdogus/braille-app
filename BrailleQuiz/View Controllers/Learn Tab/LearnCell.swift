//
//  LearnCell.swift
//  BrailleQuiz
//
//  Created by MUSTAFA DOĞUŞ on 19.02.2020.
//  Copyright © 2020 MUSTAFA DOĞUŞ. All rights reserved.
//

import UIKit

class LearnCell: UITableViewCell {

    @IBOutlet weak var printLabel: UILabel!
    @IBOutlet weak var brailleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
