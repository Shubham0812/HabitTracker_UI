//
//  OnboardingView.swift
//  HabitTracker_UI
//
//  Created by Mohammad Yasir on 17/10/21.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selection: Int = .zero
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                ForEach(Onboarding.allCases, id: \.id) { onboarding in
                    onboardingView(onboarding: onboarding)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Spacer()
            
            Button(action: {
                // Mark:- It is not working, I think I am not able to identify each tab content uniqly. Missing something real silly
                if selection <= 2 { selection += 1 }
            }, label: {
                OnboardingButton()
            })
        }
    }
    
    private func onboardingView(
        onboarding: Onboarding
    ) -> some View {
        VStack(spacing: 32) {
            switch onboarding {
            case .first:
                Image(onboarding.image)
                    .resizable_Fit()
                
                Text(onboarding.title)
                    .modifier(Title())
                
                Text(onboarding.description)
                    .modifier(Description())
            case .second:
                Text(onboarding.title)
                    .modifier(Title())
                
                Text(onboarding.description)
                    .modifier(Description())
                
                Image(onboarding.image)
                    .resizable_Fit()
            case.third:
                tagsView(onboarding: onboarding)
                
                Text(onboarding.title)
                    .modifier(Title())
                
                Text(onboarding.description)
                    .modifier(Description())
            }
        }
    }
    
    private func tagsView(onboarding: Onboarding) -> some View {
        VStack(spacing: 8) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))], spacing: 8) {
                ForEach(onboarding.tags, id: \.id) { data in
                    HStack {
                        Text(data.text)
                        Text(data.emoji)
                    }
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.black)
                    .cornerRadius(10)
                }
            }
            
            HStack {
                Text("Add your own")
                Image(systemName: "plus")
            }
            .foregroundColor(.white)
            .padding(8)
            .background(Color.orange)
            .cornerRadius(10)
        }
    }
    
}

extension Image {
    func resizable_Fit() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

extension OnboardingView {
    struct Title: ViewModifier {
        func body(content: Content) -> some View {
            content
                .frame(width: 265)
                .font(TypefaceOne.bold.font(size: 30))
                .multilineTextAlignment(.center)
        }
    }
    
    struct Description: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(TypefaceOne.regular.font(size: 16))
                .multilineTextAlignment(.center)
                .frame(width: 333)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}


enum Onboarding: Int, Hashable, Identifiable, CaseIterable {
    
    var id: Int { rawValue }
    
    case first
    case second
    case third
    
    public var title: String {
        switch self {
        case .first:
            return "Track your goals & habits"
        case .second:
            return "Keep track with daily reminders"
        case .third:
            return "Select a goal to get you started"
        }
    }
    
    public var description: String {
        switch self {
        case .first:
            return "“Motivation is what gets you started. Habit is what keeps you going.” - Jim Rohn"
        case .second:
            return "Set daily reminders to keep track of your progress & build effective habits"
        case .third:
            return "To get started please select a habit from the above list or tap the plus button to add your own!"
        }
    }
    
    public var image: String {
        switch self {
        case .first:
            return "first-onboarding"
        case .second:
            return "second-onboarding"
        case .third:
            return ""
        }
    }
    
    struct Tag: Identifiable {
        let id = UUID.init()
        let text: String
        let emoji: String
    }
    
    public var tags: [Tag] {
        switch self {
        case .first:
            return []
        case .second:
            return []
        case .third:
            return [
                Tag(text: "Save", emoji: "💰"),
                Tag(text: "Read more books", emoji: "📚"),
                Tag(text: "Excercise", emoji: "🏋️"),
                Tag(text: "Drink less", emoji: "🍸"),
                Tag(text: "Code more", emoji: "👨🏻‍💻"),
                Tag(text: "Drink more water", emoji: "💧"),
                Tag(text: "Less social media", emoji: "📱"),
                Tag(text: "Volunteer", emoji: ""),
                Tag(text: "Learn a new langagaue", emoji: ""),
                Tag(text: "Go to sleep early", emoji: "💤"),
                Tag(text: "Make your bed", emoji: "🛏")
            ]
        }
    }
    
}
