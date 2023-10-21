//
//  ContentView.swift
//  Fetch_iOS_Coding_Challenge
//
//  Created by Mihir Gupta on 10/20/23.
//

import SwiftUI


struct Meal : Hashable, Codable {
    var strMeal : String
    var strMealThumb : String
    var idMeal : String
    
}


struct ContentView: View {
    @State private var meals = [Meal]()
    var body: some View {
        NavigationView {
            List(meals, id : \.idMeal){ meal in
                VStack(alignment: .leading) {
                    Text(meal.strMeal)
                        .font(.headline)
                        .foregroundStyle(Color.black)
                    //Image(meal.strMealThumb)
                    
                    
                }
                
            }
            .navigationTitle("Meals")
            .task {
                await fetchData()
            }
        }
    }
    
    func fetchData() async{
        //create url
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else{
            print("URL doesn't work")
            return
        }
        //fetch data from that url
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //decode that data
            if let decodedResponse = try? JSONDecoder().decode([Meal].self, from: data){
                meals = decodedResponse
            }
        }
        catch{
            print("data isnt valid")
        }
        
        
        
        
    }
}

#Preview {
    ContentView()
}
