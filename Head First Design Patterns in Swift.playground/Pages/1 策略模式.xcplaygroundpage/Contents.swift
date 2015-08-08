//: ### 策略模式
//: 定义算法族，分别封装起来，让它们之间可以互相替换，此模式让算法的变化独立于使用算法的客户。

import Foundation

protocol Flyable {
	func fly()
}

protocol Quackable {
	func quack()
}

//: 算法族

class FlyWithWings: Flyable {
	func fly() {
		print("I'm flying!")
	}
}

class FlyNoWay: Flyable {
	func fly() {
		print("I can't fly.")
	}
}

class Quack: Quackable {
	func quack() {
		print("Quack")
	}
}

class MuteQuack: Quackable {
	func quack() {
		print("<< Silence >>")
	}
}

class Squeak: Quackable {
	func quack() {
		print("Squeak")
	}
}

//: 使用算法的客户

class Duck {
	
	var flyBehavior: Flyable?
	var quackBehavior: Quackable?
	
	func performFly() {
		flyBehavior?.fly()
	}
	
	func performQuack() {
		quackBehavior?.quack()
	}
	
	func swim() {
		print("All ducks float, enen decoys!")
	}
}

class MallardDuck: Duck {
	
	override init() {
		super.init()
		self.flyBehavior = FlyWithWings()
		self.quackBehavior = Quack()
	}
	
	func display() {
		print("I'm a real Mallard duck")
	}
}

let mallard = MallardDuck()
mallard.performFly()
mallard.performQuack()
mallard.display()

//: [Next](@next)
