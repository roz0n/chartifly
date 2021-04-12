//
//  ChartCollectionCell.swift
//  Chartifly
//
//  Created by Arnaldo Rozon on 3/22/21.
//

import UIKit

class ChartCollectionCell: UICollectionViewCell {
    
    var song: Song? {
        didSet {
            configureLabels()
            configureCoverImage()
        }
    }
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var containerStack: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .systemOrange
    }
    
}

// MARK: - UI Configuration

extension ChartCollectionCell {
    
    fileprivate func configureLabels() {
        if let song = song {
            titleLabel.text = song.title
            artistLabel.text = song.artist
            albumLabel.text = song.album
        }
    }
    
    fileprivate func configureCoverImage() {
        // TODO: Use SDWebImage
        
        guard let song = song else { return }
        
        if let url = URL(string: song.artworkUrl) {
            let task = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
                guard let data = data else { return }
                
                if let error = error {
                    print("Error downloading image:", error)
                }
                
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.coverImage.image = image
                }
            }
            
            task.resume()
        }
    }
    
}
