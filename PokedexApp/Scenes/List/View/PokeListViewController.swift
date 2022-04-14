//
//  ViewController.swift
//  PokedexApp
//
//  Created by Admin on 4/7/22.
//

import UIKit

class PokeListViewController: UIViewController {
    
    @IBOutlet weak var pokeListTableView: UITableView!
    
    var viewModel = PokeListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeListTableView.register(PokeListTableViewCell.self, forCellReuseIdentifier: PokeListTableViewCell.identifier)
        pokeListTableView.dataSource = self
        pokeListTableView.delegate = self
        viewModel.delegate = self
        viewModel.getListfromAPI()
    }
}

extension PokeListViewController: UITableViewDelegate {
    
}

extension PokeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pokeListTableView.dequeueReusableCell(withIdentifier: PokeListTableViewCell.identifier) as! PokeListTableViewCell
        let viewModel = viewModel.getPokemonCellViewModel(index: indexPath)
        cell.binding(viewModel: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ListToDetail" {
            if let viewController = segue.destination as? PokemonDetailViewController, let indexPath = self.pokeListTableView.indexPathForSelectedRow {
                let pokemon = viewModel.getPokemonWithIndex(index: indexPath)
                viewController.viewModel.getPokemonWithURL(url: pokemon.url )
            }
                
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ListToDetail", sender: self)
    }
    
    
    
}

extension PokeListViewController: PokeListViewModelDelegate {
    func didSucess() {
        self.pokeListTableView.reloadData()
    }
    
    func didFailure(error: ErrorApi) {
        switch error {
        case .linkError:
            showAlert(title: "Error", subtitle: "Link Error")
        case .genericError:
            showAlert(title: "Error", subtitle: "Generic Error")
        }
    }
    
    func showAlert(title: String, subtitle: String) {
        let alertController = UIAlertController(title: title, message: subtitle, preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        let reloadAction = UIAlertAction(title: "Reload", style: .default) { _ in
            
        }
        alertController.addAction(okAction)
        alertController.addAction(reloadAction)
        present(alertController, animated: true)
    }

    
    
}
