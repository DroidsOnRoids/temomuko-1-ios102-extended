//
//  CameraViewController.swift
//  Snappy
//
//  Created by Marcel Starczyk on 10/11/16.
//  Copyright © 2016 Droids on Roids. All rights reserved.
//

import UIKit

final class CameraViewController: UIViewController {

    @IBOutlet private weak var takePhotoButton: TakePhotoButton!
    @IBOutlet private weak var takePhotoButtonWidth: NSLayoutConstraint!
    @IBOutlet private weak var takePhotoButtonHeight: NSLayoutConstraint!
    
    private struct Constants {
        static let constraintsSizeDefault: CGFloat = 50.0
        static let constraintsSizeAfterAnimation: CGFloat = 65.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateBackground()
    }
    
    private func setup() {
        let longPressGestureRecognizer = UILongPressGestureRecognizer(
            target: self,
            action: #selector(CameraViewController.longPressGestureAction(sender:))
        )
        longPressGestureRecognizer.minimumPressDuration = 0.3
        takePhotoButton.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    private func animateBackground() {
        UIView.animate(withDuration: 2.0) { 
            self.view.backgroundColor = .black
        }
    }
    
    private func changeConstraintsConstantWithValue(value: CGFloat) {
        [takePhotoButtonWidth, takePhotoButtonHeight].forEach { constraint in
            constraint.constant = value
        }
    }
    
    @IBAction private func takePhotoButtonAction(sender: UIButton) {
        takePhotoButton.animateColorWithCompletionWhichRevertToDefault(color: .white)
        changeConstraintsConstantWithValue(value: Constants.constraintsSizeAfterAnimation)
        
        UIView.animate(withDuration: 0.35, animations: {
            self.view.layoutIfNeeded()
        }) { _ in
            self.changeConstraintsConstantWithValue(value: Constants.constraintsSizeDefault)
            UIView.animate(withDuration: 0.35, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
    func longPressGestureAction(sender: UIGestureRecognizer) {
        switch sender.state {
        case .began:
            takePhotoButton.animateColor(color: .red)
        case .ended:
            takePhotoButton.animateColor(color: .clear)
        default: ()
        }
    }
}
