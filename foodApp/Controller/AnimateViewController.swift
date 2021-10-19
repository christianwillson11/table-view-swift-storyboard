//
//  AnimateViewController.swift
//  foodApp
//
//  Created by Christian Willson on 08/10/21.
//  Copyright © 2021 Christian Willson. All rights reserved.
//

import UIKit

class AnimateViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 140))
        imageView.image = UIImage(named: "burger-restaurant-logo")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.animate()
        })
    }
    
    private func animate() {
        UIView.animate(withDuration: 0.5, animations: {
            let size = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(x: -(diffX/2), y: diffY/2, width: size, height: size)
            
            self.imageView.alpha = 0
        })
        
        
        UIView.animate(withDuration: 1.5, animations: {
                       
            self.imageView.alpha = 0
        }, completion: {done in
            if done {
                let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                
                guard let mainNavigationVC = mainStoryboard.instantiateViewController(identifier: "NavigationController") as? NavigationController else {
                    return
                }
                mainNavigationVC.modalTransitionStyle = .crossDissolve
                mainNavigationVC.modalPresentationStyle = .fullScreen
                self.present(mainNavigationVC, animated: true)
            }
        })
        
        
    }

}
