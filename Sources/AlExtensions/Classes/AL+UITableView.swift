import UIKit

public extension UITableView {
    
    /// Tableview cell registration with nib file
    /// - Usage: ```tableView.register(SomeCell.self)```
    func registerNib(_ cellClass: AnyClass) {
        let cellID = String(describing: cellClass.self)
        register(UINib(nibName: cellID, bundle: .main), forCellReuseIdentifier: cellID)
    }
    
    /// Defining cell in cellForRowAt function
    /// - Usage: ``` let cell = tableView.dequeueReusableCell(SomeCell.self, for: indexPath) ```
    func dequeueReusableCell<Cell: UITableViewCell>(_ cellClass: Cell.Type, for indexPath: IndexPath) -> Cell {
        let cellID = String(describing: cellClass.self)
        guard let someCell = dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? Cell else {
            return Cell()
        }
        return someCell
    }
    
    /// Reloads the tableview animated
    /// - Parameter animation: Animation type
    /// - Parameter duration: Animation duration **Default: 0.3**
    func reloadData(with animation: UITableView.RowAnimation, duration: TimeInterval = 0.3) {
        DispatchQueue.main.async {
            UIView.transition(with: self,
                              duration: duration,
                              options: .transitionCrossDissolve,
                              animations: {self.reloadData()},
                              completion: nil)
            
        }
    }
    
    /// Reloads the table animated with fade animation
    func reloadAnimated() {
        reloadData(with: .fade)
    }
    
    /// Scroll to top of tableview
    /// - Parameter animated: Animated **(Default: true)**
    func scrollToTop(animated: Bool = true) {
        let indexPath = IndexPath(row: 0, section: 0)
        if self.exist(indexPath: indexPath) {
            self.scrollToRow(at: indexPath, at: .top, animated: animated)
        }
    }
    
    /// Check existing of indexpath in tableview
    /// - Parameter indexPath: Target indexpath
    /// - Returns: Result of search
    func exist(indexPath: IndexPath) -> Bool {
        indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
    
}
