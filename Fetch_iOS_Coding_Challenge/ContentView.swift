//
//  ContentView.swift
//  Fetch_iOS_Coding_Challenge
//
//  Created by Mihir Gupta on 10/20/23.
//

import SwiftUI

struct Response : Codable{
    let meals : [MyMeal]
}
struct MyMeal :  Codable {
    var strMeal : String
    var strMealThumb : String
    var idMeal : String
    
}


struct ContentView: View {
    @State private var myMeals = [MyMeal]()
    var body: some View {
        NavigationView {
            List(myMeals, id : \.idMeal){ meal in
                VStack(alignment: .leading) {
                    Text(meal.strMeal)
                        .font(.headline)
                        .foregroundStyle(Color.black)
                    //Image(meal.strMealThumb)
                    
                    
                }
                
            }
            .navigationTitle("Meals")
            .task {
               // await fetchData()
                getData()
                
            }
        }
    }
    
    //let url = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    
    
    func getData(){
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else{
            print("URL doesn't work")
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            guard let data = data, error == nil else{
                print("Something went wrong")
                return
            }
            
            //now I have the data
            var meals : Response?
            do{
                meals = try JSONDecoder().decode(Response.self, from: data)
            }
            catch{
                print(String(describing:error))
            }
            guard let json = meals else{
                return
            }
            
            print(json.meals.first?.strMeal)
            //print(json.meals.idMeal)
        })
        task.resume()
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
            if let decodedResponse = try? JSONDecoder().decode([MyMeal].self, from: data){
                myMeals = decodedResponse
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
