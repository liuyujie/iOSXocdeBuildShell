//
//  Point.swift
//  demtom
//
//  Created by hwly on 2021/6/1.
//

import Foundation

class Point {
    var x = 0.0, y = 0.0

    subscript(index: Int) -> Double {
        set {
            if index == 0 {
                x = newValue
            } else if index == 1 {
                y = newValue
            }
        }
        get {
            if index == 0 {
                return x
            } else if index == 1 {
                return y
            }
            return 0.0
        }
    }

    subscript(key: String) -> Double {
        set {
            if key == "x" {
                x = newValue
            } else if key == "y" {
                y = newValue
            }
        }

        get {
            if key == "x" {
                return x
            } else if key == "y" {
                return y
            }
            return 0.0
        }
    }
}

extension Point: Equatable {
    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

extension Point: CustomDebugStringConvertible {
    var debugDescription: String {
        return "(\(x), \(y))"
    }
}

class PrintPoint {
    func callPoint() -> Point {
        let point = Point()
		let point2 = Point()

		
		if point == point2 {
			print("gameV")
		}
		
//        point["x"] = 1.2
//        point["y1"] = 2.4

        print(point["x"])

        print(point)

        let s = Season.allCases

        print(s.count)

        for sea in s {
            print(sea)
        }

        return point
    }
}

enum Season: CaseIterable {
    case spring, summer, autumn, winter
}
