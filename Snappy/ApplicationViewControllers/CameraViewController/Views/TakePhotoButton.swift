//
//  TakePhotoButton.swift
//  Snappy
//
//  Created by Paweł Sternik on 08.12.2016.
//  Copyright © 2016 Droids on Roids. All rights reserved.
//

import UIKit

final class TakePhotoButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    private func setup() {
        setTitle("", for: .normal)
        backgroundColor = .clear
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = frame.width / 2.0
        layer.masksToBounds = true
    }
    
    func animateColor(color: UIColor ) {
        UIView.animate(withDuration: 0.35) { 
            self.backgroundColor = color
        }
    }
    
    func animateColorWithCompletionWhichRevertToDefault(color: UIColor) {
        UIView.animate(withDuration: 0.35, animations: {
           self.backgroundColor = .white
        }) { _ in
            self.animateColor(color: .clear)
        }
    }
}
