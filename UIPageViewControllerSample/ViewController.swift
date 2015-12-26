//
//  ViewController.swift
//  UIPageViewControllerSample
//
//  Copyright © 2015年 CrossBridge. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
 
    // ContainerView に Embed した UIPageViewController のインスタンスを保持する
    var pageViewController: UIPageViewController?
    
    // ページングして表示させる ViewControllerを保持する
    var vcArray = [DataViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Storyboard 上に配置した ViewController(StoryboardID = DataViewController) をインスタンス化して配列に追加する
        for index in 0...9 {
            let vc = storyboard?.instantiateViewControllerWithIdentifier("DataViewController") as! DataViewController
            vc.labelStr = index.description
            vcArray.append(vc)
        }
        
        // ContainerView に Embed した UIPageViewController を取得する
        pageViewController = childViewControllers[0] as? UIPageViewController
        
        // dataSource を設定する
        pageViewController!.dataSource = self
        
        // 最初に表示する画面として配列の先頭の ViewController を設定する
        pageViewController!.setViewControllers([vcArray[0]], direction: .Forward, animated: false, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // ボタンがタップされたらそれぞれ 0ページ、5ページ、9ページ目にジャンプさせる
    @IBAction func handleButton(sender: UIButton) {
        switch sender.tag {
        case 0:
            pageViewController!.setViewControllers([vcArray[0]], direction: .Forward, animated: false, completion: nil)
        case 1:
            pageViewController!.setViewControllers([vcArray[5]], direction: .Forward, animated: false, completion: nil)
        case 2:
            pageViewController!.setViewControllers([vcArray[9]], direction: .Forward, animated: false, completion: nil)
        default:
            break
        }
    }

    // 逆方向にページ送りした時に呼ばれるメソッド
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        guard let index = vcArray.indexOf(viewController as! DataViewController) where index > 0 else {
            return nil
        }
        
        return vcArray[index - 1]
    }

    // 順方向にページ送りした時に呼ばれるメソッド
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        guard let index = vcArray.indexOf(viewController as! DataViewController) where index < vcArray.count else {
            return nil
        }
        
        return vcArray[index + 1]
    }
}

