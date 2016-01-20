//
//  MyCollectionView.swift
//  uicollectionviewincell
//
//  Created by 冉小刚 on 16/1/19.
//  Copyright © 2016年 ThanWork. All rights reserved.
//

import UIKit
import SnapKit

class MyTableView : UIViewController,UITableViewDataSource,UITableViewDelegate{
    var tableView : UITableView!
    var testDatas = [TestData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        prepareData()
        self.title = "collectionview放入tableview中"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(MyTableViewCell.self, forCellReuseIdentifier: "data detail")
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension

    }
    
    func prepareData(){
        var testData0 = TestData()
        testData0.content = "名往-发现名字背后的性格与故事"
        testData0.images = ["mw.png","mw.png"]
        var testData1 = TestData()
        testData1.content = "名往-发现名字背后的性格与故事"
        testData1.images = ["mw.png","mw.png","mw.png","mw.png"]
        var testData2 = TestData()
        testData2.content = "名往-发现名字背后的性格与故事"
        testData2.images = ["mw.png","mw.png","mw.png","mw.png","mw.png","mw.png","mw.png","mw.png","mw.png"]
        var testData3 = TestData()
        testData3.content = "名往-发现名字背后的性格与故事"
        testDatas.append(testData3)
        testDatas.append(testData0)
        testDatas.append(testData1)
        testDatas.append(testData2)
        
    }
    
    func initView(){
        let mainView = UIView(frame: UIScreen.mainScreen().bounds)
        mainView.backgroundColor = UIColor.whiteColor()
        self.view = mainView

        tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.view)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.top.equalTo(self.view)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testDatas.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellIdentifier : String
        cellIdentifier = "data detail"
        var testData = testDatas[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MyTableViewCell
        cell.imageCollectionView.snp_updateConstraints{ (make) -> Void in
                make.top.equalTo(cell.content.snp_bottom)
                //                make.width.equalTo(300)
                if(testData.images.count == 0){
                    make.height.equalTo(0)
                }else if(testData.images.count <= 3){
                    make.height.equalTo(120)
                }else if(testData.images.count <= 6){
                    make.height.equalTo(230)
                }else{
                    make.height.equalTo(340)
                }
                
        }
        cell.images = testData.images
        cell.content.text = testData.content
        cell.imageCollectionView.reloadData()
        return cell
    }

}
