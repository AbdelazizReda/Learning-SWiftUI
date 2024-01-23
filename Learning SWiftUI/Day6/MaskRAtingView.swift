//
//  MaskRAtingView.swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 23/01/2024.
//

import SwiftUI

struct MaskRAtingView: View {
    //RATING COUNT
//    @State var ratingCount:Int = 4
    @State private var userRating: Double = 5.0

    var body: some View {
        ZStack{

            VStack {
                    RatingView(rating: $userRating)
                        .padding()
                
                    // Display the user-set rating
                    Text("User Rating: \(userRating)")
                        .padding()
                }
        }
    }

}

#Preview {
    MaskRAtingView()
}

struct RatingView: View {
    @Binding var rating: Double // Binding for user-settable rating

      var body: some View {
          HStack {
              ForEach(0..<5) { index in
                  Image(systemName: self.starImageName(for: index))
                      .foregroundColor(self.color(for: index))
                      .onTapGesture {
                          self.rating = self.calculateRating(for: index)
                      }
              }
          }
          .mask(
              Rectangle()
                  .frame(width: CGFloat(rating ) * UIScreen.main.bounds.width, height: .infinity)
                  .foregroundColor(.white)
          )
      }
    
    
    private func starImageName(for index: Int) -> String {
        let filled = Int(rating) > index || (index + 1 == Int(rating) && rating.truncatingRemainder(dividingBy: 1) >= 0.5)
        return filled ? "star.fill" : "star"
    }

    private func color(for index: Int) -> Color {
        return index < Int(rating) ? .yellow : .gray
    }

    private func calculateRating(for index: Int) -> Double {
        let newRating: Double
        if index + 1 == Int(rating) && rating.truncatingRemainder(dividingBy: 1) >= 0.5 {
            // Toggle back to the previous whole star
            newRating = Double(index)
        } else {
            // Set the rating including half stars
            newRating = Double(index + 1)
        }
        return newRating
    }
}
