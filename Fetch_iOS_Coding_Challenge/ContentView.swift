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
    var strInstructions : String
    
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
    
    func getData(id : String) {
        
        let urlStr = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + id
        
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

struct Outer : Hashable, Codable {
    let detailMeals : [DetailMeal]
}

struct DetailMeal : Hashable, Codable{
    var idMeal : String
    var strMeal : String
    var strDrinkAlternate : String?
    var strCategory : String?
    var strArea : String?
    var strInstructions : String
    var strMealThumb : String
    var strTags : String?
    var strYoutube : String?
    var strIngredient1 : String?
    var strIngredient2 : String?
    var strIngredient3 : String?
    var strIngredient4 : String?
    var strIngredient5 : String?
    var strIngredient6 : String?
    var strIngredient7 : String?
    var strIngredient8 : String?
    var strIngredient9 : String?
    var strIngredient10 : String?
    var strIngredient11 : String?
    var strIngredient12 : String?
    var strIngredient13 : String?
    var strIngredient14 : String?
    var strIngredient15 : String?
    var strIngredient16 : String?
    var strIngredient17 : String?
    var strIngredient18 : String?
    var strIngredient19 : String?
    var strIngredient20 : String?
    var strMeasure1 : String?
    var strMeasure2 : String?
    var strMeasure3 : String?
    var strMeasure4 : String?
    var strMeasure5 : String?
    var strMeasure6 : String?
    var strMeasure7 : String?
    var strMeasure8 : String?
    var strMeasure9 : String?
    var strMeasure10 : String?
    var strMeasure11 : String?
    var strMeasure12 : String?
    var strMeasure13 : String?
    var strMeasure14 : String?
    var strMeasure15 : String?
    var strMeasure16 : String?
    var strMeasure17 : String?
    var strMeasure18 : String?
    var strMeasure19 : String?
    var strMeasure20 : String?
    var strSource : String?
    var strImageSource : String?
    var strCreativeCommonsConfirmed : String?
    var dateModified : Date?
    
        
    enum CodingKeys : String, CodingKey {
        case idMeal = "idMeal"
        case strMeal = "strMeal"
        case strDrinkAlternate = "strDrinkAlternate"
        case strCategory = "strCategory"
        case strArea = "strArea"
        case strInstructions = "strInstructions"
        case strMealThumb = "strMealThumb"
        case strTags = "strTags"
        case strYoutube = "strYoutube"
        
        case strIngredient1 = "strIngredient1"
        case strIngredient2 = "strIngredient2"
        case strIngredient3 = "strIngredient3"
        case strIngredient4 = "strIngredient4"
        case strIngredient5 = "strIngredient5"
        case strIngredient6 = "strIngredient6"
        case strIngredient7 = "strIngredient7"
        case strIngredient8 = "strIngredient8"
        case strIngredient9 = "strIngredient9"
        case strIngredient10 = "strIngredient10"
        case strIngredient11 = "strIngredient11"
        case strIngredient12 = "strIngredient12"
        case strIngredient13 = "strIngredient13"
        case strIngredient14 = "strIngredient14"
        case strIngredient15 = "strIngredient15"
        case strIngredient16 = "strIngredient16"
        case strIngredient17 = "strIngredient17"
        case strIngredient18 = "strIngredient18"
        case strIngredient19 = "strIngredient19"
        case strIngredient20 = "strIngredient20"
        
        case strMeasure1 = "strMeasure1"
        case strMeasure2 = "strMeasure2"
        case strMeasure3 = "strMeasure3"
        case strMeasure4 = "strMeasure4"
        case strMeasure5 = "strMeasure5"
        case strMeasure6 = "strMeasure6"
        case strMeasure7 = "strMeasure7"
        case strMeasure8 = "strMeasure8"
        case strMeasure9 = "strMeasure9"
        case strMeasure10 = "strMeasure10"
        case strMeasure11 = "strMeasure11"
        case strMeasure12 = "strMeasure12"
        case strMeasure13 = "strMeasure13"
        case strMeasure14 = "strMeasure14"
        case strMeasure15 = "strMeasure15"
        case strMeasure16 = "strMeasure16"
        case strMeasure17 = "strMeasure17"
        case strMeasure18 = "strMeasure18"
        case strMeasure19 = "strMeasure19"
        case strMeasure20 = "strMeasure20"
        
        case strSource = "strSource"
        case strImageSource = "strImageSource"
        case strCreativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"
        
        
   }
}

class ViewModel2 : ObservableObject {
    @Published var outers : [Outer] = []
    @Published var detailMeals : [DetailMeal] = []
    
    func getDetailsData(id : String) {
        //Set url to the id values url
        let strURL = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + id
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
            var outerDessert : Outer?
            do {
                outerDessert = try JSONDecoder().decode(Outer.self, from: data)
               
               // DispatchQueue.main.async {
                //    self.detailMeals = outerDessert!.detailMeals
                //}
                self.detailMeals = outerDessert!.detailMeals
                print(self.detailMeals)
            }
            catch{
                print("ERROR HERE!")
                print(String(describing:error))
            }
            
            guard let json = outerDessert else{
                return
            }
            print("This is the test JSON!!!!!!!!")
            print(json.detailMeals.first?.strInstructions)
            //print(json.meals.first?.idMeal)
            
        })
        task.resume()
        
    }
}


var json : Response?
struct ContentView: View {
    @StateObject var viewModel = ViewModel()
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
                // await fetchData()
                viewModel.getData(id: "52773")
                
            }
        }
        
        
    }
}
            
    
    
    
 

#Preview {
    ContentView()
}
