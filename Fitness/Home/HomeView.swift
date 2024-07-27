//
//  HomeView.swift
//  Fitness
//
//  Created by Fiston Niyonkuru on 27/07/2024.
//

import SwiftUI


struct HomeView: View {
    @State var calories:Int = 123
    @State var active:Int = 34
    @State var stand:Int = 8
    
    var mockActivities = [
        Activity(id: 0, title:"Today steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .green, amount: "9823"),
        Activity(id: 1, title:"Today steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .red, amount: "9823"),
        Activity(id: 2, title:"Today steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .blue, amount: "9,876"),
        Activity(id: 3, title:"Today steps", subtitle: "Goal 12,000", image: "figure.run", tintColor: .purple, amount: "55,812")
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading){
                Text("Welcome")
                    .font(.largeTitle)
                    .padding()
                
                HStack {
                    
                    Spacer()
                    
                    VStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Calories")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.red)
                            
                            Text("123 Kcal")
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Active")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.green)
                            
                            Text("52 mins")
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Stand")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.blue)
                            
                            Text("8 hours")
                        }
                    }
                    
                    Spacer()
                
                    ZStack {
                        ProgressCircleView(progress: $calories, goal: 600, color: .red)
                        
                        ProgressCircleView(progress: $active, goal: 60, color: .green)
                            .padding(.all,20)
                        
                        ProgressCircleView(progress: $stand, goal: 12, color: .blue)
                            .padding(.all,40)
                        
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding()
                
                HStack {
                    Text("Fitness Activity")
                        .font(.title2)
                            
                    Spacer()
                    
                    Button {
                        print("show more")
                    } label: {
                        Text("Show more")
                            .padding(.all, 10)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: Array(repeating: GridItem(spacing:20), count: 2))  {
                    ForEach(mockActivities,id: \.id) { activity in
                        ActivityCard(activity: activity)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HomeView()
}
