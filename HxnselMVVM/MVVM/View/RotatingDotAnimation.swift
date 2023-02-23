//
//  RotatingDotAnimation.swift
//  HxnselMVVM
//
//  Created by Carlos V on 19/02/23.
//

import SwiftUI

public struct RotatingDotAnimation: View {

    @State private var showLoader: Bool = false
    @State private var isIncrease: Bool = true
    @State private var trimFrom: Double = 0.1
    @State private var trimTo: Double = 1.0
    @State private var rotationEffect: Double = 0.0
    @State private var rotationTime: Int = 0

//    public var body: some View {
////        GeometryReader { reader in
//            ZStack {
////                Circle()
////                    .stroke(lineWidth: 20.0)
////                    .opacity(0.3)
////                    .foregroundColor(Color.yellow)
//
//                Circle()
//                    .trim(from: trimFrom, to: trimTo)
//                    .stroke(.green, style: StrokeStyle(lineWidth: 10.0, lineCap: .round))
//                    .rotationEffect(.degrees(showLoader ? 360 : 0))
//                    .animation(Animation.easeInOut(duration: showLoader ? 18.0 : 0.0).repeatForever(autoreverses: true), value: showLoader)
//                    .frame(width: 110, height: 110, alignment: .center)
//            }
////        }
//        .onAppear {
//            self.showLoader.toggle()
//            self.changeSizeOFLoading()
////            self.changeSizeOFLoadingV2()
//
//        }
//    }
    public var body: some View {
        ZStack {
            Circle()
                .trim(from: trimFrom, to: trimTo)
                .stroke(.green, style: StrokeStyle(lineWidth: 10.0, lineCap: .round))
                .frame(width: 110, height: 110, alignment: .center)
                .rotationEffect(.degrees(rotationEffect))
        }
        .onAppear {
            self.showLoader.toggle()
            //            self.changeSizeOFLoading()
            self.changeSizeOFLoadingV2()
        }
    }
    func changeSizeOFLoading() {
        let numToIncrement: Double = 0.025
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0628) {
            switch self.isIncrease {
            case true:
                if self.trimFrom == 0.0 {
                    if self.trimTo > 0.1 {
                        self.trimTo -= numToIncrement
                    } else {
                        self.trimFrom = 0.0
                        self.trimTo = numToIncrement
                        self.isIncrease.toggle()
                    }
                } else if self.trimTo == 1.0 {
                    if self.trimFrom < 0.9 {
                        self.trimFrom += numToIncrement
                    } else {
                        self.trimFrom = 1.0 - numToIncrement
                        self.trimTo = 1.0
                        self.isIncrease.toggle()
                    }
                }
                break
            case false:
                if self.trimFrom == 0.0 {
                    if self.trimTo < 0.9 {
                        self.trimTo += numToIncrement
                    } else {
                        self.trimFrom = numToIncrement
                        self.trimTo = 1.0
                        self.isIncrease.toggle()
                    }
                } else if self.trimTo == 1.0 {
                    if self.trimFrom > 0.1 {
                        self.trimFrom -= numToIncrement
                    } else {
                        self.trimFrom = 0.0
                        self.trimTo = 1.0 - numToIncrement
                        self.isIncrease.toggle()
                    }
                }
                break
            }
            if self.showLoader {
                self.changeSizeOFLoading()
            }
        }
    }
    func changeSizeOFLoadingV2() {
        let numToIncrement: Double = 0.025
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0628) {
            switch self.isIncrease {
            case true:
                if self.trimFrom == 0.0 {
                    if self.trimTo > 0.1 {
                        self.trimTo -= numToIncrement
                        self.rotationEffect += 15
                    } else {
                        self.trimFrom = 0.0
                        self.trimTo = numToIncrement
                        self.isIncrease.toggle()
                        self.rotationEffect += 25
                        print("cambio 1")
                    }
                } else if self.trimTo == 1.0 {
                    if self.trimFrom < 0.9 {
                        self.trimFrom += numToIncrement
                        self.rotationEffect += 7
                    } else {
                        self.trimFrom = 1.0 - numToIncrement
                        self.trimTo = 1.0
                        self.isIncrease.toggle()
                        self.rotationEffect += 3
                        print("cambio 2")
                    }
                }
                break
            case false:
                if self.trimFrom == 0.0 {
                    if self.trimTo < 0.9 {
                        self.trimTo += numToIncrement
                        self.rotationEffect += 5
                    } else {
                        self.trimFrom = numToIncrement
                        self.trimTo = 1.0
                        self.isIncrease.toggle()
                        self.rotationEffect += 3
                        print("cambio 3")
                    }
                } else if self.trimTo == 1.0 {
                    if self.trimFrom > 0.1 {
                        self.trimFrom -= numToIncrement
                        self.rotationEffect += 15
                    } else {
                        self.trimFrom = 0.0
                        self.trimTo = 1.0 - numToIncrement
                        self.isIncrease.toggle()
                        self.rotationEffect += 35
                        print("cambio 4")
                    }
                }
                break
            }
            if self.showLoader {
                self.changeSizeOFLoadingV2()
            }
        }
    }
}

struct RotatingDotAnimation_Previews: PreviewProvider {
    static var previews: some View {
        RotatingDotAnimation()
    }
}
