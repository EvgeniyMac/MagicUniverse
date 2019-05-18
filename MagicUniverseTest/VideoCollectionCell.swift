//
//  VideoCollectionCell.swift
//  MagicUniverseTest
//
//  Created by Evgeniy Suprun on 16/05/2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class VideoCollectionCell: UICollectionViewCell {
    
     let cells = ["ETi99JQIHVg","ETi99JQIHVg","ETi99JQIHVg","ETi99JQIHVg"]
    
    struct YouTubeConstant {
        static let playerVars = [
            "autoplay": 1,
            "playsinline": 1,
            "controls": 0,
            "showinfo": 0,
            "autohide": 1
            // "origin" : "http://www.youtube.com" as AnyObject
        ] as [String : Any]
    }
    
    static let reuseId = "VideoCollectionCell"

    
    let mainImageView: WKYTPlayerView = {
        let image = WKYTPlayerView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.load(withVideoId: "ETi99JQIHVg", playerVars: YouTubeConstant.playerVars)
        return image
    }()
    

        

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainImageView)

        
        
        // MARK: First collection view image view cell constraints
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive =  true
        mainImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        

}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
