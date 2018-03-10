//
//  SimpleViewController.swift
//  SwiftMVVMSample
//
//  Created by Spring Wong on 10/3/2018.
//  Copyright © 2018 Spring Wong. All rights reserved.
//

import UIKit
import RxCocoa

class SimpleViewController: UIViewController {
    
    @IBOutlet weak var tvTitle: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    lazy var simpleViewModel : SimpleViewModel = getAppDelegate().getContainer().resolve(SimpleViewModel.self)!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _ = simpleViewModel.getMyProfile().subscribe { (event) in
            switch event {
            case let .success(response) :
                self.tvTitle.text = response.login
                print(response.toJSONString(prettyPrint: true))
                break
            case let .error(error) :
                print(error)
                break
            }
        }
        _ = btnNext.rx.tap.bind {
            self.navigationController?.pushViewController(DetailViewController(), animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
