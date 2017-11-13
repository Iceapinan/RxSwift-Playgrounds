import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var variable = Variable<String>("Hello!")

variable.asObservable().subscribe(onNext: {
    print($0)
}) // Convert the variable into a variable that is observable

variable.value
