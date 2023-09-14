//
//  CharacterDetailCollectionViewCell.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 13/09/2023.
//

import UIKit

class CharacterDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.cornerRadius = 12
        self.iconImageView.applyTopCornerRadiusIfNeeded(10)
        self.bottomView.applyBottomCornerRadiusIfNeeded(10)
        let style = (MarvelTheme.shared.fontProtocol?.bodyXB10, MarvelTheme.shared.colorProtocol?.whiteColor)
        nameLabel.customize(style: style)
    }
    
    func setupCell(thumbnail: ThumbnailModel?, name: String?) {
        nameLabel.text = name
        if let thumbnail = thumbnail, let path = thumbnail.path, !path.isEmpty, let ext = thumbnail.ext, !ext.isEmpty, let url = URL(string: "\(path).\(ext)") {
            iconImageView.kf.setImage(with: url)
        } else {
            iconImageView.kf.setImage(with: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg"))
        }
    }

}
