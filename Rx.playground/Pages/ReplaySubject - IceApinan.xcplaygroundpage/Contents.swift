import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let accountSubject = ReplaySubject<Double>.create(bufferSize: 3) // Maximum amount that can be replayed

accountSubject.onNext(1222.49)


var accountManager = accountSubject.subscribe(onNext: {
    print("Transaction amount: $\($0)")
})

accountSubject.onNext(12.49)
accountSubject.onNext(299.00)
accountSubject.onNext(15.00)
accountSubject.onNext(43844.03)
accountSubject.onNext(84893.99)

var lastThreeTransaction = accountSubject.subscribe(onNext: {
    print("Last Three: Transaction amount: $\($0)")
})

// Recent history in application
