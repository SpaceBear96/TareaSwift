//
//  ViewController.swift
//  Cursos
//
//  Created by Cafu on 12/04/19.
//  Copyright © 2019 Cafu . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var cursos:[Curso] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    @IBAction func nuevoCurso(_ sender: Any) {
        performSegue(withIdentifier: "agregarCurso", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let curso = cursos[indexPath.row]
        let promedioFinal = (curso.practica + curso.laboratorio + curso.final) / 3
        if promedioFinal >= 13  {
            cell.backgroundColor = UIColor.blue
            cell.textLabel?.text = "🤩 | Curso de \(curso.nombre!) - Nota : \(promedioFinal)"
        }else {
            cell.backgroundColor = UIColor.red
            cell.textLabel?.text = "😰 | Curso de \(curso.nombre!) - Nota : \(promedioFinal)"
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            context.delete(cursos[indexPath.row])
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            navigationController!.popViewController(animated: true)
            obtenerCursos()
            tableView.reloadData()
        }
    }
    
    
    func obtenerCursos(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            cursos = try context.fetch(Curso.fetchRequest()) as! [Curso]
        }catch{
            print("Error")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerCursos()
        tableView.reloadData()
    }
}

