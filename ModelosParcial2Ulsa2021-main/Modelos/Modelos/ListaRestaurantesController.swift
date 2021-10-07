//
//  ViewController.swift
//  Modelos
//
//  Created by Alumno on 10/4/21.
//  Copyright © 2021 Alumno. All rights reserved.
//

import UIKit

class ListaRestaurantesController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tvRestaurantes: UITableView!
    var restaurantes : [Restaurante] = []
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda =  tableView.dequeueReusableCell(withIdentifier: "celdaRestaurante") as! CeldaRestaurantController
        celda.lblNombre.text = restaurantes[indexPath.row].nombre
        
        return celda
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destino = segue.destination as! DetallesRestaurantController
        destino.restaurante = restaurantes[tvRestaurantes.indexPathForSelectedRow!.row]
    }
   

    override func viewDidLoad() {
        self.title = "Restaurantes"
        
        super.viewDidLoad()
        restaurantes.append(Restaurante(nombre: "El Burguers" , direccion: "Calle Dos #123", horario: "De 12pm a 10pm" ))
        restaurantes.append(Restaurante(nombre: "Puerquitos" , direccion: "Calle tres #456", horario: "De 10am a 4pm" ))
        restaurantes.append(Restaurante(nombre: "Galliistacio" , direccion: "Calle cuatro #456", horario: "De 12pm a 3pm" ))
        // Do any additional setup after loading the view.
    }


}

