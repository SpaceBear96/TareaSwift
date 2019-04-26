//
//  CrearCursoViewController.swift
//  Cursos
//
//  Created by Cafu on 12/04/19.
//  Copyright © 2019 Cafu . All rights reserved.
//

import UIKit

class CrearCursoViewController: UIViewController {
    
    @IBOutlet weak var txtNombreCurso: UITextField!
    @IBOutlet weak var txtPracticaCurso: UITextField!
    @IBOutlet weak var txtLaboratorioCurso: UITextField!
    @IBOutlet weak var txtFinalCurso: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func agregar(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let curso = Curso(context : context)
        curso.nombre = txtNombreCurso.text!
        curso.practica = Float(txtPracticaCurso.text!)!
        curso.laboratorio = Float(txtLaboratorioCurso.text!)!
        curso.final = Float(txtFinalCurso.text!)!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
    

}
