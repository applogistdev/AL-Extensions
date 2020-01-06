import UIKit

public extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    /// Set spesific corners (Eg. just bottom or top) with radius
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    /// Fades in the view
    func fadeIn(duration: TimeInterval = 0.1) {
        if !self.isHidden {
            return
        }
        DispatchQueue.main.async {
            self.alpha = 0.0
            self.isHidden = false
            UIView.animate(withDuration: duration) {
                self.alpha = 1.0
            }
        }
    }
    
    /// Fades out the view
    func fadeOut(duration: TimeInterval = 0.1) {
        if self.isHidden {
            return
        }
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration, delay: 0, options: [.layoutSubviews], animations: {
                self.alpha = 0.0
            }, completion: { (done) in
                self.isHidden = done
            })
        }
    }
}
