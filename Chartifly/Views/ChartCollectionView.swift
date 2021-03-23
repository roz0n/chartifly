//
//  ChartCollectionView.swift
//  Chartifly
//
//  Created by Arnaldo Rozon on 3/22/21.
//

import UIKit

private let reuseIdentifier = "ChartCollectionCell"

class ChartCollectionView: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var activePage: Int = 0
    
    fileprivate func playActivePageSong() {
        if activePage <= mockAudioData.count {
            let songToPlay = mockAudioData[activePage]
            AudioPlayerManager.shared.playAudio(from: songToPlay.previewUrl)
            print("Playing song:", songToPlay.title)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        self.collectionView!.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.isPagingEnabled = true
        
        // Always autoplay the first song
        playActivePageSong()
    }
    
}

// MARK: - UIScrollViewDelegate

extension ChartCollectionView {
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let viewWidth = scrollView.bounds.size.width
        let currentPage = Int(ceil(offsetX/viewWidth))
        
        print("Active page:", currentPage)
        
        if currentPage != activePage {
            activePage = currentPage
            playActivePageSong()
        }
    }
    
}

// MARK: - UICollectionViewDataSource

extension ChartCollectionView {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockAudioData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ChartCollectionCell
        cell.song = mockAudioData[indexPath.row]
        cell.contentView.backgroundColor = (indexPath.row % 2) == 0 ? .systemBlue : .systemPink
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        return
    }
    
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        return
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ChartCollectionView {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
