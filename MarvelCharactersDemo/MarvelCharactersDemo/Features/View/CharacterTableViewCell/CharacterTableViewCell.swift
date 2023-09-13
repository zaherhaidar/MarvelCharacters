//
//  CharacterTableViewCell.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(name: String?, imageUrl: String?) {
        characterNameLabel.text = name
        if !(imageUrl?.isEmpty ?? true), let urlSafe = URL(string: imageUrl ?? "") {
            characterImageView.kf.setImage(with: urlSafe)
        }
        
    }
    
}
