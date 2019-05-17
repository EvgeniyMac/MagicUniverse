//
//  ThirdCollectionViewCell.swift
//  MagicUniverseTest
//
//  Created by Evgeniy Suprun on 17/05/2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class ThirdCollectionViewCell: UICollectionViewCell {
    
    let cells = ["ETi99JQIHVg","ETi99JQIHVg","ETi99JQIHVg","ETi99JQIHVg"]
    
    
    static let reuseIdThird = "ThirdCollectionViewCell"
    
    
    let thirdImageView: WKYTPlayerView = {
        let image = WKYTPlayerView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.load(withVideoId: "g9FBFZM7bW8")
        return image
    }()
    
    let labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Meteora"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        return label
    }()
    
    let labelNumberSaws: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1 808 894 просмотра"
        label.textColor = #colorLiteral(red: 0.4901698828, green: 0.4858396053, blue: 0.51063627, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(thirdImageView)
        addSubview(labelName)
        addSubview(labelNumberSaws)
        
        
        
        // MARK: Second collection view image view cell constraints
        thirdImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        thirdImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive =  true
        thirdImageView.topAnchor.constraint(equalTo: topAnchor,constant: 0).isActive = true
        thirdImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        // thirdImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        //MARK: LabelName constraint
        labelName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        labelName.trailingAnchor.constraint(equalTo: trailingAnchor).isActive =  true
        labelName.topAnchor.constraint(equalTo: thirdImageView.bottomAnchor, constant: 5).isActive = true
        
        //MARK: labelNumberSaws constraint
        labelNumberSaws.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        labelNumberSaws.trailingAnchor.constraint(equalTo: trailingAnchor).isActive =  true
        labelNumberSaws.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 3).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
