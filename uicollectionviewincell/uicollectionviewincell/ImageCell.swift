//
//

import UIKit

class ImageCell : UICollectionViewCell{
    
    var imageView : UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: frame)
        self.addSubview(imageView)
        imageView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
        }
        self.imageView.image = UIImage(named: "mw.png")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
