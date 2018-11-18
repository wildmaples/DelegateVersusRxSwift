//
//  ViewController.swift
//  DelegateTutorial
//
//  Created by James Rochabrun on 2/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit
import RxSwift

class ViewControllerA: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let nav = segue.destination as? UINavigationController, let viewControllerB = nav.topViewController as? ViewControllerB {
            
            viewControllerB.changeBackgroundColor
                .subscribe(onNext: { [weak self] newBackgroundColor in
                    self?.changeBackgroundColor(newBackgroundColor)
                })
                .disposed(by: disposeBag)
        }
    }
    
    func changeBackgroundColor(_ color: UIColor?) {
        view.backgroundColor = color
    }
}
