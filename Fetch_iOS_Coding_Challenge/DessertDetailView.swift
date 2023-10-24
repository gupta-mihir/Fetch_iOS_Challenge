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
                        
                        
                        
                        Text(meal_2.strMeal)
                            .multilineTextAlignment(.leading)
                            .bold()
                            .padding(5.0)
                            .background(Color.white)
                            .cornerRadius(13)
                        
                    }
                    Text(meal_2.strInstructions)
                    
                }
            }
            }
            .navigationTitle("Desserts")
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
