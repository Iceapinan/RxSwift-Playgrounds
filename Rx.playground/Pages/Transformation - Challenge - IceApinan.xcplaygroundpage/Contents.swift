import RxSwift
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()

// Map – Challenge: Name Capitalizer
// Create an observable containing three names of type String, then use .map to capitalize every element. Subscribe, printing each element and add to dispose bag.

Observable.of("Apinan", "Visanukorn", "Nee").map {
        $0.capitalized
    }.subscribe(onNext: {
        print($0)
    }).addDisposableTo(disposeBag)


// FlatMap – Challenge
// Create a variable called carPrice of type Variable holding the cost of a car. Create a PublishSubject called carSubject of type Variable<Int>. Call .flatMap on carSubject and cast each element as an Observable. Subscribe and print out each new Observable. Add to DisposeBag. Be sure to call .onNext to pass in the carPrice Observable below the subscription.

let carPrice = Variable(49999.99)
let carSubject = PublishSubject<Variable<Double>>()

carSubject.flatMap {
    $0.asObservable()
    }.subscribe(onNext: {
        print($0)
    }).addDisposableTo(disposeBag)

carSubject.onNext(carPrice)


// Filter – Challenge
// Create a struct called Element and give it 3 properties - name (String), abbreviation (String), and periodicNumber (Int). Create 5 instances of Element for different elements on the Periodic Table. Google the Periodic Table if you must. 😁 Then, create an Observable that includes all 5 Element instance you created. Use .filter to filter out any elements whose periodic number is less than 10. Subscribe and print out all three properties for each element. Then add to DisposeBag.
struct Element {
    let name : String
    let abbreviation : String
    let periodicNumber : Int
}

let hydrogen = Element(name: "Hydrogen", abbreviation: "H", periodicNumber: 1)
let helium = Element(name: "Helium", abbreviation: "He", periodicNumber: 2)
let oxygen = Element(name: "Oxygen", abbreviation: "O", periodicNumber: 8)
let nitrogen = Element(name: "Nitrogen", abbreviation: "N", periodicNumber: 7)
let sodium = Element(name: "Sodium", abbreviation: "Na", periodicNumber: 11)

Observable.of(hydrogen,helium,oxygen,nitrogen,sodium).filter({
    $0.periodicNumber < 10
}).subscribe(onNext: {
    print($0)
}).addDisposableTo(disposeBag)




// Zip – Challenge
// Create two Observable instances – one called nameObservable and the other called usernameObservable. Using .of, pass three first names (String) into nameObservable. Then pass three usernames into usernameObservable. Create a new Observable and using .zip, create a String literal using the values $0 and $1 (ex. "\($0): \($1)"). Subscribe and in the onNext closure, print out the Observable that is created by the .zip function. Add to DisposeBag.

let nameObservable = Observable.of("Steve", "Apinan", "Xi")
let usernameObservable = Observable.of("job123","icing","jinping")

Observable.zip(nameObservable,usernameObservable) {
    "\($0): \($1)"
    }.subscribe(onNext: {
        print($0)
    }).addDisposableTo(disposeBag)

