//
//  LocationSelectView.swift
//  Gasculator
//
//  Created by Adriyan Bevz on 10/4/19.
//  Copyright © 2019 4andahalf. All rights reserved.
//

import UIKit

class LocationSelectView: UIView {
    @IBAction public func closeButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction public func locationSelected(_ sender: UIButton) {
        
    }
}
//
//class ForgotPasswordPresentationController: UIPresentationController{
//    let blurEffectView: UIVisualEffectView!
//    var tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer()
//    @objc func dismiss(){
//        self.presentedViewController.dismiss(animated: true, completion: nil)
//    }
//    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
//        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
//        blurEffectView = UIVisualEffectView(effect: blurEffect)
//        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
//        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismiss))
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        self.blurEffectView.isUserInteractionEnabled = true
//        self.blurEffectView.addGestureRecognizer(tapGestureRecognizer)
//    }
//    override var frameOfPresentedViewInContainerView: CGRect{
//        return CGRect(origin: CGPoint(x: 0, y: self.containerView!.frame.height/2), size: CGSize(width: self.containerView!.frame.width, height: self.containerView!.frame.height/2))
//    }
//    override func dismissalTransitionWillBegin() {
//        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
//            self.blurEffectView.alpha = 0
//        }, completion: { (UIViewControllerTransitionCoordinatorContext) in
//            self.blurEffectView.removeFromSuperview()
//        })
//    }
//    override func presentationTransitionWillBegin() {
//        self.blurEffectView.alpha = 0
//        self.containerView?.addSubview(blurEffectView)
//        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
//            self.blurEffectView.alpha = 1
//        }, completion: { (UIViewControllerTransitionCoordinatorContext) in
//
//        })
//    }
//    override func containerViewWillLayoutSubviews() {
//        super.containerViewWillLayoutSubviews()
//        presentedView!.layer.masksToBounds = true
//        presentedView!.layer.cornerRadius = 10
//    }
//    override func containerViewDidLayoutSubviews() {
//        super.containerViewDidLayoutSubviews()
//        self.presentedView?.frame = frameOfPresentedViewInContainerView
//        blurEffectView.frame = containerView!.bounds
//    }
//}
