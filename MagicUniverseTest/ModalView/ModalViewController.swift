//
//  ModalViewController.swift
//  MagicUniverseTest
//
//  Created by Evgeniy Suprun on 20/05/2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import UIKit

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

class ModalViewController: UIViewController {
    
    
    private lazy var popupView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        if #available(iOS 11.0, *) {
            view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        } else {
            //FIX-IT - need early version
        }
        view.clipsToBounds = true
        let color1 = #colorLiteral(red: 0.915286839, green: 0.2501996458, blue: 0.5527306199, alpha: 1).cgColor
        let color2 = #colorLiteral(red: 0.4409026504, green: 0.0633180514, blue: 0.9208388925, alpha: 1).cgColor
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [color1, color2]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        view.layer.addSublayer(gradient)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        popupView.addGestureRecognizer(tapRecognizer)
    }
    
    private var bottomConstraint = NSLayoutConstraint()
    
    private func layout() {
        popupView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popupView)
        popupView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        popupView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomConstraint = popupView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 440)
        bottomConstraint.isActive = true
        popupView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    private var currentState: State = .closed
    
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(popupViewTapped(recognizer:)))
        return recognizer
    }()
    
    @objc private func popupViewTapped(recognizer: UITapGestureRecognizer) {
        let state = currentState.opposite
        let transitionAnimator = UIViewPropertyAnimator(duration: 1, dampingRatio: 1, animations: {
            switch state {
            case .open:
                self.bottomConstraint.constant = 0
            case .closed:
                self.bottomConstraint.constant = 440
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
                self.bottomConstraint.constant = 440
            }
        }
        transitionAnimator.startAnimation()
    }
    
}
