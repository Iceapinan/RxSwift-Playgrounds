import RxSwift
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()

Observable.of("Elon", "Steve", "Jeff", "Mark", "Jack")
    .filter {
        $0.contains(Character("a"))
    }.subscribe(onNext: {
        print($0)
    }).addDisposableTo(disposeBag)
