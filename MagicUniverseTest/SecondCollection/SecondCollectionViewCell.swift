//
//  SecondCollectionViewCell.swift
//  MagicUniverseTest
//
//  Created by Evgeniy Suprun on 17/05/2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class SecondCollectionViewCell: UICollectionViewCell {
    
    let cells = ["ETi99JQIHVg","ETi99JQIHVg","ETi99JQIHVg","ETi99JQIHVg"]
    
    // FIX IT!!!
    struct YouTubeConstant {
        static let playerVars = [
            "modesbranding": 1,
            "playsinline": 1,
            "controls": 1,
            "showinfo": 1,
            "origin" : "http://www.youtube.com"
            ] as [String : Any]
    }

    static let reuseIdSecond = "SecondCollectionCell"
    
    let secondImageView: WKYTPlayerView = {
        let image = WKYTPlayerView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.load(withVideoId: "ujAZgERqcUM", playerVars: YouTubeConstant.playerVars)
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
        label.textColor = #colorLiteral(red: 0.4901960784, green: 0.4862745098, blue: 0.5098039216, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        addSubview(secondImageView)
        addSubview(labelName)
        addSubview(labelNumberSaws)
        
        
        

        
        // MARK: Second collection view image view cell constraints
        secondImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        secondImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive =  true
        secondImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        secondImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.65).isActive = true
       //  secondImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
      
        
        //MARK: LabelName constraint
        labelName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        labelName.trailingAnchor.constraint(equalTo: trailingAnchor).isActive =  true
        labelName.topAnchor.constraint(equalTo: secondImageView.bottomAnchor, constant: 5).isActive = true
        
        //MARK: labelNumberSaws constraint
        labelNumberSaws.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        labelNumberSaws.trailingAnchor.constraint(equalTo: trailingAnchor).isActive =  true
        labelNumberSaws.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 3).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
