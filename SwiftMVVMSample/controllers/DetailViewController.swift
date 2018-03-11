//
//  DetailViewController.swift
//  SwiftMVVMSample
//
//  Created by Spring Wong on 11/3/2018.
//  Copyright © 2018 Spring Wong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    lazy var simpleViewModel : SimpleViewModel = container.resolve(SimpleViewModel.self)!

    @IBOutlet weak var btnPush: UIButton!
    @IBOutlet weak var tvTitle: UILabel!
    @IBOutlet weak var btnPopAndPush: UIButton!
    @IBOutlet weak var tvLastUpdatedDate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _ = simpleViewModel.getMyProfile().subscribe(onSuccess: { (user) in
            self.tvTitle.text = user.login
            self.tvLastUpdatedDate.text = user.updated_at
        }) { (error) in
            print(error)
        }
        
        btnPush.rx.tap.bind {
            self.navigationController?.pushViewController(DetailViewController(), animated: true)
        }
        
        btnPopAndPush.rx.tap.bind {
            self.navigationController?.popToRootViewController(animated: true)
//            self.navigationController?.pushViewController(DetailViewController(), animated: true)
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
