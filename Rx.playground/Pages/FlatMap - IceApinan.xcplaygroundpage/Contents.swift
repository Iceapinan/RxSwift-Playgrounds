import RxSwift
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()

struct Game {
    var price: Variable<Double>
}

let overwatch = Game(price: Variable(59.99))
let starwhal = Game(price: Variable(19.99))

let gameSubject = PublishSubject<Game>()

gameSubject.flatMap({
    $0.price.asObservable()
}).subscribe(onNext: {
    print($0)
}).addDisposableTo(disposeBag)

gameSubject.onNext(overwatch)
gameSubject.onNext(starwhal)
