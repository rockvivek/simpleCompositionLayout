//
//  MyCollectionViewCell.swift
//  CompositionaLayout
//
//  Created by vivek shrivastwa on 17/05/21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyCollectionViewCell"
    
    private let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    
    
    override init(frame:CGRect) {
        
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        let images: [UIImage] = [
            UIImage(named:"image1"),
            UIImage(named:"image2"),
            UIImage(named:"image3"),
            UIImage(named:"image4"),
            UIImage(named:"image5"),
            UIImage(named:"image6"),
            UIImage(named:"image7"),
            UIImage(named:"image8"),
            UIImage(named:"image9"),
            UIImage(named:"image10"),
            UIImage(named:"image11"),
            UIImage(named:"image12"),
            UIImage(named:"image13"),
            UIImage(named:"image14"),
            UIImage(named:"image15"),
            UIImage(named:"image16"),
            UIImage(named:"image17"),
            UIImage(named:"image18"),
            UIImage(named:"image19"),
            UIImage(named:"image20"),
            UIImage(named:"image21"),
            UIImage(named:"image22"),
            UIImage(named:"image23"),
            UIImage(named:"image24"),
            UIImage(named:"image25"),
            UIImage(named:"image26"),
            UIImage(named:"image27"),
            UIImage(named:"image28"),
            UIImage(named:"image29"),
            UIImage(named:"image30")
        ].compactMap({ $0 })
        imageView.image = images.randomElement()
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds    
    }
}
