//
//  ContentView.swift
//  Fetch_iOS_Coding_Challenge
//
//  Created by Mihir Gupta on 10/20/23.
//

import SwiftUI


struct Meal : Hashable, Codable {
    let name : String
    let thumbnail : String
    let id : String
    
}

class ViewModel<ObjectType: ObservableObject>{
    @Published var meals : [Meal] = []
    func fetch() completion{
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self ] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            //convert to JSON
            do{
                let meals = try JSONDecoder().decode([Meal.self], from: data)
                DispatchQueue.main.async{
                    self?.meals = meals
                }
            }
           catch{
                print(error)
            }
        }
        task.resume()
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                
            }
        }
        .navigationTitle("Meals")
    }
}

#Preview {
    ContentView()
}
