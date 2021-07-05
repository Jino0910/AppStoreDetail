//
//  ViewController.swift
//  AppStoreDetail
//
//  Created by rowkaxl on 2021/07/05.
//

import UIKit
import RxSwift
import Alamofire

class ViewController: UIViewController {
    
    let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let apiManager = APIManager(sessionManager: Session.default)
//        
//        apiManager.request(target: .lookup(872469884))
//            .map({ (model) -> DetailModel in
//                return model
//            })
//            .subscribe(onNext: { (model) in
//                print(model)
//            })
//            .disposed(by: self.bag)
    }


}

