//
//  WelcomeView.swift
//  MyWorkout
//
//  Created by Nattapong Chaowhacharoenpong on 18/9/2564 BE.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var selectedTab: Int
    @State private var showHistory = false
        
    var body: some View {
        VStack {
            HeaderView(selectedTab: $selectedTab, titleText: NSLocalizedString("Welcome", comment: "greeting"))
            
            Spacer()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(NSLocalizedString("Get Fit", comment: "inviation to exercise"))
                        .font(.largeTitle)
                    Text("with high intensity interval training")
                }
                Image("step-up")
                    
                    .resizedToFill(width: 240, height: 240)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            
            Button(action: { selectedTab = 0 }) {
                Text(NSLocalizedString("Get Started", comment: "inviation"))
                Image(systemName: "arrow.right.circle")
            }
            .font(.title2)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 2))
            
            Spacer()
            
            Button(NSLocalizedString("History", comment: "view user activity")) { showHistory.toggle() }
                .padding(.bottom)
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedTab: .constant(9))
            .environmentObject(HistoryStore())
    }
}
