//
//  AddTaskViewController.swift
//  Simple Note
//
//  Created by Abi Sayuti on 10/24/17.
//  Copyright © 2017 AbiSayuti. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var etNametask: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSaveTask(_ sender: Any) {
        
        //deklarasi context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //deklarasi task
        let nameTask = Task(context: context) //deklarasi nameTask sbg konteks dari entiti task
        nameTask.name_task = etNametask.text //mendeklarasikan bahwa nametask.name_task itu isinya dari etNameTask.text
        //proses penyimpanan data ke core data
        //mengecek apakah nilai name-task itu isinya kosong atau tidak
        if etNametask.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            
            let alertController = UIAlertController(title: "Warning",
                                                    message: "Task Can't Be Empty", preferredStyle : .alert)
            alertController.addAction(UIAlertAction(title: "OK",
                                                    style: .default,handler: nil))
             present(alertController, animated: true, completion: nil)
        }else{
            //ketika kondisi teks task nya tidak kosong
            //data disimpan ke core data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            _ = navigationController?.popViewController(animated: true)
            
            //mencetak kalau data berhasil ditambahkan
            print("Data berhasil disimpan")
            
            
            
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
