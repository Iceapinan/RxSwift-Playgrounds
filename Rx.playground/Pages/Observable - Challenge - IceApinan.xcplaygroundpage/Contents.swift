import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()

let anArray = Observable.from([1,2,3])
let aConstant = anArray.subscribe(onNext: { print($0 * 5) })
print(aConstant)
let bag = aConstant.addDisposableTo(disposeBag)


