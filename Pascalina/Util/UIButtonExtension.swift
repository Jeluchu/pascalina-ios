//
//  UIButtonExtension.swift
//  Pascalina
//
//  Created by Jesús Calderón on 20/06/2019.
//  Copyright © 2019 Prueba. All rights reserved.
//

import UIKit

extension UIButton {
    
    func round() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    func shine() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }
    
}
