//
//  WelcomeViewController.swift
//  I-Helper
//
//  Created by Maxtra Technologies P LTD on 02/08/17.
//  Copyright © 2017 Maxtra Technologies P LTD. All rights reserved.
//

import UIKit


// MARK: - WelcomeViewControllerDelegate
public protocol WelcomeViewControllerDelegate: class {
    func welcomeViewControllerDonePressed(_ controller: WelcomeViewController)
}

public class WelcomeViewController: UIViewController {
    
    // MARK: - Injections
    public var delegate: WelcomeViewControllerDelegate?
    @IBOutlet weak var pageControl: UIPageControl!
    var welcomePageViewController: WelcomePageViewController? {
        didSet {
            welcomePageViewController?.welcomeDelegate = self
        }
    }
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var getStartedButton: UIButton!
    public override func viewDidLoad() {
        
        //getStartedButton.isHidden = true
        //pageControl.addTarget(self, action: #selector(WelcomeViewController.didChangePageControlValue), for: .valueChanged)
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let welcomePageViewController = segue.destination as? WelcomePageViewController {
            self.welcomePageViewController = welcomePageViewController
        }
    }
    @IBAction func didChangePageControlValue(_ sender: UIPageControl) {
        welcomePageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
    
    //    func didChangePageControlValue() {
    //        welcomePageViewController?.scrollToViewController(index: pageControl.currentPage)
    //    }
    
}

extension WelcomeViewController:WelcomePageViewControllerDelegate{
    
    func welcomePageViewController(_ welcomePageViewController: WelcomePageViewController, didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func welcomePageViewController(_ welcomePageViewController: WelcomePageViewController, didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
        if (index + 1) == pageControl.numberOfPages  {
            
            // self.skipButton.isHidden = true
            //self.getStartedButton.isHidden = false
            
            
            UIView.animate(withDuration: 0.1, delay: 0.2, options:.transitionCrossDissolve, animations: {
               self.skipButton.alpha = 0.0
            }, completion: nil)
            
          
            UIView.animate(withDuration: 0.1, delay: 0.2, options: .transitionCrossDissolve, animations: {
                //self.skipButton.isHidden = true
                self.getStartedButton.alpha = 1.0
            }, completion: nil)
 
        }
        else{
            UIView.animate(withDuration: 0.1, delay: 0.2, options: .transitionCrossDissolve, animations: {
                self.skipButton.alpha = 1.0
            }, completion: nil)
            
            UIView.animate(withDuration: 0.1, delay: 0.2, options: .transitionCrossDissolve, animations: {
                //self.skipButton.isHidden = true
                self.getStartedButton.alpha = 0.0
            }, completion: nil)
            
        }
    }
    
   
}
