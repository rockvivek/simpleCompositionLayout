//
//  ViewController.swift
//  CompositionaLayout
//
//  Created by vivek shrivastwa on 17/05/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: ViewController.createLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        view.backgroundColor = .systemBackground
        
        view.addSubview(collectionView)
        
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout{
        //item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/5),
                                               heightDimension: .fractionalHeight(1.0)
            ))
        
        let horizentalItemStack = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(1/2)
            ))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        horizentalItemStack.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        //group
        
        let horizentalGroupStack = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)), subitem: horizentalItemStack, count: 2)
        
        let verticalGroupStack = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(3/5), heightDimension: .fractionalHeight(1)),
            subitems: [
                horizentalItemStack,horizentalGroupStack
            ])
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)),
            subitems: [
                verticalGroupStack,item
            ])
       
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        //return
        return UICollectionViewCompositionalLayout(section: section)
    }
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.bounds
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
}


