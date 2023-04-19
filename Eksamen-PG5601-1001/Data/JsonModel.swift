import Foundation

//The URL we have goten form the exam
let fruityViceUrl = "https://fruityvice.com/api/fruit/all"

//Creating a structure of the fruits
struct JasonFruit: Identifiable, Decodable {
    let id: Int
    let name: String
    let family: String
    let genus: String
    let order: String
    let nutritions: JasonNutritions
}


//Creating the structure of
struct JasonNutritions: Decodable {
    let carbohydrates: Double
    let calories: Double
    let protein: Double
    let sugar: Double
    let fat: Double
}


final class JsonModel: ObservableObject {
    @Published var fruits: [JasonFruit] = []
    
    func getFruits() async {
        //Opening connection the given url
        guard let myurl = URL(string: fruityViceUrl) else {
            print("No response from server: \(fruityViceUrl)")
            return
        }
        
        do {
            //Transfering data from the fruity vice server.
            let (data, _) = try await URLSession.shared.data(from: myurl)
            
            //Decoding from JSON format.
            fruits = try JSONDecoder().decode([JasonFruit].self, from: data)
        }
        catch{
            print("Could not decode the transfered data\n\(fruityViceUrl)")
        }
    }
}
