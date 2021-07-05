//
//  ViewModel.swift
//  AppStoreDetail
//
//  Created by rowkaxl on 2021/07/05.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {

    struct Dependency {
        let apiManager: APIManagerProtocol
    }
    private let dependency: Dependency
    private let bag = DisposeBag()
    
    // MARK: - Input
    var designatedInfoOpen: Bool = false
    
    // MARK: - Output
    let sectionModels = BehaviorSubject<[AppStoreBaseItemSection]>(value: [])
    let reload = BehaviorSubject<Void?>(value: nil)
    
    // MARK: - Init
    init(dependency: Dependency) {
        self.dependency = dependency
        bindOutput()
    }
    
    private func bindOutput() {

        Observable.just(872469884)
            .flatMapLatest{ [weak self] id -> Observable<DetailModel> in
                guard let self = self else { return .empty() }
                return self.dependency
                    .apiManager
                    .request(target: .lookup(id))
                    .map({ (model) -> DetailModel in
                        return model
                    })
            }
            .map({ model -> [AppStoreBaseItemSection] in
                [AppStoreBaseItemSection(items: [
                    AppStoreBaseItem(type: .detailScreenShot, model: model),
                    AppStoreBaseItem(type: .detailDesignatedInfo, model: model),
                    AppStoreBaseItem(type: .detailDescription, model: model),
                    AppStoreBaseItem(type: .detailCategory, model: model)
                ])]
            })
            .bind(to: sectionModels)
            .disposed(by: bag)
    }
}
