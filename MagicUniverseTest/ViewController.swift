//
//  ViewController.swift
//  MagicUniverseTest
//
//  Created by Evgeniy Suprun on 16/05/2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import UIKit
import MediaPlayer
import YoutubePlayer_in_WKWebView
import UIKit.UIGestureRecognizerSubclass

class ViewController: UIViewController, WKYTPlayerViewDelegate {

    private var collectionViewFirst = FirstCollectionView()
    private var collectionViewSecond = SecondCollectionView()
    private var collectionViewThird = ThirdCollectionView()
    private var cellsVideo = VideoCollectionCell()
    
    var scrollView = UIScrollView()
    let youTubeLabel = UILabel()
    let pagecontrol = UIPageControl()
    let secondCollectionLabel = UILabel()
    let thirdCollectionLabel = UILabel()
    let popupView = UIView()
    var mainImageView = WKYTPlayerView()
    let sliderModal = UISlider()
    
  //  var scrollingTimer = Timer()
    // var timerModalmusic = Timer()
    var counter = 0
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    
//FIX-IT - MODEL VIEW
        
          addModalSettings()
        
          scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
          scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1.1)
  

          youTubeLabel.text = "YouTube Music"
          youTubeLabel.translatesAutoresizingMaskIntoConstraints = false
          youTubeLabel.textColor = .white
          youTubeLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        
          pagecontrol.numberOfPages = cellsVideo.cells.count
          pagecontrol.translatesAutoresizingMaskIntoConstraints = false
          pagecontrol.currentPage = 0
        
        
//          scrollingTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(autoChangeImage), userInfo: nil, repeats: true)
     //   timerModalmusic = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeUpdate), userInfo: nil, repeats: true)
        
  
           secondCollectionLabel.text = "PlayList Name"
           secondCollectionLabel.translatesAutoresizingMaskIntoConstraints = false
           secondCollectionLabel.textColor = .white
           secondCollectionLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        

           thirdCollectionLabel.text = "PlayList Name"
           thirdCollectionLabel.translatesAutoresizingMaskIntoConstraints = false
           thirdCollectionLabel.textColor = .white
           thirdCollectionLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        
        let closerTitleButton: UIButton = {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            button.setImage(UIImage(named: "open_close"), for: .normal)
            button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 40, bottom: 10, right: 40)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(popupViewTapped(recognizer:)), for: .touchUpInside)
            return button
        }()

           mainImageView.translatesAutoresizingMaskIntoConstraints = false
           mainImageView.layer.cornerRadius = 0
           mainImageView.clipsToBounds = true
           mainImageView.load(withVideoId: "ETi99JQIHVg")
        


          let imageTimer = UIImage(named: "thumb")
          sliderModal.setThumbImage(imageTimer, for: .normal)
          sliderModal.minimumValue = 0.0
        //sliderModal.maximumValue = Float()
        //sliderModal.addTarget(self, action: #selector(sliderFunc(sender:)), for: .valueChanged)
          sliderModal.translatesAutoresizingMaskIntoConstraints = false

        
        // MARK: - timer left for modal View
        let timerModalLeft: UILabel = {
           let timer = UILabel()
           timer.textColor = .white
           timer.font = UIFont.systemFont(ofSize: 12, weight: .light)
           timer.text = "0:32"
           timer.translatesAutoresizingMaskIntoConstraints = false
        return timer
        }()
        
        // MARK: - timer right for modal View
        let timerModalRight: UILabel = {
            let timer = UILabel()
            timer.textColor = .white
            timer.font = UIFont.systemFont(ofSize: 12, weight: .light)
            timer.text = "1:35"
            timer.translatesAutoresizingMaskIntoConstraints = false
            return timer
        }()
        
        let nameSongModalLabel: UILabel = {
            let name = UILabel()
            name.textColor = .white
            name.font = UIFont.systemFont(ofSize: 22, weight: .medium)
            name.text = "Mondo Marcio - Angeli e Demons"
            name.translatesAutoresizingMaskIntoConstraints = false
            return name
        }()
        
        let numberOfSawsModalLabel: UILabel = {
            let name = UILabel()
            name.textColor = .white
            name.font = UIFont.systemFont(ofSize: 15, weight: .light)
            name.text = "1 848 894 просмотра"
            name.translatesAutoresizingMaskIntoConstraints = false
            return name
        }()
        
        let rewardMusicButton: UIButton = {
            let reward = UIButton()
            let image = UIImage(named: "Prev")
            reward.setImage(image, for: .normal)
            reward.translatesAutoresizingMaskIntoConstraints = false
            return reward
        }()
        
        let pauseMusicButton: UIButton = {
            let reward = UIButton()
            let image = UIImage(named: "Pause")
            reward.setImage(image, for: .normal)
            reward.translatesAutoresizingMaskIntoConstraints = false
            return reward
        }()
        
        let nextMusicButton: UIButton = {
            let reward = UIButton()
            let image = UIImage(named: "Next")
            reward.setImage(image, for: .normal)
            reward.translatesAutoresizingMaskIntoConstraints = false
            return reward
        }()
        
        let volumeSlider: UISlider = {
            let slider = UISlider()
           //slider.value = MPVolumeView.setVolume(0.5)
           // slider.minimumTrackTintColor = .white
           slider.minimumValueImage = UIImage(named: "Sound_Min")
           slider.maximumValueImage = UIImage(named: "Sound_Max")
           slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
        }()
        
        
        
        
        view.backgroundColor = #colorLiteral(red: 0.113761507, green: 0.1048973277, blue: 0.150441885, alpha: 1)
        scrollView.addSubview(youTubeLabel)
        scrollView.addSubview(collectionViewFirst)
        scrollView.addSubview(pagecontrol)
        scrollView.addSubview(secondCollectionLabel)
        scrollView.addSubview(collectionViewSecond)
        scrollView.addSubview(thirdCollectionLabel)
        scrollView.addSubview(collectionViewThird)
        view.addSubview(scrollView)
        
        popupView.addSubview(closerTitleButton)
        popupView.addSubview(mainImageView)
        popupView.addSubview(sliderModal)
        popupView.addSubview(timerModalLeft)
        popupView.addSubview(timerModalRight)
        popupView.addSubview(nameSongModalLabel)
        popupView.addSubview(numberOfSawsModalLabel)
        popupView.addSubview(rewardMusicButton)
        popupView.addSubview(pauseMusicButton)
        popupView.addSubview(nextMusicButton)
        popupView.addSubview(pauseMusicButton)
        popupView.addSubview(nextMusicButton)
        popupView.addSubview(volumeSlider)
        layout()
        allConsraints(closerTitleButton, timerModalLeft, timerModalRight, nameSongModalLabel, numberOfSawsModalLabel, rewardMusicButton, pauseMusicButton, nextMusicButton, volumeSlider)
  
        
}
    
    
     // MARK: - Slider Change Value
//    @objc func sliderFunc(sender: UISlider) {
//        if sender == sliderModal {
//            ytPlayer.currentTime = TimeInterval(sliderModal.value)
//        }
//
//    }
    
    
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
    
    
        //FIXIT: - Modal View
    

    
    func addModalSettings() {

            popupView.layer.cornerRadius = 20
            if #available(iOS 11.0, *) {
                popupView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            } else {
                //FIX-IT - need early version
            }
            popupView.clipsToBounds = true
            let color1 = #colorLiteral(red: 0.915286839, green: 0.2501996458, blue: 0.5527306199, alpha: 1).cgColor
            let color2 = #colorLiteral(red: 0.4409026504, green: 0.0633180514, blue: 0.9208388925, alpha: 1).cgColor

            let gradient = CAGradientLayer()
            gradient.frame = self.view.bounds
            gradient.colors = [color1, color2]
            gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
            popupView.layer.addSublayer(gradient)
        

    }
    
    
        private var bottomConstraint = NSLayoutConstraint()
    
        private func layout() {
            popupView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(popupView)
            popupView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            popupView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomConstraint = popupView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 540)
            bottomConstraint.isActive = true
            popupView.heightAnchor.constraint(equalToConstant: 600).isActive = true
        }
    
    
//FIX-IT - MODEL VIEW
    

        private var currentState: State = .closed

//        private lazy var tapRecognizer: UITapGestureRecognizer = {
//            let recognizer = UITapGestureRecognizer()
//            recognizer.addTarget(self, action: #selector(popupViewPanned(recognizer:)))
//            return recognizer
//        }()

        @objc private func popupViewTapped(recognizer: UIButton){
            let state = currentState.opposite
            let transitionAnimator = UIViewPropertyAnimator(duration: 1, dampingRatio: 1, animations: {
                switch state {
                case .open:
                    self.bottomConstraint.constant = 0
                case .closed:
                    self.bottomConstraint.constant = 540
                }
                self.view.layoutIfNeeded()
            })
            transitionAnimator.addCompletion { position in
                switch position {
                case .start:
                    self.currentState = state.opposite
                case .end:
                    self.currentState = state
                case .current:
                    ()
                @unknown default:
                    fatalError()
                }
                switch self.currentState {
                case .open:
                    self.bottomConstraint.constant = 0
                case .closed:
                    self.bottomConstraint.constant = 540
                }
            }
            transitionAnimator.startAnimation()


        }
    

    
//    @objc func timeUpdate() {
//
//        player.volume = musicSlider.value
//        timerForSlider.value = Float(player.currentTime)
//        let currentTime = Int(player.currentTime)
//        let minutes = currentTime / 60
//        let second = currentTime - minutes * 60
//        let procent = Int(player.volume * 100)
//
//        let allTime = Int(player.duration)
//        let minutesAll = allTime / 60
//        let secondAll = allTime - minutesAll * 60
//
//        if procent > 10 {
//            volumeTextLabel.text = String(format: "volume: %02d", procent) as String + "%"
//        } else {
//            volumeTextLabel.text = String(format: "volume: %01d", procent) as String + "%"
//        }
//        timerTextLabel.text = String(format: "%02d:%02d", minutes, second) as String
//        timerTextLabelAll.text = String(format: "%02d:%02d", minutesAll, secondAll) as String
//    }
    
    // MARK: Hide Status bar
    override var prefersStatusBarHidden: Bool {
        return true
  }
    
    
    fileprivate func allConsraints(_ closerTitleButton: UIButton, _ timerModalLeft: UILabel, _ timerModalRight: UILabel, _ nameSongModalLabel: UILabel, _ numberOfSawsModalLabel: UILabel, _ rewardMusicButton: UIButton, _ pauseMusicButton: UIButton, _ nextMusicButton: UIButton, _ volumeSlider: UISlider) {
        //  popupView.addGestureRecognizer(tapRecognizer)
        
        
        // MARK:- YouTubeLabel Constraints
        
        youTubeLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        youTubeLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 18).isActive = true
        
        
        // MARK:- First Collection View Constraints
        collectionViewFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionViewFirst.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collectionViewFirst.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionViewFirst.topAnchor.constraint(equalTo: youTubeLabel.bottomAnchor, constant: 10).isActive = true
        collectionViewFirst.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        // MARK:- PageControl Constraints
        pagecontrol.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pagecontrol.topAnchor.constraint(equalTo: collectionViewFirst.bottomAnchor, constant: 0).isActive = true
        
        // MARK:- Second Label Play List Name Constraints
        secondCollectionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        secondCollectionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive =  true
        secondCollectionLabel.topAnchor.constraint(equalTo: pagecontrol.bottomAnchor, constant: 0).isActive = true
        
        // MARK: Second Collection View Constraints
        collectionViewSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionViewSecond.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionViewSecond.topAnchor.constraint(equalTo: secondCollectionLabel.bottomAnchor, constant: 5).isActive = true
        collectionViewSecond.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        // MARK:- Third Label Play List Name Constraints
        thirdCollectionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        thirdCollectionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive =  true
        thirdCollectionLabel.topAnchor.constraint(equalTo: collectionViewSecond.bottomAnchor, constant: 8).isActive = true
        
        // MARK:- Third Collection View Constraints
        collectionViewThird.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionViewThird.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionViewThird.topAnchor.constraint(equalTo: thirdCollectionLabel.bottomAnchor, constant: 8).isActive = true
        collectionViewThird.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        //MARK:- MODAL VIEW ADD Close and open button Constraints
        
        closerTitleButton.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 0).isActive = true
        closerTitleButton.centerXAnchor.constraint(equalTo: popupView.centerXAnchor).isActive = true
        
        // MARK: - MODAL VIEW ADD VIdeo player on view Constraints
        
        mainImageView.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 0).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: 0).isActive = true
        mainImageView.centerXAnchor.constraint(equalTo: popupView.centerXAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: closerTitleButton.bottomAnchor, constant: 30).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: popupView.heightAnchor, multiplier: 2/5).isActive = true
        
        //MARK: - MODAL VIEW SLider Music Change Control Constraints
        
        sliderModal.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 15).isActive = true
        sliderModal.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -15).isActive = true
        sliderModal.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 15).isActive = true
        sliderModal.centerXAnchor.constraint(equalTo: popupView.centerXAnchor).isActive = true
        sliderModal.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //MARK: - MODAL VIEW - ADD Left timer Label Constraints
        timerModalLeft.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 10).isActive = true
        timerModalLeft.topAnchor.constraint(equalTo: sliderModal.bottomAnchor, constant: 0).isActive = true
        
        //MARK: - MODAL VIEW - ADD Left timer Label Constraints
        timerModalRight.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -10).isActive = true
        timerModalRight.topAnchor.constraint(equalTo: sliderModal.bottomAnchor, constant: 0).isActive = true
        timerModalRight.lastBaselineAnchor.constraint(equalTo: timerModalLeft.firstBaselineAnchor).isActive = true
        
        //MARK: - MODAL VIEW - Name Song Label Constraints
        nameSongModalLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 40).isActive = true
        nameSongModalLabel.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -40).isActive = true
        nameSongModalLabel.centerXAnchor.constraint(equalTo: popupView.centerXAnchor).isActive = true
        nameSongModalLabel.topAnchor.constraint(equalTo: timerModalRight.bottomAnchor, constant: 10).isActive = true
        
        //MARK: - MODAL VIEW - numberOfSawsModal Label Constraints
        numberOfSawsModalLabel.centerXAnchor.constraint(equalTo: popupView.centerXAnchor).isActive = true
        numberOfSawsModalLabel.topAnchor.constraint(equalTo: nameSongModalLabel.bottomAnchor, constant: 8).isActive = true
        
        //MARK: - MODAL VIEW - Reward music Button Label Constraint
        rewardMusicButton.trailingAnchor.constraint(equalTo: pauseMusicButton.leadingAnchor, constant: -35).isActive = true
        rewardMusicButton.topAnchor.constraint(equalTo: numberOfSawsModalLabel.bottomAnchor, constant: 30).isActive = true
        
        //MARK: - MODAL VIEW - Pause music Button Label Constraint
        pauseMusicButton.centerXAnchor.constraint(equalTo: popupView.centerXAnchor).isActive = true
        pauseMusicButton.topAnchor.constraint(equalTo: numberOfSawsModalLabel.bottomAnchor, constant: 30).isActive = true
        
        //MARK: - MODAL VIEW - Next music Button Label Constraint
        nextMusicButton.leadingAnchor.constraint(equalTo: pauseMusicButton.trailingAnchor, constant: 35).isActive = true
        nextMusicButton.topAnchor.constraint(equalTo: numberOfSawsModalLabel.bottomAnchor, constant: 30).isActive = true
        
        
        //MARK: - MODAL VIEW Volime Slider Constraints
        
        volumeSlider.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 10).isActive = true
        volumeSlider.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -10).isActive = true
        volumeSlider.topAnchor.constraint(equalTo: pauseMusicButton.bottomAnchor, constant: 45).isActive = true
        volumeSlider.centerXAnchor.constraint(equalTo: popupView.centerXAnchor).isActive = true
    }
    
}


private enum State {
    case closed
    case open
}

extension State {
    var opposite: State {
        switch self {
        case .open: return .closed
        case .closed: return .open
        }
    }
}
