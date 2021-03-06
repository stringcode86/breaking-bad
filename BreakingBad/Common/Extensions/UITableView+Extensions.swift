//
// Created by stringcode on 07/01/2021.
//

import UIKit

extension UITableView {

    func dequeue<T: UITableViewCell>(_: T.Type, for idxPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(
            withIdentifier: "\(T.self)",
            for: idxPath
        ) as? T else {
            fatalError("Failed to deque cell with id \(T.self)")
        }
        return cell
    }
}
