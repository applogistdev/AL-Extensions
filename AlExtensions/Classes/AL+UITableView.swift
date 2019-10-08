import UIKit

public extension UITableView {

    /// Tableview cell registration with nib file
    /// Usage **tableView.register(SomeCell.self)**
    func registerNib(_ cellClass: AnyClass) {
        let cellID = String(describing: cellClass.self)
        register(UINib(nibName: cellID, bundle: .main),
                 forCellReuseIdentifier: cellID)
    }

    /// Defining cell in cellForRowAt function
    /// Usage **let cell = tableView.dequeueReusableCell(SomeCell.self, for: indexPath)**
    func dequeueReusableCell<Cell: UITableViewCell>(_ cellClass: Cell.Type,
                                                    for indexPath: IndexPath) -> Cell {
        let cellID = String(describing: cellClass.self)
        guard let someCell = dequeueReusableCell(withIdentifier: cellID,
                                                 for: indexPath) as? Cell else {
                                                    return Cell()
        }
        return someCell
    }


    /// Reloads the tableview animated
    /// - Parameter animation: Animation type
    func reloadData(with animation: UITableView.RowAnimation) {
        DispatchQueue.main.async {
            UIView.transition(with: self,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: {self.reloadData()},
                              completion: nil)

        }
    }

    /// Reloads the table animated with fade animation
    func reloadAnimated() {
        reloadData(with: .fade)
    }

}
