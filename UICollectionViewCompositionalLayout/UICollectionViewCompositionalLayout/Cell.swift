//
//  Cell.swift
//  UICollectionViewCompositionalLayout
//
//  Created by HWAKSEONG KIM on 2022/10/02.
//

import UIKit
import SnapKit

class Cell: UICollectionViewCell {
    
    let label: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return view
    }()
        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPink
        setHierarchy()
        setConstrains()
    }
    required init?(coder: NSCoder) {
        fatalError("init has not been implement")
    }
    
    func setHierarchy() {
        self.addSubview(label)
    }
    func setConstrains() {
        label.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
    }
}
