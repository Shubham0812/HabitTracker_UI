//
//  OnboardingView.swift
//  HabitTracker_UI
//
//  Created by Shubham on 08/10/21.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - variables
    
    // MARK: - views
    var body: some View {
        ZStack {
            
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct OnboardingViews: View {
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
                withAnimation { if selection <= 2 { selection += 1 } else { selection = 0 } }
            }, label: {
                Text("Next")
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
        VStack(spacing: 14) {
            FlexibleView(data: onboarding.tags, spacing: 8, alignment: .center) { data in
                HStack {
                    Text(data.text)
                    Text(data.emoji)
                }
                .foregroundColor(.white)
                .padding(8)
                .background(Color.black)
                .cornerRadius(10)
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

extension OnboardingViews {
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
            return "notification"
        case .second:
            return "welcome"
        case .third:
            return ""
        }
    }
    
    struct Tag: Identifiable, Hashable {
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

struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content
    @State private var availableWidth: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: alignment, vertical: .center)) {
            Color.clear
                .frame(height: 1)
                .readSize { size in
                    availableWidth = size.width
                }
            
            Flexible(
                availableWidth: availableWidth,
                data: data,
                spacing: spacing,
                alignment: alignment,
                content: content
            )
        }
    }
}

struct Flexible<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let availableWidth: CGFloat
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content
    @State var elementsSize: [Data.Element: CGSize] = [:]
    
    var body : some View {
        VStack(alignment: alignment, spacing: spacing) {
            ForEach(computeRows(), id: \.self) { rowElements in
                HStack(spacing: spacing) {
                    ForEach(rowElements, id: \.self) { element in
                        content(element)
                            .fixedSize()
                            .readSize { size in
                                elementsSize[element] = size
                            }
                    }
                }
            }
        }
    }
    
    func computeRows() -> [[Data.Element]] {
        var rows: [[Data.Element]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth
        
        for element in data {
            let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]
            
            if remainingWidth - (elementSize.width + spacing) >= 0 {
                rows[currentRow].append(element)
            } else {
                currentRow += 1
                rows.append([element])
                remainingWidth = availableWidth
            }
            
            remainingWidth -= (elementSize.width + spacing)
        }
        
        return rows
    }
}

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
            .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

