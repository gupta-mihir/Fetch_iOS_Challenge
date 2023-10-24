//
//  ContentView.swift
//  Fetch_iOS_Coding_Challenge
//
//  Created by Mihir Gupta on 10/20/23.
//

import SwiftUI



struct Response : Hashable, Codable{
    let meals : [MyMeal]
}
struct MyMeal :  Hashable, Codable {
    var strMeal : String
    var strMealThumb : String
    var idMeal : String
    //var strInstructions : String
    
}

struct Root : Hashable, Codable {
    var child : [Child]
}

struct Child : Hashable, Codable {
    var idMeal : String
}
class ViewModel : ObservableObject {
    @Published var responses : [Response] = []
    @Published var meals : [MyMeal] = []
    
    
    func getData() {
        
        //let urlStr2 = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + id
        let urlStr = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        guard let url = URL(string: urlStr)
        else {
            print("URL doesn't work")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            guard let data = data, error == nil else{
                print("Something went wrong")
                return
            }
            
            //now I have the data
            var desserts : Response?
            do {
                desserts = try JSONDecoder().decode(Response.self, from: data)
               //print(desserts!)
                //print(desserts!.meals)
                
               // print(self.responses.first?.meals.first?.strMeal as Any)
                //self.meals = desserts!.meals
                DispatchQueue.main.async {
                    self.meals = desserts!.meals
                }
                self.meals = desserts!.meals
                print(self.meals)
            }
            catch{
                print(String(describing:error))
            }
            
            guard let json = desserts else{
                return
            }
            
            //print(json.meals.first?.strMeal)
            //print(json.meals.first?.idMeal)
            
        })
        task.resume()
    }
}


class ViewModel4 : ObservableObject {
    @Published var root : [Root] = []
    @Published var child : [Child] = []
    
    func getData2() {
        
        let urlStr = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        guard let url = URL(string: urlStr)
        else {
            print("URL doesn't work")
            return
        }
        let task2 = URLSession.shared.dataTask(with: url, completionHandler: {data2, response, error in
            guard let data = data2, error == nil else{
                print("Something went wrong")
                return
            }
            
            //now I have the data
            var desserts : Root?
            do {
                desserts = try JSONDecoder().decode(Root.self, from: data)
               //print(desserts!)
                //print(desserts!.meals)
                
               // print(self.responses.first?.meals.first?.strMeal as Any)
                //self.meals = desserts!.meals
                //DispatchQueue.main.async {
                //    self.child = desserts!.child
               // }
                self.child = desserts!.child
                print(self.child)
            }
            catch{
                print("ERROR!!!!!!!!!")
                print(String(describing:error))
            }
            
            guard let json = desserts else{
                return
            }
            
            print(json.child.first?.idMeal)
            //print(json.meals.first?.idMeal)
            
        })
        task2.resume()
    }
}

class ViewModel3 : ObservableObject {
    @Published var outers : [Root] = []
    @Published var detailMeals : [Child] = []
    
    func getDetailsData() {
        //Set url to the id values url
        let strURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        print("Made the URL!!!!!!!")
        print(strURL)
        guard let url = URL(string: strURL)
        else {
            print("URL doesn't work")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            guard let data = data, error == nil else{
                print("Something went wrong")
                return
            }
            print("AFTER LET TASK")
            
            //now I have the data
            var rootDessert : Root?
            do {
                rootDessert = try JSONDecoder().decode(Root.self, from: data)
               
                DispatchQueue.main.async {
                    self.detailMeals = rootDessert!.child
                }
                self.detailMeals = rootDessert!.child
                print(self.detailMeals)
            }
            catch{
                print("ERROR HERE!")
                print(String(describing:error))
            }
            
            //guard let json = rootDessert else{
           //     return
          //  }
            print("This is the test JSON!!!!!!!!")
            //print(json.detailMeals.first?.strInstructions)
            //print(json.meals.first?.idMeal)
            
        })
        task.resume()
        
    }
}

struct Response2 : Hashable, Codable{
    let meals : [MyMeal2]
}
struct MyMeal2 :  Hashable, Codable {
    var strMeal : String
    var strMealThumb : String
    var idMeal : String
    var strInstructions : String
    var strIngredient1 : String
    var strIngredient2 : String
    var strIngredient3 : String
    var strIngredient4 : String
    var strIngredient5 : String
    var strIngredient6 : String
    var strIngredient7 : String
    var strIngredient8 : String
    var strIngredient9 : String
    var strIngredient10 : String
    var strIngredient11 : String
    var strIngredient12 : String
    var strIngredient13 : String
    var strIngredient14 : String
    var strIngredient15 : String
    var strIngredient16 : String
    var strIngredient17 : String
    var strIngredient18 : String
    var strIngredient19 : String
    var strIngredient20 : String
    var strMeasure1 : String
    var strMeasure2 : String
    var strMeasure3 : String
    var strMeasure4 : String
    var strMeasure5 : String
    var strMeasure6 : String
    var strMeasure7 : String
    var strMeasure8 : String
    var strMeasure9 : String
    var strMeasure10 : String
    var strMeasure11 : String
    var strMeasure12 : String
    var strMeasure13 : String
    var strMeasure14 : String
    var strMeasure15 : String
    var strMeasure16 : String
    var strMeasure17 : String
    var strMeasure18 : String
    var strMeasure19 : String
    var strMeasure20 : String
}


class DetailViewModel : ObservableObject {
    @Published var responses_2 : [Response2] = []
    @Published var meals_2 : [MyMeal2] = []
    
    
    func getData(id: String) {
        
        let urlStr = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + id
        //let urlStr = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        guard let url = URL(string: urlStr)
        else {
            print("URL doesn't work")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            guard let data = data, error == nil else{
                print("Something went wrong")
                return
            }
            
            //now I have the data
            var desserts : Response2?
            do {
                desserts = try JSONDecoder().decode(Response2.self, from: data)
               //print(desserts!)
                //print(desserts!.meals)
                
               // print(self.responses.first?.meals.first?.strMeal as Any)
                //self.meals = desserts!.meals
                DispatchQueue.main.async {
                    self.meals_2 = desserts!.meals
                }
                self.meals_2 = desserts!.meals
                //print(self.meals_2)
            }
            catch{
                print(String(describing:error))
            }
            
            guard let json = desserts else{
                return
            }
            print("JSON PRINTING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
            print(json.meals.first?.strInstructions)
            //print(json.meals.first?.idMeal)
            
        })
        task.resume()
    }
}

var json : Response?
struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @StateObject var detailsViewModel = DetailViewModel()
    //@StateObject var viewModel2 = ViewModel2()
    
    @State private var myMeals = [MyMeal]()
    
    var body: some View {
        NavigationView {
            List() { ForEach(viewModel.meals, id: \.idMeal){ meal in
                NavigationLink(destination: DessertDetailView(meals: meal), label: {
                    HStack(spacing: 200){
                        AsyncImage(url: URL(string: meal.strMealThumb)) {
                            image in image
                                .image?.resizable()
                                .aspectRatio(contentMode: .fill)
                            
                        }
                        .padding(.vertical, 1)
                        .frame(width: 10, height: 100)
                        .aspectRatio(contentMode: .fill)
                        // .background(Color.gray)
                        
                        
                        
                        Text(meal.strMeal)
                            .multilineTextAlignment(.leading)
                            .bold()
                            .padding(5.0)
                            .background(Color.white)
                            .cornerRadius(13)
                        
                    }
                })
                
            }
            }
            .navigationTitle("Desserts")
            .task {
                
                viewModel.getData()
                
            }
        }
        
        
    }
}
            
    
    
    
 

#Preview {
    ContentView()
}
