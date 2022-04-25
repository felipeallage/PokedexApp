//
//  PokemonDetailViewController.swift
//  PokedexApp
//
//  Created by Admin on 4/7/22.
//

import UIKit
import Kingfisher

class PokemonDetailViewController: UIViewController {
    
    @IBOutlet weak var spriteImage: UIImageView!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel : PokemonDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        
    }
    
}

extension PokemonDetailViewController: PokemonDetailViewModelDelegate {
    
    func didSuccess() {
        spriteImage.kf.setImage(with: URL(string: viewModel.getPokemonSprite()))
        nameLabel.text = viewModel.getPokemonName()
        heightLabel.text = "\(viewModel.getPokemonHeight())"
        weightLabel.text = "\(viewModel.getPokemonWeight())"
    }
    
    func didFailure(error: ErrorApi) {
        
    }
    
    
    
    
}
