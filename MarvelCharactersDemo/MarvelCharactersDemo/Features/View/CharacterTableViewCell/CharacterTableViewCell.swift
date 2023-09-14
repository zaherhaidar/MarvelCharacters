//
//  CharacterTableViewCell.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Kingfisher
import UIKit

class CharacterTableViewCell: UITableViewCell {
    @IBOutlet var mainView: UIView!
    @IBOutlet var characterImageView: UIImageView!
    @IBOutlet var characterNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.layer.cornerRadius = 20
        let style = (MarvelTheme.shared.fontProtocol?.bodyXB14, MarvelTheme.shared.colorProtocol?.whiteColor)
        characterNameLabel.customize(style: style)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupCell(name: String?, thumbnail: ThumbnailModel?) {
        characterNameLabel.text = name
        if let thumbnail = thumbnail, let path = thumbnail.path, !path.isEmpty, let ext = thumbnail.ext, !ext.isEmpty, let url = URL(string: "\(path).\(ext)") {
            characterImageView.kf.setImage(with: url)
        } else {
            characterImageView.kf.setImage(with: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg"))
        }
    }
}

extension CharacterTableViewCell: ShimmeringViewProtocol {
    var shimmeringAnimatedItems: [UIView] {
        [
            characterImageView,
            characterNameLabel
        ]
    }
    
    var excludedItems: Set<UIView> {
        [mainView]
    }
}
