import UIKit

// --- EJEMPLO DE ESTRUCTURA ---
 
 struct Jugador {
     
     // --- EJEMPLO DE LET Y VAR ---
     
     // let significa que la propiedad es inmutable (NO puede cambiar de valor)
     let nombre: String
     // var significa que la propiedad es mutable (SI puede cambiar de valor)
     var antigüedad: Int
     var valoracion: Double

     

     func describir() {
         print("\(self.nombre) (\(self.antigüedad) años) [\(self.valoracion)]")
     }

 }

 let jugador1 = Jugador(nombre: "Pepe", antigüedad: 1, valoracion: 1.1)
 var jugador2 = Jugador(nombre: "Paco", antigüedad: 2, valoracion: 2.2)
 let jugador3 = Jugador(nombre: "Luis", antigüedad: 3, valoracion: 3.3)

 var jugador4 = jugador1
 let jugador5 = jugador2

 jugador4.valoracion = 5.0
 jugador2.antigüedad = 9

 jugador1.describir() // Pepe (1 años) [1.1]
 jugador2.describir() // Paco (9 años) [2.2]
 jugador3.describir() // Luis (3 años) [3.3]
 jugador4.describir() // Pepe (1 años) [5.0]
 jugador5.describir() // Paco (2 años) [2.2]
 
// --- EJEMPLO DE ENUMERACION ---

 enum PuntosCardinales {
     case norte
     case sur
     case este
     case oeste
 }

 //--- EJEMPLO DE  PROTOCOLO ---

 protocol CaminadorProtocol {
     
     func caminar()
     
 }

 //--- EJEMPLO DE CLASE ---

 class Persona {
     
     let nombre: String
     var antigüedad: Int
     var valoracion: Double
     var pasos: Int
     
     init(nombre: String) {
         self.nombre = nombre
         self.antigüedad = 0
         self.valoracion = 0.0
         self.pasos = 0
     }
 }

 //--- EJEMPLO DE HERENCIA ---

 // La clase JugadorC, hereda las propiedades de la clase Persona
 class JugadorC: Persona {
     
     // Puede hacer uso de las propiedades que se heredaron de la otra clase (nombre, antigüedad, pasos)
     // Se hace uso del enum para inidcar la direccion en la que el jugador se desplaza.
     func describir(direccion: PuntosCardinales) {
         print("\(self.nombre) tiene (\(self.antigüedad) años de antigüedad) y ha avanzado \(pasos) pasos hacia el \(direccion)")
     }

 }

 let jugador1c = JugadorC(nombre: "Pepe")
 var jugador2c : JugadorC? = JugadorC(nombre: "Paco")
 let jugador3c = JugadorC(nombre: "Luis")

 var jugador4c = jugador1c
 var jugador5c : JugadorC? = jugador2c

 jugador4c.valoracion = 5.0
 jugador2c!.antigüedad = 1

 jugador1c.describir(direccion: .norte) // Pepe tiene (0 años de antigüedad) y ha avanzado 0 pasos hacia el norte (modificado a través de jugador 4)
 jugador2c!.describir(direccion: .sur) // Paco tiene (1 años de antigüedad) y ha avanzado 0 pasos hacia el sur
 jugador3c.describir(direccion: .este) // Luis tiene (0 años de antigüedad) y ha avanzado 0 pasos hacia el este
 jugador4c.describir(direccion: .oeste) // Pepe tiene (0 años de antigüedad) y ha avanzado 0 pasos hacia el oeste
 jugador5c!.describir(direccion: .sur) // Paco tiene (1 años de antigüedad) y ha avanzado 0 pasos hacia el sur (modificado a través de jugador 2)


 //--- EJEMPLO DE EXTENSION ---

 // Se hace la extension para adoptar el metodo que contiene el protocolo CaminadorProtocol
 extension JugadorC: CaminadorProtocol {
     
     // Despues de adoptar el metodo que contiene el protocolo, se le da ka funcionalidad deseada.
     func caminar() {
         pasos += 5
     }
 }
 jugador5c!.caminar()
 jugador5c!.caminar()
 jugador5c!.describir(direccion: .norte) // Paco tiene (1 años de antigüedad) y ha avanzado 10 pasos hacia el norte










