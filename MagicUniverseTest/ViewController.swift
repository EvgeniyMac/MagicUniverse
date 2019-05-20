//
//  ViewController.swift
//  MagicUniverseTest
//
//  Created by Evgeniy Suprun on 16/05/2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIScrollViewDelegate {

  

    
    private var collectionViewFirst = FirstCollectionView()
    private var collectionViewSecond = SecondCollectionView()
    private var collectionViewThird = ThirdCollectionView()
    private var cellsVideo = VideoCollectionCell()
    
    var scrollView = UIScrollView()
    let youTubeLabel = UILabel()
    let pagecontrol = UIPageControl()
    let secondCollectionLabel = UILabel()
    let thirdCollectionLabel = UILabel()
    
    var scrollingTimer = Timer()
    var counter = 0
    //var presentControllerButton = UIButton.init(type: UIButton.ButtonType.system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1.1)
  
        
        youTubeLabel.text = "YouTube API"
        youTubeLabel.translatesAutoresizingMaskIntoConstraints = false
        youTubeLabel.textColor = .white
        youTubeLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        
        pagecontrol.numberOfPages = cellsVideo.cells.count
        pagecontrol.translatesAutoresizingMaskIntoConstraints = false
        pagecontrol.currentPage = 0
        
        
        scrollingTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(autoChangeImage), userInfo: nil, repeats: true)
        
  
        secondCollectionLabel.text = "PlayList Name"
        secondCollectionLabel.translatesAutoresizingMaskIntoConstraints = false
        secondCollectionLabel.textColor = .white
        secondCollectionLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        

        thirdCollectionLabel.text = "PlayList Name"
        thirdCollectionLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdCollectionLabel.textColor = .white
        thirdCollectionLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        
        view.backgroundColor = #colorLiteral(red: 0.113761507, green: 0.1048973277, blue: 0.150441885, alpha: 1)
      //  scrollView.addSubview(youTubeLabel)
        scrollView.addSubview(youTubeLabel)
        scrollView.addSubview(collectionViewFirst)
        scrollView.addSubview(pagecontrol)
        scrollView.addSubview(secondCollectionLabel)
        scrollView.addSubview(collectionViewSecond)
        scrollView.addSubview(thirdCollectionLabel)
        scrollView.addSubview(collectionViewThird)
        view.addSubview(scrollView)
        

        // MARK: YouTubeLabel constraints
        
         youTubeLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
         youTubeLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 18).isActive = true

        
        // MARK: First Collection View Constraints
        collectionViewFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionViewFirst.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collectionViewFirst.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionViewFirst.topAnchor.constraint(equalTo: youTubeLabel.bottomAnchor, constant: 10).isActive = true
        collectionViewFirst.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        // MARK: PageControl constraints
        pagecontrol.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pagecontrol.topAnchor.constraint(equalTo: collectionViewFirst.bottomAnchor, constant: 0).isActive = true
        
        // MARK: Second Label Play List Name
         secondCollectionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
         secondCollectionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive =  true
        //secondCollectionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondCollectionLabel.topAnchor.constraint(equalTo: pagecontrol.bottomAnchor, constant: 0).isActive = true
    
                // MARK: Second Collection View Constraints
        collectionViewSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionViewSecond.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        // collectionViewSecond.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        collectionViewSecond.topAnchor.constraint(equalTo: secondCollectionLabel.bottomAnchor, constant: 5).isActive = true
        collectionViewSecond.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        // MARK: Third Label Play List Name
        thirdCollectionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        thirdCollectionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive =  true
        //sthirdCollectionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdCollectionLabel.topAnchor.constraint(equalTo: collectionViewSecond.bottomAnchor, constant: 8).isActive = true
        
        // MARK:  Third Collection View Constraints
        collectionViewThird.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionViewThird.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        // collectionViewThird.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        collectionViewThird.topAnchor.constraint(equalTo: thirdCollectionLabel.bottomAnchor, constant: 8).isActive = true
        collectionViewThird.heightAnchor.constraint(equalToConstant: 150).isActive = true
    
}
    // AutoScroll Timer method
    @objc func autoChangeImage() {
        if counter < cellsVideo.cells.count {
          let index = IndexPath.init(item: counter, section: 0)
            self.collectionViewFirst.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pagecontrol.currentPage = counter
         counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionViewFirst.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pagecontrol.currentPage = counter
    }
    
}
    

    // MARK: Hide Status bar
    override var prefersStatusBarHidden: Bool {
        return true
  }
    

    
}
