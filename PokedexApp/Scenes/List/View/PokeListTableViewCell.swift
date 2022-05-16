//
//  PokeListTableViewCell.swift
//  PokedexApp
//
//  Created by Admin on 4/8/22.
//

import Foundation
import UIKit
import Kingfisher

class PokeListTableViewCell: UITableViewCell {
    
    var viewModel : PokeListTableViewCellModel!
    
    static let identifier = "ID"
    

    lazy var pokemonImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.borderColor = UIColor.black.cgColor
        img.layer.borderWidth = 2
        return img
    }()
    
    lazy var pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .red
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = false
        self.contentView.layer.borderColor = UIColor.black.cgColor
        self.contentView.layer.borderWidth = 1
        self.addSubview(pokemonImageView)
        self.addSubview(pokemonNameLabel)
        pokemonImageView.centerY(inView: self)
        pokemonImageView.setDimensions(height: 70, width: 70)
        pokemonImageView.anchor(left: self.leftAnchor, paddingLeft: 10)
        pokemonNameLabel.centerY(inView: self)
        pokemonNameLabel.anchor(left: self.pokemonImageView.rightAnchor, right: self.rightAnchor, paddingLeft: 10, paddingRight: 10)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func binding(viewModel: PokeListTableViewCellModel) {
        self.viewModel = viewModel
        setup()
    }
    
    func setup() {
        viewModel.delegate = self
        pokemonNameLabel.text = viewModel.getName()
        viewModel.getImageURL()
    }
}

extension PokeListTableViewCell: PokelistTableViewCellModelDelegate {
    func getImageURL(url: String) {
        self.pokemonImageView.kf.setImage(with: URL(string: url))
    }
}
