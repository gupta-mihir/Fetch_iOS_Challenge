//
//  DessertDetailView.swift
//  Fetch_iOS_Coding_Challenge
//
//  Created by Mihir Gupta on 10/22/23.
//

import SwiftUI

//var dessert_id = "52772"
//var meals = MyMeal.init(strMeal: "Apam balik", strMealThumb: "https:\\/\\/www.themealdb.com\\/images\\/media\\/meals\\/adxcbq1619787919.jpg", idMeal: "53049")



struct DessertDetailView: View {
    @StateObject var viewModel = ViewModel()
    @StateObject var detailViewModel = DetailViewModel()
    
    var meals : MyMeal
    
    var body: some View {
        NavigationView {
            List() { ForEach(detailViewModel.meals_2, id: \.idMeal){ meal_2 in
                VStack{
                    HStack(spacing: 200){
                        AsyncImage(url: URL(string: meal_2.strMealThumb)) {
                            image in image
                                .image?.resizable()
                                .aspectRatio(contentMode: .fill)
                            
                        }
                        .padding(.vertical, 1)
                        .frame(width: 10, height: 100)
                        .aspectRatio(contentMode: .fill)
                        // .background(Color.gray)
                        
                        
                        
                        
                        
                        
                    }
                    Text("Instructions")
                        .font(.title2)
                        .padding(10)
                        .bold()
                    Text(meal_2.strInstructions)
                    Text("Ingredients")
                        .font(.title2)
                        .padding(10)
                        .bold()
                    HStack{
                        Text(meal_2.strMeasure1)
                        Text(meal_2.strIngredient1)
                    }
                    HStack{
                        Text(meal_2.strMeasure2)
                        Text(meal_2.strIngredient2)
                    }
                    HStack{
                        Text(meal_2.strMeasure3)
                        Text(meal_2.strIngredient3)
                    }
                    HStack{
                        Text(meal_2.strMeasure4)
                        Text(meal_2.strIngredient4)
                    }
                    HStack{
                        Text(meal_2.strMeasure5)
                        Text(meal_2.strIngredient5)
                    }
                    HStack{
                        Text(meal_2.strMeasure6)
                        Text(meal_2.strIngredient6)
                    }
                    HStack{
                        Text(meal_2.strMeasure7)
                        Text(meal_2.strIngredient7)
                    }
                    HStack{
                        Text(meal_2.strMeasure8)
                        Text(meal_2.strIngredient8)
                    }
                    HStack{
                        Text(meal_2.strMeasure9)
                        Text(meal_2.strIngredient9)
                    }
                    HStack{
                        Text(meal_2.strMeasure10)
                        Text(meal_2.strIngredient10)
                    }
                    HStack{
                        Text(meal_2.strMeasure11)
                        Text(meal_2.strIngredient11)
                    }
                    HStack{
                        Text(meal_2.strMeasure12)
                        Text(meal_2.strIngredient12)
                    }
                    HStack{
                        Text(meal_2.strMeasure13)
                        Text(meal_2.strIngredient13)
                    }
                    HStack{
                        Text(meal_2.strMeasure14)
                        Text(meal_2.strIngredient14)
                    }
                    HStack{
                        Text(meal_2.strMeasure15)
                        Text(meal_2.strIngredient15)
                    }
                    HStack{
                        Text(meal_2.strMeasure16)
                        Text(meal_2.strIngredient16)
                    }
                    HStack{
                        Text(meal_2.strMeasure17)
                        Text(meal_2.strIngredient17)
                    }
                    HStack{
                        Text(meal_2.strMeasure18)
                        Text(meal_2.strIngredient18)
                    }
                    HStack{
                        Text(meal_2.strMeasure19)
                        Text(meal_2.strIngredient19)
                    }
                    HStack{
                        Text(meal_2.strMeasure20)
                        Text(meal_2.strIngredient20)
                    }
                    
                }
            }
            }
            .navigationTitle(meals.strMeal)
            .task {
                
                detailViewModel.getData(id: meals.idMeal)
                
            }
        }
        
    }
}



#Preview {
    //let url = URL(string: "https:\\/\\/www.themealdb.com\\/images\\/media\\/meals\\/adxcbq1619787919.jpg")
    DessertDetailView(meals: MyMeal.init(strMeal: "Apam balik", strMealThumb: "https:\\/\\/www.themealdb.com\\/images\\/media\\/meals\\/adxcbq1619787919.jpg", idMeal: "53049"))
}

//meals_2: MyMeal2.init(strMeal: "Apam balik", strMealThumb: "https:\\/\\/www.themealdb.com\\/images\\/media\\/meals\\/adxcbq1619787919.jpg", idMeal: "53049", strInstructions: "TEST INSTRUCTIONS"
