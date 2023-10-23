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
    var meals : MyMeal
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: meals.strMealThumb)) {
                image in image
                    .frame(width: 15.0, height: 15)
                    .padding(150)
                    .aspectRatio(contentMode: .fill)
                
            } placeholder: {
                Color.red
                    .frame(width: 300, height: 200)
            }
            Text(meals.strMeal)
                .font(.title2)
            Text(meals.strInstructions).font(.headline)
            
        }.task {
            //viewModel2.getDetailsData()
            viewModel.getData(id: meals.idMeal)
        }
        
    }
}



#Preview {
    //let url = URL(string: "https:\\/\\/www.themealdb.com\\/images\\/media\\/meals\\/adxcbq1619787919.jpg")
    DessertDetailView(meals: MyMeal.init(strMeal: "Apam balik", strMealThumb: "https:\\/\\/www.themealdb.com\\/images\\/media\\/meals\\/adxcbq1619787919.jpg", idMeal: "53049", strInstructions: "TEST instructions"))
}
