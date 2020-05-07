import UIKit

public extension UIImage {
    
    /// Colorized image
    ///
    /// - Parameter color: The color you want to change
    /// - Returns: Colorized UIImage
    func colorized(with color: UIColor?) -> UIImage {
        guard let color = color else { return self }
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0.0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(.normal)
        
        let rect = CGRect(x: 0.0, y: 0.0, width: self.size.width, height: self.size.height)
        context?.clip(to: rect, mask: self.cgImage!)
        
        color.setFill()
        context?.fill(rect)
        
        let colorizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return colorizedImage.withRenderingMode(.alwaysOriginal)
    }
    
    /// Creates UIImage with grandiented colors
    /// - Parameters:
    ///   - startColor: Starting Color
    ///   - endColor: Ending Color
    ///   - size: Size of UIImage
    ///   - horizontally: If true horizontal gradient, otherwise would be vertical
    /// - Returns: Created UIImage with gradient background color
    class func gradiented(startColor:UIColor, endColor:UIColor, size:CGSize, horizontally:Bool = true) -> UIImage? {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        if horizontally {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        } else {
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        }
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// Returns by adding  **withRenderingMode(.alwaysOriginal)**
    func original() -> UIImage {
        return self.withRenderingMode(.alwaysOriginal)
    }
}
