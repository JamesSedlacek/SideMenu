//
//  customSegue.swift
//  sideMenu
//
//  Created by James Sedlacek on 1/8/21.
//

import UIKit

class customSegue: UIStoryboardSegue {
    
    override func perform() {
        guard let firstVC = self.source.view as UIView? else { return }
        guard let secondVC = self.destination.view as UIView? else { return }
        
        firstVC.addSubview(secondVC)
        
        UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.addSubview(secondVC)
        
        secondVC.frame.origin.x = 260
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut,
                       animations: {
            secondVC.frame.origin.x = 0
            secondVC.layoutIfNeeded()
        }) { (Finished) -> Void in
            self.source.dismiss(animated: false, completion: nil)
        }
    }
}
