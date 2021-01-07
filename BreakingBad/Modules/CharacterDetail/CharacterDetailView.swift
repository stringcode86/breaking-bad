//
// Created by stringcode on 07/01/2021.
//

import UIKit

protocol CharacterDetailView: class {

    func update(with: CharacterDetailViewModel)
}

class DefaultCharacterDetailView: UIViewController {

    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var occupationsLabel: UILabel?
    @IBOutlet weak var statusLabel: UILabel?
    @IBOutlet weak var nicknameLabel: UILabel?
    @IBOutlet weak var appearancesLabel: UILabel?
    @IBOutlet weak var appearancesBetterCallSaulLabel: UILabel?

    var presenter: CharacterDetailPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.present()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setToolbarHidden(true, animated: animated)
    }
}

// MARK: - CharacterDetailView

extension DefaultCharacterDetailView: CharacterDetailView {

    func update(with viewModel: CharacterDetailViewModel) {
        imageView?.setImage(
            url: viewModel.imageURL,
            placeholder: .image(UIImage(named: "icon"))
        )
        
        navigationItem.title = viewModel.name
        nameLabel?.text = viewModel.name
        occupationsLabel?.text = viewModel.occupations
        statusLabel?.text = viewModel.status
        nicknameLabel?.text = viewModel.nickname
        appearancesLabel?.text = viewModel.appearances
        appearancesBetterCallSaulLabel?.text = viewModel.appearancesBetterCallSaul
    }
}

