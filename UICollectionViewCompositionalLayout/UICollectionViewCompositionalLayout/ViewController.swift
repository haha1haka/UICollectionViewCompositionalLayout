//
//  ViewController.swift
//  UICollectionViewCompositionalLayout
//
//  Created by HWAKSEONG KIM on 2022/10/02.
//

import UIKit
enum Section {
    case main
}


class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var collectionViewDataSource: UICollectionViewDiffableDataSource<Section, Int>!
    var items = Array(1...50)
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionViewLayout()
        configureCollectionViewDataSource()
        applySnapShot()
    }
}

extension ViewController {
    
    func configureCollectionViewLayout() {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(section: section)
    }
    func configureCollectionViewDataSource() {
        let cellRegisteration = UICollectionView.CellRegistration<Cell, Int> { cell, indexPath, itemidentifier in
            cell.label.text = itemidentifier.description
        }
        collectionViewDataSource = .init(collectionView: collectionView) { collectionView, indexPath, itemidentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: itemidentifier)
            return cell
        }
    }
    
    func applySnapShot() {
        var snapShot = collectionViewDataSource.snapshot()
        snapShot.appendSections([.main])
        snapShot.appendItems(items)
        collectionViewDataSource.apply(snapShot)
    }


}
