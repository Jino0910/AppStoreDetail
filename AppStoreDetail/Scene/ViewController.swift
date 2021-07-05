//
//  ViewController.swift
//  AppStoreDetail
//
//  Created by rowkaxl on 2021/07/05.
//

import UIKit
import RxSwift
import RxDataSources
import RxGesture

class ViewController: UIViewController {

    var viewModel: ViewModel!
    private let bag = DisposeBag()

    @IBOutlet weak var cv: UICollectionView! {
        didSet {
            let flowLayout: UICollectionViewFlowLayout! = UICollectionViewFlowLayout()
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            flowLayout.minimumInteritemSpacing = 10
            flowLayout.minimumLineSpacing = 10
            cv.collectionViewLayout = flowLayout
        }
    }
    
    var dataSource: RxCollectionViewSectionedReloadDataSource<AppStoreBaseItemSection>?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

extension ViewController {
    
    private func configure() {
        configureUI()
        configureRx()
    }
    
    private func configureUI() {
        
        self.cv.rx.setDelegate(self).disposed(by: self.bag)
    }
    
    private func configureRx() {
        
        dataSource = RxCollectionViewSectionedReloadDataSource<AppStoreBaseItemSection>(
            configureCell: { (_, cv, indexPath, item) -> UICollectionViewCell in
                
                switch item.type {
                case .detailScreenShot:
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "ScreenShotCollectionViewCell", for: indexPath) as! ScreenShotCollectionViewCell
                    cell.configure(model: item.model)
                    return cell
                case .detailDesignatedInfo:
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "DesignatedInfoCollectionViewCell", for: indexPath) as! DesignatedInfoCollectionViewCell
                    cell.configure(model: item.model, isOpen: self.viewModel.designatedInfoOpen)
                    cell.rx.tapGesture()
                        .skip(1)
                        .subscribe(onNext: { [weak self]_ in
                            guard let self = self else { return }
                            self.viewModel.designatedInfoOpen = !self.viewModel.designatedInfoOpen
                            self.cv.reloadItemsAtIndexPaths([indexPath], animationStyle: .fade)
                        })
                        .disposed(by: cell.bag)
                    
                    
                    return cell
                case .detailDescription:
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "DescriptionCollectionViewCell", for: indexPath) as! DescriptionCollectionViewCell
                    cell.configure(model: item.model)
                    return cell
                case .detailCategory:
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "CetagoryCollectionViewCell", for: indexPath) as! CetagoryCollectionViewCell
                    cell.configure(model: item.model)
                    return cell
                }
            }
        )
        self.viewModel
            .sectionModels
            .filter{ $0.count > 0 }
            .bind(to: self.cv.rx.items(dataSource: dataSource!))
            .disposed(by: self.bag)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let dataSource = dataSource else { return .zero }
        
        let section = dataSource[indexPath.section]
        let item = section.items[indexPath.item]
        
        let width = UIScreen.main.bounds.width
        
        switch item.type {
        case .detailScreenShot: return CGSize(width: width, height: 400)
        case .detailDesignatedInfo:
            print(self.viewModel.designatedInfoOpen)
            return CGSize(width: width,
                          height: DesignatedInfoCollectionViewCell.cellHeight(width: width,
                                                                              isOpen: self.viewModel.designatedInfoOpen,
                                                                              desc: item.model.releaseNotes))
        case .detailDescription:
            return CGSize(width: width,
                          height: DescriptionCollectionViewCell.cellHeight(width: width,
                                                                           desc: item.model.description))
        case .detailCategory: return CGSize(width: width, height: 80)
        }
        
    }
}
