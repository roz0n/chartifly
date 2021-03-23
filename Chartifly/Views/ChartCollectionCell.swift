//
//  ChartCollectionCell.swift
//  Chartifly
//
//  Created by Arnaldo Rozon on 3/22/21.
//

import UIKit

class ChartCollectionCell: UICollectionViewCell {

    // MARK: - IB Outlets
    
    @IBOutlet weak var containerStack: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
