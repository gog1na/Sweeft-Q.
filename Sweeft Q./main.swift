//
//  main.swift
//  Sweeft Q.
//
//  Created by Giorgi Goginashvili on 9/25/23.
//

import Foundation

/*
 1. გვაქვს 1,5,10,20 და 50 თეთრიანი მონეტები. დაწერეთ ფუნქცია, რომელსაც გადაეცემა თანხა (თეთრებში) და აბრუნებს მონეტების მინიმალურ რაოდენობას, რომლითაც შეგვიძლია ეს თანხა დავახურდაოთ.
     func minSplit(amount: Int) -> Int {
         // Your code goes here
     }

     Examples:
     minSplit(9) ➞ 5  //(1, 1, 1, 1, 5)
     minSplit(26) ➞ 3  //(1, 5, 20)
     minSplit(172) ➞ 6  //(1, 1, 20, 50, 50, 50)
 */

func minSplit(amount: Int) -> Int {
    
    var coins = [1,5,10,20,50]
    coins.sort(by: >)
    
    var remainingAmount = amount
    var count = 0
    
    //var usedCoin: [Int] = []
    
    for coin in coins {
        while remainingAmount >= coin {
            remainingAmount -= coin
            count += 1
            //usedCoin.append(coin)
            print("\(coin)", terminator: " ")
        }
    }
    return count
}

print(" - \(minSplit(amount: 9))")
print(" - \(minSplit(amount: 26))")
print(" - \(minSplit(amount: 172))")


print("-----")


/*
 დაწერეთ ფუნქცია რომელიც დააჯამებს ციფრებს ორ რიცსხვს შორის.
    მაგალითად გადმოგვეცემა 19 და 22. მათ შორის ციფრების ჯამი იქნება :
    // 19, 20, 21, 22
    // (1 + 9) + (2 + 0) + (2 + 1) + (2 + 2) = 19

    func sumOfDigits(start: Int, end: Int) -> Int {
        // Your code goes here
    }

    sumOfDigits(7, 8) ➞ 15
    sumOfDigits(17, 20) ➞ 29
    sumOfDigits(10, 12) ➞ 6

 */

func sumOfDigits(start: Int, end: Int) -> Int {
    var sum = 0
    
    for num in start...end {
        var currentNum = num
        while currentNum > 0 {
            sum += currentNum % 10
            currentNum /= 10
        }
    }
    
    return sum
}

print(sumOfDigits(start: 7, end: 8))
print(sumOfDigits(start: 17, end: 20))
print(sumOfDigits(start: 10, end: 12))


print("-----")


/*
 მოცემულია String რომელიც შედგება „(" და „)" ელემენტებისგან. დაწერეთ ფუნქცია რომელიც აბრუნებს ფრჩხილები არის თუ არა მათემატიკურად სწორად დასმული.

     func isProperly(sequence: String) -> Bool {
         // Your code goes here
     }

     Examples:
     isProperly(sequence: "(()())") ➞ true
     isProperly(sequence: ")(()") ➞ false
     isProperly(sequence: "(()())(") ➞ false

 */

func isProperly(sequence: String) -> Bool {
    var count = 0
    
    for char in sequence {
        if char == "(" {
            count += 1
        } else if char == ")" {
            count -= 1
        }
        
        if count < 0 {
            return false
        }
    }
    
    return count == 0
}

print(isProperly(sequence: "(()())"))
print(isProperly(sequence: ")(()"))
print(isProperly(sequence: "(()())("))


print("-----")


/*
 4. გვაქვს N ფიცრისგან შემდგარი ხიდი. სიძველის გამო ზოგიერთი ფიცარი ჩატეხილია. ზურიკოს შეუძლია გადავიდეს შემდეგ ფიცარზე ან გადაახტეს ერთ ფიცარს. (რათქმაუნდა ჩატეხილ   ფიცარზე ვერ გადავა)
    ჩვენი ამოცანაა დავითვალოთ რამდენი განსხვავებული კომბინაციით შეუძლია ზურიკოს ხიდის გადალახვა. გადმოგვეცემა ხიდის სიგრძე და ინფორმაცია ჩატეხილ ფიცრებზე. 0 აღნიშნავს ჩატეხილ ფიცარს 1_ანი კი მთელს. დასაწყისისთვის ზურიკო დგას ხიდის ერთ მხარეს (არა პირველ ფიცარზე) და გადალახვად ჩათვლება ხიდის მეორე მხარე (ბოლო ფიცრის შემდეგი ნაბიჯი)


    func countWays(n: Int, steps: [Int]) -> Int {
            // Your code goes here
    }

    Examples:
    countWays(n: 3, steps: [0, 1, 0]) ➞ 1
    countWays(n: 4, steps: [0, 1, 1, 0]) ➞ 1
    countWays(n: 5, steps: [1, 1, 0, 1, 1]) ➞ 4 // (s, 1, 2, 4, 5, f), (s, 1, 2, 4, f), (s, 2, 4, 5, f), (s, 2, 4, f)  s - ხიდის ერთი მხარე, f - ხიდის მეორე მხარე
 */

func countWays(n: Int, steps: [Int]) -> Int {
    var extendedSteps = Array(repeating: 1, count: n + 3)
    var result = 1
    
    for i in 0..<n {
        extendedSteps[i + 1] = steps[i]
    }
    
    var stepCounts = Array(repeating: 1, count: n)
    
    for i in 0..<n {
        if extendedSteps[i] != 0 {
            if extendedSteps[i + 1] == 0 && extendedSteps[i + 2] == 0 {
                return 0
            } else if extendedSteps[i + 1] == 1 && extendedSteps[i + 2] == 1 {
                stepCounts[i] = 2
            } else {
                stepCounts[i] = 1
            }
        }
    }
    
    for i in 0..<n {
        result *= stepCounts[i]
    }
    
    return result
}

print(countWays(n: 3, steps: [0, 1, 0]))
print(countWays(n: 4, steps: [0, 1, 1, 0]))
print(countWays(n: 5, steps: [1, 1, 0, 1, 1]))


print("-----")


/*
 5. გადმოგეცემათ მთელი რიცხვი N. დაწერეთ ფუნქცია რომელიც დაითვლის რამდენი 0ით ბოლოვდება N! (ფაქტორიალი)
     შენიშვნა 1000! შედგება 2568 სიმბოლოსაგან.

     func zeros(N: Int) -> Int {
         // Your code goes here
     }

     example:
     zeros(N: 7) ➞ 1
     zeros(N: 12) ➞ 2
     zeros(N: 490) ➞ 120

 */

func zeros(N: Int) -> Int {
    var count = 0
    var n = N
    
    while n > 0 {
        n /= 5
        count += n
    }
    
    return count
}

print(zeros(N: 7))
print(zeros(N: 12))
print(zeros(N: 490))
print(zeros(N: 50))

