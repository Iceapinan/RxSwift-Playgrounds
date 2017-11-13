import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// BehaviorSubject takes the most recent value and anything that comes after the subscription

var behaviorSubject = BehaviorSubject(value: "Value A")

let subscriptionOne = behaviorSubject.subscribe(onNext: {
    print("Subscription 1: \($0)")
})

behaviorSubject.onNext("Value B")
behaviorSubject.onNext("Value C") // The most recent value for the subscriptionTwo

let subscriptionTwo = behaviorSubject.subscribe(onNext: {
    print("Subscription 2: \($0)")
})

behaviorSubject.onNext("WOWWWW")
