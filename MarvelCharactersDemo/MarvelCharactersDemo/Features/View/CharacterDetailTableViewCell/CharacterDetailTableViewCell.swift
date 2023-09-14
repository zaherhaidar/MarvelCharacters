//
//  CharacterDetailTableViewCell.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 13/09/2023.
//

import Kingfisher
import UIKit

class CharacterDetailTableViewCell: UITableViewCell {
    @IBOutlet var collectionView: UICollectionView!

    var data: [RowDataModel]? = [] {
        didSet {
            if (data?.count ?? 0) > 0 {
                collectionView.reloadData()
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        collectionView.register(UINib(nibName: "CharacterDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CharacterDetailCollectionViewCell")

        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension CharacterDetailTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterDetailCollectionViewCell", for: indexPath) as! CharacterDetailCollectionViewCell

        let item = data?[indexPath.row]
        cell.setupCell(thumbnail: item?.thumbnail, name: item?.name)
        return cell
    }
}

extension CharacterDetailTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
