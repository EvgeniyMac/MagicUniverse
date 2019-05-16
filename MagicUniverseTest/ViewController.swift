//
//  ViewController.swift
//  MagicUniverseTest
//
//  Created by Evgeniy Suprun on 16/05/2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class ViewController: UIViewController {

    @IBOutlet weak var youTubeLabel: UILabel!
    
    
    
    private var videoColectionView = VideoCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.113761507, green: 0.1048973277, blue: 0.150441885, alpha: 1)
        view.addSubview(videoColectionView)
        
        videoColectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        videoColectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        videoColectionView.topAnchor.constraint(equalTo: youTubeLabel.bottomAnchor, constant: 20).isActive = true
        videoColectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true

        
        
    }
    
    
    // MARK: Hide Status bar - FIX-ME
    override var prefersStatusBarHidden: Bool {
        return true
}
}
