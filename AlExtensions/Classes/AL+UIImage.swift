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
}
