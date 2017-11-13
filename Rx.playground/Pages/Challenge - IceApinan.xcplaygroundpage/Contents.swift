import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let publishSubject = PublishSubject<String>()

publishSubject.subscribe(onNext: {
    print($0)
})

publishSubject.onNext("Titanic")
publishSubject.onNext("Star Wars")
publishSubject.onNext("The Intern")

var behavior = BehaviorSubject<Double>(value: 0.00)
var blankBalance = BehaviorSubject<Double>(value: 50.35)

let subscription = blankBalance.subscribe(onNext: {
    print($0)
})

blankBalance.onNext(444.03)
blankBalance.onNext(4434.03)
blankBalance.onNext(444442342.03)

let twitterSubject = ReplaySubject<String>.create(bufferSize: 3)
twitterSubject.onNext("icerr")

let subscriptionTwo = twitterSubject.subscribe(onNext: {
    print("Followed: @\($0)")
})

twitterSubject.onNext("ice")
twitterSubject.onNext("iceapinan")
twitterSubject.onNext("duck")
twitterSubject.onNext("hen")
twitterSubject.onNext("meow")

let newTwitterUser = twitterSubject.subscribe(onNext: { print($0)})

let fullName = Variable("Apinan I")
fullName.asObservable().subscribe(onNext: {
    print($0)
})
fullName.value


