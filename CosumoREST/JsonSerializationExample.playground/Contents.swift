import UIKit

let student = [
    "name":"Rogelio",
    "age":6
] as [String:AnyObject]

JSONSerialization.isValidJSONObject(student)

do{
    // Creando el obj json a partir de un obj foundation.
    let data = try JSONSerialization.data(withJSONObject: student)
    // Visualizar el obj JSON como un str.
    let jsonString = String(data: data, encoding: .utf8)
    //JSONSerialization.isValidJSONObject(jsonString)
    let studentDictionary = try JSONSerialization.jsonObject(with: data)
}catch{
    print("Error: \(error)")
}

// var myDouble =  3.14159
// String(format: "%.2f", myDouble)
// \(myDouble, specifier: "%.2f")

let jsonString = """
{

  "squadName": "Super hero squad",

  "homeTown": "Metro City",

  "formed": 2016,

  "secretBase": "Super tower",

  "active": true,

  "members": [

    {

      "name": "Molecule Man",

      "age": 29,

      "secretIdentity": "Dan Jukes",

      "powers": [

        "Radiation resistance",

        "Turning tiny",

        "Radiation blast"

      ]

    },

    {

      "name": "Madame Uppercut",

      "age": 39,

      "secretIdentity": "Jane Wilson",

      "powers": [

        "Million tonne punch",

        "Damage resistance",

        "Superhuman reflexes"

      ]

    },

    {

      "name": "Eternal Flame",

      "age": 1000000,

      "secretIdentity": "Unknown",

      "powers": [

        "Immortality",

        "Heat Immunity",

        "Inferno",

        "Teleportation",

        "Interdimensional travel"

      ]

    }

  ]

}
"""

if let jsonData = jsonString.data(using: .utf8){
    do {
        if let jsonObject = try JSONSerialization.jsonObject(with: jsonData) as? [String:Any]{
            let foundationObj = NSDictionary(dictionary: jsonObject)
            print(foundationObj)
            print(type(of: foundationObj))
            print(foundationObj["squadName"] ?? "No se encontro ningun elemento con el indice /'squadName/'")
            if let membersDict = foundationObj["members"]{
                dump(membersDict)
                for i in membersDict as! [[String:Any]] {
                    dump(i)
                    /*if i.key == "name" {
                        if i.value as! String == "Madame Uppercut"{
                            dump(i)
                        }
                    }*/
                }
            }
        }
    }catch{
        print("Error: \(error)")
    }
}
