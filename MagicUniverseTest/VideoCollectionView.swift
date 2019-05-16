//
//  VideoCollectionView.swift
//  MagicUniverseTest
//
//  Created by Evgeniy Suprun on 16/05/2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import UIKit


class VideoCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    
    let cells = ["ETi99JQIHVg","ETi99JQIHVg","ETi99JQIHVg","ETi99JQIHVg"]
    
    
    init() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = #colorLiteral(red: 0.113761507, green: 0.1048973277, blue: 0.150441885, alpha: 1)
        
        delegate = self
        dataSource = self
        
        register(VideoCollectionCell.self, forCellWithReuseIdentifier: VideoCollectionCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionCell.reuseId, for: indexPath)
      

        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
 
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

    

