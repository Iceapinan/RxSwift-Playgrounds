import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var publishSubject = PublishSubject<String>()


publishSubject.onNext("Hello")

// Notice (PublishSubject) : Anything that happens before the subscription will not be called !!
let subscription = publishSubject.subscribe(onNext: { print($0) })

publishSubject.onNext("Yayyy")
publishSubject.onNext("123")

let subscriptionTwo = publishSubject.subscribe(onNext: { print($0)})
publishSubject.onNext("555")
