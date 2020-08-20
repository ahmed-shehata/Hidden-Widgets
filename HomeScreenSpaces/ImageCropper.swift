//
//  ImageCropper.swift
//  HomeScreenSpaces
//
//  Created by Aryan Chaubal on 8/3/20.
//

import UIKit
import WidgetKit

class ImageCropper {
        
    static let shared = ImageCropper()
    
    func cropAndStoreImages(image: UIImage) {
        let resolution = getScreenResolution()
        storePNG(image: image, filename: "original")
        cropAndStoreSmall(image: image, r: resolution)
        cropAndStoreMedium(image: image, r: resolution)
        cropAndStoreLarge(image: image, r: resolution)
        
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    func getScreenResolution() -> String {
        let size = UIScreen.main.bounds.size
        let scale = UIScreen.main.scale
        let resolution = "\(Int(size.width * scale))x\(Int(size.height * scale))"
        print("Pixels: \(Int(size.width * scale))x\(Int(size.height * scale))")
        print("Points: \(Int(size.width))x\(Int(size.height))")
        return resolution
    }
    
    private func cropAndStoreSmall(image: UIImage, r: String) {
        let topSpacing = Measurements.TOP_SPACING[r]!
        let leftSpacing = Measurements.LEFT_SPACING[r]!
        let horizontalSpacing = Measurements.HORIZONTAL_SPACING[r]!
        let verticalSpacing = Measurements.VERTICAL_SPACING[r]!
        let dim = Measurements.WIDGET_SIZE[r]!
        guard let topLeft = cropImage(image: image, x: leftSpacing, y: topSpacing, width: dim, height: dim) else { return }
        storePNG(image: topLeft, filename: "topLeftSmall")
        guard let topRight = cropImage(image: image, x: leftSpacing + horizontalSpacing, y: topSpacing, width: dim, height: dim) else { return }
        storePNG(image: topRight, filename: "topRightSmall")
        guard let midLeft = cropImage(image: image, x: leftSpacing, y: topSpacing + verticalSpacing, width: dim, height: dim) else { return }
        storePNG(image: midLeft, filename: "midLeftSmall")
        guard let midRight = cropImage(image: image, x: leftSpacing + horizontalSpacing, y: topSpacing + verticalSpacing, width: dim, height: dim) else { return }
        storePNG(image: midRight, filename: "midRightSmall")
        guard let bottomLeft = cropImage(image: image, x: leftSpacing, y: topSpacing + 2 * verticalSpacing, width: dim, height: dim) else { return }
        storePNG(image: bottomLeft, filename: "bottomLeftSmall")
        guard let bottomRight = cropImage(image: image, x: leftSpacing + horizontalSpacing, y: topSpacing + 2 * verticalSpacing, width: dim, height: dim) else { return }
        storePNG(image: bottomRight, filename: "bottomRightSmall")
    }
    
    private func cropAndStoreMedium(image: UIImage, r: String) {
        let topSpacing = Measurements.TOP_SPACING[r]!
        let leftSpacing = Measurements.LEFT_SPACING[r]!
        let horizontalSpacing = Measurements.HORIZONTAL_SPACING[r]!
        let verticalSpacing = Measurements.VERTICAL_SPACING[r]!
        let dim = Measurements.WIDGET_SIZE[r]!
        guard let top = cropImage(image: image, x: leftSpacing, y: topSpacing, width: dim + horizontalSpacing, height: dim) else { return }
        storePNG(image: top, filename: "topMedium")
        guard let mid = cropImage(image: image, x: leftSpacing, y: topSpacing + verticalSpacing, width: dim + horizontalSpacing, height: dim) else { return }
        storePNG(image: mid, filename: "midMedium")
        guard let bottom = cropImage(image: image, x: leftSpacing, y: topSpacing + 2 * verticalSpacing, width: dim + horizontalSpacing, height: dim) else { return }
        storePNG(image: bottom, filename: "bottomMedium")
    }
    
    private func cropAndStoreLarge(image: UIImage, r: String) {
        let topSpacing = Measurements.TOP_SPACING[r]!
        let leftSpacing = Measurements.LEFT_SPACING[r]!
        let horizontalSpacing = Measurements.HORIZONTAL_SPACING[r]!
        let verticalSpacing = Measurements.VERTICAL_SPACING[r]!
        let dim = Measurements.WIDGET_SIZE[r]!
        guard let top = cropImage(image: image, x: leftSpacing, y: topSpacing, width: dim + horizontalSpacing, height: dim + verticalSpacing) else { return }
        storePNG(image: top, filename: "topLarge")
        guard let bottom = cropImage(image: image, x: leftSpacing, y: topSpacing + verticalSpacing, width: dim + horizontalSpacing, height: dim + verticalSpacing) else { return }
        storePNG(image: bottom, filename: "bottomLarge")
    }
    
    private func cropImage(image: UIImage, x: Int, y: Int, width: Int, height: Int) -> UIImage? {
        guard let cgImage = image.cgImage else { return nil }
        guard let croppedImage = cgImage.cropping(to: CGRect(x: x, y: y, width: width, height: height)) else { return nil }
        return UIImage(cgImage: croppedImage)
    }
    
    private func storePNG(image: UIImage, filename: String) {
        let fileManager = FileManager.default
        guard let url = fileManager.containerURL(forSecurityApplicationGroupIdentifier: "group.com.aryanchaubal.homescreenspaces") else { return }
        guard let imageData = image.pngData() else { return }
        let filePathURL = url.appendingPathComponent("\(filename).png")
        print(filePathURL)
        fileManager.createFile(atPath: filePathURL.path, contents: imageData, attributes: nil)
    }
    
    private init() { }
    
}
