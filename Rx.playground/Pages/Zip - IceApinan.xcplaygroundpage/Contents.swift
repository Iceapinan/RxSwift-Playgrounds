import RxSwift
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()

let carMakes = Observable.of("Delorean", "Bugatti", "Lotus", "Chevrolet")
let carModels = Observable.of("DMC-12", "Veyron", "Elise")

Observable.zip(carMakes, carModels) { $0 + " " + $1 }
    .subscribe(onNext: {
        print($0)
    }).addDisposableTo(disposeBag)
