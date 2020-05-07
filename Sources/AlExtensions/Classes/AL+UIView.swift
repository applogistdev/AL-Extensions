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
    
    /// Set spesific corners
    /// - Parameters:
    ///   - corners: Which corners like to apply
    ///   - radius: Amount of radius
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    /// Fades in the view
    /// - Parameter duration: Animation duration **Default:0.1**
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
    /// - Parameter duration: Animation duration **Default:0.1**
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
    
    /// Adds shadow
    /// - Parameters:
    ///   - color: Shadow Color
    ///   - opacity: Opacity **(default: 0.5)**
    ///   - offset: Offset **(default: 0:3)**
    ///   - radius: Radius **(default: 3)**
    func addDropShadow(_ color: UIColor,
                       opacity: Float = 0.5,
                       offset: CGSize = CGSize(width: 0, height: 3),
                       radius: CGFloat = 3) {
        
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
    }
    
    /// Locks the view for seconds
    /// - Parameter seconds: Seconds
    func lock(for seconds: Double) {
        self.isUserInteractionEnabled = false
        let deadline = DispatchTime.now() + seconds
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.isUserInteractionEnabled = true
        }
    }
    
    /// Locks the view for 0.3 seconds
    func lockABit() {
        lock(for: 0.3)
    }
    
    /// Rotate view with angle value
    /// - Parameters:
    ///   - angle: Angle
    ///   - duration: Duration **(Default: 0.3)**
    func rotate(_ angle: CGFloat, duration: TimeInterval = 0.3) {
        UIView.animate(withDuration: duration) {
            self.transform = CGAffineTransform(rotationAngle: (angle * CGFloat.pi)/180)
        }
    }
    
    /// Gets screenshot of view
    /// - Returns: UIImage
    func screenshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        if let context = UIGraphicsGetCurrentContext() {
            self.layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            image?.resizableImage(withCapInsets: .zero)
            return image
        }
        return nil
    }
    
    /// Add dotted line
    /// - Parameters:
    ///   - point0: Starting point
    ///   - point1: Ending point
    ///   - dotWidth: Lenght of each dot in the line **(Default: 3)**
    ///   - gapWidth: Length of each gap in the line **(Default: 2)**
    ///   - lineWidth: Line width **(Default: 1)**
    ///   - color: Color of line **(Default: .lightGray)**
    func addDottedLine(startAt point0: CGPoint,
                       endAt point1: CGPoint,
                       dotWidth: NSNumber = 3,
                       gapWidth: NSNumber = 2,
                       lineWidth: CGFloat = 1,
                       color: UIColor = .lightGray) {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineDashPattern = [dotWidth, gapWidth] // 7 is the length of dash, 3 is length of the gap.
        
        let path = CGMutablePath()
        path.addLines(between: [point0, point1])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
    
    /// Adds indicator
    /// - Parameter style: Style of indicator **(Default: .gray)**
    func addIndicator(style: UIActivityIndicatorView.Style = .gray) {
        let indicator = UIActivityIndicatorView(style: style)
        indicator.tag = 0231
        self.addSubview(indicator)
        indicator.anchor().centerXToSuperview().activated()
        indicator.anchor().centerYToSuperview().activated()
        indicator.startAnimating()
    }
    
    /// Removes Indicator
    func removeIndicator() {
        self.subviews.forEach {
            if $0.isKind(of: UIActivityIndicatorView.self) && $0.tag == 0231 {
                $0.removeFromSuperview()
            }
        }
    }
}
