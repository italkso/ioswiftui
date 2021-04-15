//
//  CountdownView.swift
//  Starios
//
//  Created by aaron on 2021/4/15.
//

import SwiftUI

struct CountdownView: View {
    @State private var minutesRemain = 0
    @State private var secondsRemain = 0
    @State private var isActive = true

    let minutesTimer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    let secondsTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                Rectangle()
                    .fill(Color.black.opacity(0.2))
                    .frame(minWidth: 0, idealWidth: UIScreen.main.bounds.width, maxWidth: .infinity, minHeight: 0, idealHeight: UIScreen.main.bounds.height / 10, maxHeight: .infinity, alignment: .center)
                    .cornerRadius(20)
                    .blur(radius: 3.0)
                    .padding()

                VStack(alignment:.center,spacing:20) {
                    Text("Countdown")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .padding()

                    Text("\(minutesRemain) : \(secondsRemain) ")
                        .padding()
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        .foregroundColor(.red)
                    
                    HStack(spacing: UIScreen.main.bounds.width / 6 - 50) {
                        // MARK: - Start

                        Button(action: {
                            self.minutesRemain = 14
                            self.secondsRemain = 59
                        }) {
                            VStack {
                                Image(systemName: "play.circle.fill").resizable()
                                    .frame(width: 30, height: 30)
                                    .aspectRatio(contentMode: .fit)
                                Text("Start").font(.headline)
                            }
                        }

                        // MARK: - Reset

                        Button(action: {
                            self.minutesRemain = 0
                            self.secondsRemain = 0
                        }) {
                            VStack {
                                Image(systemName: "multiply.circle.fill").resizable()
                                    .frame(width: 30, height: 30)
                                    .aspectRatio(contentMode: .fit)

                                Text("Reset").font(.headline)
                            }
                        }.padding()
                    }.foregroundColor(.black)
                }.padding()
            }
        }
        .onReceive(minutesTimer) { _ in
            guard self.isActive else { return }
            if self.minutesRemain > 0 && self.secondsRemain == 0 {
                self.minutesRemain -= 1
            }
        }
        .onReceive(secondsTimer) { _ in
            guard self.isActive else { return }
            if self.minutesRemain > 0 && self.secondsRemain == 0 {
                self.secondsRemain = 59
            }

            if self.secondsRemain > 0 {
                self.secondsRemain -= 1
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.isActive = false
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
