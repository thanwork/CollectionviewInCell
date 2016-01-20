//
//  MyTableViewCell.swift
//  uicollectionviewincell
//
//  Created by 冉小刚 on 16/1/19.
//  Copyright © 2016年 ThanWork. All rights reserved.
//

import UIKit

class MyTableViewCell : UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    var content: UILabel!
    var imageCollectionView : UICollectionView!
    var flowLayout : UICollectionViewFlowLayout!
    
    
    var images = [String]()
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
        self.imageCollectionView.registerClass(ImageCell.self, forCellWithReuseIdentifier: "data image")
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    
    func initView(){
        content = UILabel()
        content.text = "111111111111111"
        self.addSubview(content)
        content.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(8)
            make.right.equalTo(self).offset(-8)
            make.top.equalTo(self).offset(8).priorityLow()
        }
        content.font = UIFont.systemFontOfSize(14)
        content.numberOfLines = 3
        
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSizeMake(100, 100)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical//设置垂直显示
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10)//设置边距
        flowLayout.minimumLineSpacing = 10.0;//每个相邻layout的上下
        flowLayout.minimumInteritemSpacing = 0.0;//每个相邻layout的左右
        flowLayout.headerReferenceSize = CGSizeMake(0, 0);
        imageCollectionView = UICollectionView(frame: CGRectZero,collectionViewLayout: flowLayout)
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.backgroundColor = UIColor.whiteColor()
        self.addSubview(imageCollectionView)
        imageCollectionView.snp_makeConstraints{ (make) -> Void in
            make.left.equalTo(self)
            make.top.equalTo(content.snp_bottom).offset(8)
            make.width.equalTo(340)
            make.height.equalTo(150)
            make.bottom.equalTo(self).offset(-8)
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var image = images[indexPath.row]
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("data image", forIndexPath: indexPath) as! ImageCell
        cell.imageView.image = UIImage(named: image)
        return cell
    }
    
    
}

