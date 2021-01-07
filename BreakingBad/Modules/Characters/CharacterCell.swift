//
// Created by stringcode on 07/01/2021.
//

import UIKit

class CharacterCell: UITableViewCell {

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView?.cancelImageLoad()
    }

    func update(with viewModel: CharactersViewModel.CharacterViewModel) {
        imageView?.setImage(
            url: viewModel.imageURL,
            placeholder: .image(UIImage(named: "icon"))
        )
        textLabel?.text = viewModel.name
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        guard let imageView = imageView else {
            return
        }

        imageView.frame = CGRect(
            origin: .zero,
            size: CGSize(width: bounds.height, height: bounds.height)
        )

        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        let maxX = imageView.frame.maxX + 16

        textLabel?.frame = CGRect(
            origin: CGPoint(x: maxX, y: 0),
            size: CGSize(width: bounds.width - maxX, height: bounds.height)
        )
    }
}
