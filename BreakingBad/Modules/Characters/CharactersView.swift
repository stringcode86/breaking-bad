//
// Created by stringcode on 07/01/2021.
//

import UIKit

protocol CharactersView: class {

    func update(with viewModel: CharactersViewModel)
}

class DefaultCharactersView: UITableViewController {

    var presenter: CharactersPresenter!

    private var viewModel: CharactersViewModel = .loading

    private let searchController = UISearchController(
        searchResultsController: nil
    )

    private var diffableDatasource: UITableViewDiffableDataSource<
        Int,
        CharactersViewModel.CharacterViewModel
    >?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationItem()
        setupToolbar()

        diffableDatasource = UITableViewDiffableDataSource(
            tableView: self.tableView,
            cellProvider: { tableView, indexPath, itemVieModel in
                let cell = tableView.dequeue(CharacterCell.self, for: indexPath)
                cell.update(with: itemVieModel)
                return cell
            }
        )
        
        presenter.present()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setToolbarHidden(false, animated: animated)
    }

    func reload() {
        var snapshot = NSDiffableDataSourceSnapshot<
            Int,
            CharactersViewModel.CharacterViewModel
        >()

        snapshot.appendSections([0])
        snapshot.appendItems(viewModel.items(), toSection: 0)

        diffableDatasource?.apply(snapshot, animatingDifferences: true)
    }

    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        presenter.handleEvent(.didSelectCharacter(indexPath))
    }
}

// MARK - CharactersView

extension DefaultCharactersView: CharactersView {

    func update(with viewModel: CharactersViewModel) {
        self.viewModel = viewModel
        handleErrorIfNeeded(viewModel)
        reload()
    }
}

// MARK: - UISearchResultsUpdating

extension DefaultCharactersView: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        let term = searchController.searchBar.text
        presenter.handleEvent(.search(term))
    }
}

// MARK: - Tool bar

// NOTE: Season filtering UI is bunche of hacks to get any sort of filtering UI.
// I only have 5 min until I have to finish.
extension  DefaultCharactersView {

    func setupToolbar() {

        let segmentedControl = UISegmentedControl(
            items: ["Any"] + (1..<6).map(String.init)
        )

        segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlAction(_:)),
            for: .valueChanged
        )


        
        self.toolbarItems = [
            UIBarButtonItem(title: "Seasons: "),
            UIBarButtonItem(customView: segmentedControl)
        ]
    }

    @objc func segmentedControlAction(_ sender: UISegmentedControl) {
        presenter.handleEvent(.seasonFilter(sender.selectedSegmentIndex))
    }
}

// MARK: - Utilities

private extension DefaultCharactersView {

    func setupNavigationItem() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search characters"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    func handleErrorIfNeeded(_ viewModel: CharactersViewModel) {
        switch viewModel {
        case let .failed(error):
            print(error)
        default:
            return
        }
    }
}
