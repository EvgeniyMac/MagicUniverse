//
//  VideoCollectionView.swift
//  MagicUniverseTest
//
//  Created by Evgeniy Suprun on 16/05/2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import UIKit


class FirstCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
  
     
    
    init() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.1058823529, blue: 0.1490196078, alpha: 1)
        
        delegate = self
        dataSource = self
        
        register(VideoCollectionCell.self, forCellWithReuseIdentifier: VideoCollectionCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        isPagingEnabled = true
        
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let cellCount = 4

        return cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionCell.reuseId, for: indexPath)
      
    
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
 
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

    

