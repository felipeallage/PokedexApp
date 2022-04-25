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
    
    lazy var hStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [pokemonImageView, pokemonNameLabel])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(hStack)
        self.contentView.backgroundColor = .red
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = false
        self.contentView.layer.borderColor = UIColor.black.cgColor
        self.contentView.layer.borderWidth = 1
        pokemonImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        pokemonImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        pokemonImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        pokemonImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        hStack.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        hStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: self.hStack.trailingAnchor, constant: 10).isActive = true

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
