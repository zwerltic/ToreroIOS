//
//  SolicitaViewController.swift
//  Torero
//
//  Created by Jose on 8/8/15.
//  Copyright (c) 2015 toreo. All rights reserved.
//

import UIKit

var nameSaved: String!
var lastSaved: String!
var streetSaved: String!
var numberSaved: String!
var coloniaSaved:String!
var delegacionSaved:String!
var juzgadoSaved:String!
var itineranteSaved: String!

class SolicitaViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var nameTextField : UITextField!
    @IBOutlet var lastTextField : UITextField!
    @IBOutlet var streetTextField : UITextField!
    @IBOutlet var numberTextField : UITextField!
    @IBOutlet var coloniaTextField : UITextField!
    @IBOutlet var delegacionTextField: UITextField!
    @IBOutlet var juzgadoTextField: UITextField!
    @IBOutlet var itineranteTextField: UITextField!
    
    
   
    var pickDelegaciones = ["Álvaro Obregón", "Azcapotzalco", "Benito Juárez", "Coyoacán", "Cuauhtémoc", "Cuajimalpa", "Gustavo A. Madero", "Iztacalco", "Iztapalapa", "Magdalena Contreras", "Miguel Hidalgo", "Milpa Alta", "Tláhuac", "Tlalpan", "Venustiano Carranza", "Xochimilco"]
    var pickItinerantes = ["Grupo 1, Juez: Lic. Luis Brugada Yañez", "Grupo 2, Juez: Lic Fernando Alberto Vilchis Leija", "Grupo 3, Juez: Lic. Yajseel Yadira Beltrán Navarro", "Grupo 4, Juez: Lic. César Omar Rico Morales", "Grupo 5, Juez: Lic. Daniel Acosta Sánchez", "Grupo 6, Juez: Lic. José Daniel Pérez Martínez", "Grupo 7, Juez: Lic. Pablo Cesar Pérez Mondragon"]
    var pickAlvaro = ["1. Escuadrón 201 Esq. Batallón de San Patricion S/N Col. Cristo Rey", "2. Camino Real de Toluca S/N entre paralela 2 y 3, Col. José María", "3. Tlaxcala y Av. México, Col. Progreso"]
    var pickAzcapotzalco = ["1. Av. de las Culturas y Eje 5 Norte, Col. Unidad El Rosario", "2. Av. 22 de Febrero y Castilla Oriente, Col. Santa Cruz Atoyac"]
    var pickBenito = ["1. Av. División del Norte, Esq. Eje 7 Sur Municipio Libre, Col. Santa Cruz Atoyac", "3. Obrero Mundial y Yacatas, Col. Piedad Narvarte", "5. Bretaña Nº6 y Orinoco, Col. Portales"]
    var pickCoyoacan = ["1. Tecualiapan y Zompantitlan, Col. Romero de Terreros", "3. Apaches y Eje 3 Oriente, Cafetales S/N, Col. San Francisco Culhuacán", "4. Tepalcatzin y Meconetzin, Col. Ajusco Zona Pedregal", "5. Canal Nacional y Laura Méndez Cuenca, Col. CTM Culhuacán"]
    var pickCuauhtemoc = ["1. Lerdo Nº322, Col. San Simón Tolnahúacan", "2. Aldama y Mina, Col. Buenavista", "3. Paseo de la Reforma Nº705, Col. Morelos", "4. Centro de Legalidad y Justicia Paraguay No. 37, Col Centro", "5. Santa María La Rivera Nº 35, Col. Sta. María La Rivera", "8. Plaza Pino Suárez, Colonia Centro"]
    var pickCuajimalpa = ["1. Castillo Ledón y Cerrada Ramírez, Col. Cuajimalpa de Morelos"]
    var pickGustavo = ["1. Emiliano Zapata y Guadalupe Victoria, Col. Cuautepec Barrion Bajo", "2. Cerrada Sur de los 100 M. S/N entre Vallejo y Eje Central, Col. Vallejo", "4. Vicnete Villada y 5 de Febrero, Col. Aragón la Villa", "5. Av. 416, Esq. Loreto Favela, Col. San Juan de Aragón", "6. Malitzin nº 146 y 148 Esq. Francisco Novo, Col. Aragón la Villa", "8. Av. 661, Entre Av. 606, Col. San Juan de Aragón 6º Sección"]
    var pickIztacalco = ["1. Av. Congreso de la Unión casi Esq. con Av. Coyuya, Col. Santa Anita", "2. Sur 157 y Calle THE, Col. Gabriel Ramos Millán"]
    var pickIztapalapa = ["1. Callejón Circunvalación Esq. Ermita Iztapalapa, Col. Granjas San Antonio", "3. Churubusco y Apatalco, Col. San José Aculco", "4. 5 de Mayo y Callejón Victoria Col. Barrio San Lucas", "5. Campaña del Ebano Nº20 entre Revolución Social y Combate de Celaya, U. H. Vicente Guerrero", "6. Calle Tres y Telecomunicaciones, Col. Tepalcates", "7. Calzada San Lorenzo Tezonco Nº 310, Col. San Nicolás Tolentino", "9. Calz. Ermita Iztapalapa, Esq. Zacatepec, Col. Santa Maria Acatitlan"]
    var pickMagdalena = ["1. Av. San Jerónimo Nº 2625, Esq. Soledad, Col. Lomas San Bernabé", "2. Cruz Verde Nº 4, Col. San Nicolás"]
    var pickMiguel = ["1. Calzada México Tacuba y Mar Arábigo, Col. Tacuba", "3. Parque Lira Nº 94, Esq. Vicente Eguia, Col. Daniel Garza"]
    var pickMilpa = ["1. Av. Jalisco, casi Esq. con Av. México, Col. Barrio San Mateo", "2. Prolongación Ignacio Zaragoza y 5 de Mayo, Col. San Antonio Tecomilt"]
    var pickTlahuac = ["1. Av. Canal de Chalco S/N entre Piraña y Langosta Col. del Mar", "2. Nicolás Bravo S/N, Av.Tlahuac Barrio la Asunción"]
    var pickTlalpan = ["1. Carretera Picacho Ajusco KM. 45, Col. Ampliación Miguel Hidalgo.", "3. Matamoros y Jojutla, Col. La Joya", "4. Canal Nacional, Esq. Anillo Periférico Sur (a un costado de la U. H. Dr. Ignacio Chávez"]
    var pickVenustiano = ["1. San Ciprián Nº 63 y General Ayala, Col. Centro", "2. Boulevard Puerto Aéreo y Norte 13, Col. Moctezuma 2ª sección", "3. Fray Servando T. de Mier y Fco. del Paso y Troncoso, Col. Jardín Balbuena", "Calle Circunvalación y Prolongación Rio Churubusco Col. El Caracol"]
    var pickXochimilco = ["1. Circuito Martínez de Castro S/N Pueblo San Mateo Xalpa", "2. Cuitláhuac y Gladiolas, Col. Barrio San Pedro Xochimilco"]
    
    
    var selectedDelegacion = []
    var pickerDelegaciones = UIPickerView()
    var pickerJuzgado = UIPickerView()
    var pickerItinerante = UIPickerView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerDelegaciones.delegate = self
        pickerDelegaciones.tag = 1
        delegacionTextField.inputView = pickerDelegaciones
        
        pickerJuzgado.delegate = self
        pickerJuzgado.tag = 2
        juzgadoTextField.inputView = pickerJuzgado
        
        pickerItinerante.delegate = self
        pickerItinerante.tag = 3
        itineranteTextField.inputView = pickerItinerante
        
        
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch = touches.first as? UITouch {
            view.endEditing(true)
        }
        super.touchesBegan(touches , withEvent:event)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return pickDelegaciones.count
        } else if pickerView.tag == 2 {
            return selectedDelegacion.count
        } else if pickerView.tag == 3 {
            return pickItinerantes.count
        }
        return 0
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if pickerView.tag == 1 {
            return pickDelegaciones[row]
        } else if pickerView.tag == 2 {
            return selectedDelegacion[row] as! String
        } else if pickerView.tag == 3 {
            return pickItinerantes[row]
        }
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.textAlignment = .Center
        if pickerView.tag == 1 {
            let titleData = pickDelegaciones[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 14.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
            pickerLabel.attributedText = myTitle
        } else if pickerView.tag == 2 {
            let titleData = selectedDelegacion[row] as! String
            let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 14.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
            
            pickerLabel.attributedText = myTitle
        } else if pickerView.tag == 3 {
            let titleData = pickItinerantes[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 14.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
            pickerLabel.attributedText = myTitle
        }
        return pickerLabel
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            switch row {
            case 0:
                selectedDelegacion = pickAlvaro
            case 1:
                selectedDelegacion = pickAzcapotzalco
            case 2:
                selectedDelegacion = pickBenito
            case 3:
                selectedDelegacion = pickCoyoacan
            case 4:
                selectedDelegacion = pickCuajimalpa
            case 5:
                selectedDelegacion = pickCuauhtemoc
            case 6:
                selectedDelegacion = pickGustavo
            case 7:
                selectedDelegacion = pickIztacalco
            case 8:
                selectedDelegacion = pickIztapalapa
            case 9:
                selectedDelegacion = pickMagdalena
            case 10:
                selectedDelegacion = pickMiguel
            case 11:
                selectedDelegacion = pickMilpa
            case 12:
                selectedDelegacion = pickTlahuac
            case 13:
                selectedDelegacion = pickTlalpan
            case 14:
                selectedDelegacion = pickVenustiano
            case 15:
                selectedDelegacion = pickXochimilco
            default:
                selectedDelegacion = []
            }
            delegacionTextField.text = pickDelegaciones[row]
            // IMPORTANT reload the data on the item picker
            pickerJuzgado.reloadAllComponents()
        } else if pickerView.tag == 2 {
            // Get the current item
            juzgadoTextField.text = selectedDelegacion[row] as! String
        } else if pickerView.tag == 3 {
            itineranteTextField.text = pickItinerantes[row]
        }
        
    }
    
    

    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue,
        sender: AnyObject!){
            
            nameSaved = nameTextField.text;
            lastSaved = lastTextField.text;
            streetSaved = streetTextField.text;
            numberSaved = numberTextField.text;
            coloniaSaved = coloniaTextField.text;
            delegacionSaved = delegacionTextField.text;
            juzgadoSaved = juzgadoTextField.text;
            itineranteSaved = itineranteTextField.text;
        
    }
   
    
    
}
