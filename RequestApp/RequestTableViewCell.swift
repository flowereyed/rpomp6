import UIKit
import SDWebImage

class RequestTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var identifierLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func setup(request: NasaRequest) {
        identifierLabel.text = "Identifier: \(request.identifier)"
        captionLabel.numberOfLines = 0
        captionLabel.text = "Caption: \(request.caption)"
        dateLabel.text = "Date: \(request.date)"
        pictureView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        pictureView.sd_setImage(with: request.getImageURL(), placeholderImage: UIImage())
    }
}
