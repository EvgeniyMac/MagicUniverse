//
//  ViewController.swift
//  MagicUniverseTest
//
//  Created by Evgeniy Suprun on 16/05/2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var youTubeLabel: UILabel!

    
    private var scrollViewFirst = VideoCollectionView()
    
    let pagecontrol = UIPageControl()
    
    var scrollingTimer = Timer()
    var counter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        pagecontrol.numberOfPages = scrollViewFirst.cells.count
        pagecontrol.translatesAutoresizingMaskIntoConstraints = false
        pagecontrol.currentPage = 0
        scrollViewFirst.isPagingEnabled = true
        
        scrollingTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(autoChangeImage), userInfo: nil, repeats: true)
        
        
        view.backgroundColor = #colorLiteral(red: 0.113761507, green: 0.1048973277, blue: 0.150441885, alpha: 1)
        view.addSubview(scrollViewFirst)
        view.addSubview(pagecontrol)
        
        
        // MARK: Scroll view constraints
        scrollViewFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        scrollViewFirst.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        scrollViewFirst.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        scrollViewFirst.topAnchor.constraint(equalTo: youTubeLabel.bottomAnchor, constant: 20).isActive = true
        scrollViewFirst.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        // MARK: PageControl constraints
        pagecontrol.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pagecontrol.topAnchor.constraint(equalTo: scrollViewFirst.bottomAnchor, constant: 10).isActive = true
    
}
    // AutoScroll Timer method
    @objc func autoChangeImage() {
        if counter < scrollViewFirst.cells.count {
          let index = IndexPath.init(item: counter, section: 0)
            self.scrollViewFirst.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pagecontrol.currentPage = counter
         counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.scrollViewFirst.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pagecontrol.currentPage = counter
    }
    
}
    // MARK: Hide Status bar 
    override var prefersStatusBarHidden: Bool {
        return true
  }
    

    
}
