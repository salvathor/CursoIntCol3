import UIKit

// Ejemplo 1 - PROPIEDAD COMPUTADA

struct Circulo {
    
    var radio: Double
    
    var area: Double {
        get {
            return Double.pi * pow(radio, 2)
        }
    }
    
}

let myCirculo = Circulo(radio:5)

dump(myCirculo)
myCirculo.area

// Ejemplo 2 - PROPIEDAD COMPUTADA

struct Contacto {
    var dia: Int
    var mes: Int
    var anio: Int
    
    var edad: Int {
        let currentDate = Date()
        let calendar =  Calendar.current
        
        let currentDateComponents = calendar.dateComponents([.year, .month, .day], from: currentDate)
        
        let birthDateComponents = DateComponents(year: anio,month: mes, day: dia)
        
        let ageComponents = calendar.dateComponents([.year], from: birthDateComponents, to: currentDateComponents)
        
        return ageComponents.year ?? 0
    }
}

let contacto1 = Contacto(dia: 3, mes: 1, anio: 1989)
print("Edad: \(contacto1.edad) años")
