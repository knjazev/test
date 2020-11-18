

//: # 1. (1 балл за каждый пункт)

//: ### 1.1 Что такое значимый (value) и  ссылочный(reference) тип? Приведите примеры.


//К типам значений относятся строки, числа, словари и массивы, перечисления, структуры. Переменные с таким типом содержат непосредственно само значение, а переприсвоение между ними происходит через полное копирование этого значения.

import Foundation

var firstValue: Int = 11
var secondValue: Int = firstValue

secondValue += 1

print(firstValue)
// 11

print(secondValue)
// 12


//Ссылочными типами являются классы и замыкания. Они переменные хранят ссылку на объект, но не его сам. Копирование производится путем создания еще одной ссылки.

import UIKit

var firstColor: UIColor = .black
var secondColor: UIColor = .blue
var thirdColor: UIColor = .black
var fourthColor: UIColor = firstColor

print(firstColor.hashValue)
//65536
print(secondColor.hashValue)
//917504
print(thirdColor.hashValue)
//65536
print(fourthColor.hashValue)
//65536

print(firstColor.isEqual(secondColor))
//false
print(firstColor.isEqual(thirdColor))
// true
print(firstColor.isEqual(fourthColor))
// true


//: ### 1.2 Чем отличается “struct“ от “class”?

//1) Классы - ссылочные типы, а структуры - значимые типы;
//2) Классы поддерживают наследование;
//3) Деинициализаторы

//: ### 1.3 Что такое Опционал(optional value)? Какие способы “unwrapping” для опционала вы знаете?


//1) это тип, который говорит о том, что параметр либо имеет значение определенного типа, либо вообще не имеет никакого значения (nil)
//2) - Принудительное извлечение значения
var optionalNumber: Int? = 10
var number = 20
var resultNumber = optionalNumber! + number
// 30

//   - Опциональное связывание

var myNumber: Int? = 10
if let number = myNumber {
print("ok")
}

//   - Оператор объединения с nil
var optionalInt: Int? = nil
var result = optionalInt ?? 100 // 100



//: ### 1.4 Какие Коллекции(Collection types) вы знаете? Приведите примеры использования каждого из них(т.е. какую коллекцию для каких задач рациональнее использовать).

//1) Масиивы, множества и словари
//2) Массив:
//Он хранит свои элементы последовательно, они легко перебираются предсказуемым способом, и в нем могут храниться любые значения: от структур до экземпляров классов и других коллекций.
//3) Множества
//значительным преимуществом множеств над массивами является то, что как вставка и удаление всегда могут выполняться за постоянное (O(1)) время, так как элементы хранятся по хешу, а не по индексу.
//4) Словари
//быстрый поиск значения по его уникальному ключу

//Использование той или иной коллекции зависит от поставленной задачи, где ключевым моментом всегда стоит время, будь то чтение, удаление или вставка


//: ### 1.5 Что такое замыкание(Closure)? Приведите примеры использования.

//Замыкания — это функция, которая может быть передана в виде параметра и многократно использована.

let numbers = [1, 2, 3, 4, 5]

func reverseFunc(_ n1: Int, _ n2: Int) -> Bool {
   return n1 > n2
}
var reverse = numbers.sorted(by: reverseFunc) //[5, 4, 3, 2, 1]


//: ### 1.6 Что такое enum? Что такое raw и associated value?


//1) enum — это объектный тип данных, который предоставляет доступ к различным предопределенным значениям.
//2) У каждого из членов перечисления могут быть ассоциированные с ним значения, то есть его характеристики.

enum Cars {
case mercedes(factory_location: [String], fullName: String)
case toyota(factory_location: [String], fullName: String)
}
var mercedesCar: Cars = .mercedes(factory_location: ["Germany", "Russia", "USA"], fullName: "Mercedes-Benz")

//3) При создании экземпляра перечисления можно получить доступ к иcходному значению члена этого экземпляра перечисления.

enum Cars2: String {
case mercedes = "M"
case toyota = "T"
}

var rawValue = Cars2.mercedes.rawValue //M

//: ### 1.7 Как вы понимаете основные понятия/принципы ООП: Наследование, инкапсуляция, полиморфизм? Приведите примеры.

// Наследование
//Механизм создания нового класса на основе существующего с автоматическим включением в него всех свойств, методов и сабскриптов класса-родителя - есть наследование

class Car {
    let name = "SimpleCar"
    
}

class MuscleCar: Car {
    let turbo = true;
}

var car1 = Car() //SimpleCar
car1.name
//car1.turbo //Value of type 'Car' has no member 'turbo'

var car2 = MuscleCar()
car2.name //SimpleCar
car2.turbo //true

//Полиморфизм
//Полиморфизм — возможность объектов с одинаковым описанием метода иметь различную реализацию этого метода.

class Animal {
    func eat() {
        print("Animal eating")
    }
}

class Cat: Animal {
    override func eat() {
        print("Cat eating")
    }
}

var animal1 = Animal()
var animal2 = Cat()

func eat(_ animal: Animal) {
    animal.eat()
}

eat(animal2) //Cat eating


//Инкапсуляция
//Инкапсуляция – это механизм, позволяющий объединить данные и методы, работающий с ними, в классе и скрыть детали реализации от пользователя.






//: ### 1.8 Для чего существуют операторы "if" и "switch"? Чем они отличаются?

//Оператор условия  if позволяет определить логику вызова блоков кода (исполнять или не исполнять) в зависимости от значения переданного выражения.
//Оператор ветвления switch расширяет возможности оператора if, позволяя удобнее работать с большим количеством вариантов значений вычисляемого выражения когда для каждого из возможных значений необходимо выполнить определенный код.


//: ### 1.9 Что такое Extension и Protocol. Для чего они предназначены? Какие принципы ООП они реализовывают?

//1)Расширения позволяют добавить новую функциональность к существующему объектному типу (классу, структуре или перечислению), а также к протоколу.

//2)Протоколы содержат перечень свойств, методов и сабскриптов, которые должны быть реализованы в объектном типе.

//3 Для расширения возможностей объектномого типа

//Наследование
//4)Протокол может наследовать один или более других протоколов. При этом он может добавлять новые требования поверх наследуемых, — тогда тип, принявший протокол к реализации, будет вынужден выполнить требования всех протоколов в структуре.

//let windConditions = ["calmly", "windly"]




//: # 2. (2 балла за каждый пункт)
//:  2.1 Опишите enum который будет отражать общие состояния погоды(ясно, облачно, осадки и тд). Для тех состояний погоды, для которых возможно, опишите assosiated values с количеством осадков.

enum Temperature {
    case hot
    case warm
    case cold
    case freeze
}

enum Cloudless {
    case good
    case worth
}

enum WhetherConditions {
 
    case clear(temperature: Temperature, humidity: Int, precipitation: Int, windPower: Double, cloudless: Cloudless, atmosphericPressure: Double)
    case cloudly(temperature: Temperature, humidity: Int, precipitation: Int, windPower: Double, cloudless: Cloudless, atmosphericPressure: Double)
    case stormy(temperature: Temperature, humidity: Int, precipitation: Int, windPower: Double, cloudless: Cloudless, atmosphericPressure: Double)

}

var currentTemperature  = WhetherConditions.clear(temperature: .warm, humidity: 200, precipitation: 200, windPower: 20.8, cloudless: .good, atmosphericPressure: 700)


//:  2.2 Опишите функцию minValue, которая принимает 2 аргумента и возвращает меньшее из этих значений.

func minValue(_ arg1: Double, _ arg2: Double) -> (Double){
    
    if (arg1 > arg2) {
      return arg2
        
    }else if (arg2 == arg1) {
        print("numbers are equal")
        return arg1
    }else {
         return arg1
    }
}

minValue(53, 5) //5

//:  2.3 Для следующего объекта типа String выведите все строки короче 10 символов, которые начинаются на "a" или "A" и все строки начинающиеся на b или "B"
let strings = ["adfkjsd", "Akdsfjkdfjldfjk", "bdkk", "kaf", " afurl", "ABBA", "ABBBBBBBBBBBBBBBBA", "no", "1234566dkjdksdjksd", "bbbbbbbbbbbbbbbbbbbb", "Ваc?"]

for i in strings {
    if (i.count <= 10 && (i.hasPrefix("A") || i.hasPrefix("a") || i.hasPrefix("b") || i.hasPrefix("B") || i.hasPrefix(" A") || i.hasPrefix(" a") || i.hasPrefix(" b") || i.hasPrefix(" B"))) {
        print(i)
    }
}



//:  2.4 Опишите функцию, которая принимает номер дня недели и возвращает название дня недели.

func dayOfWeek(_ day: Int) {
  
    switch day {
        case 1: print("Monday")
        case 2: print("Tuesday")
        case 3: print("Wednesday")
        case 4: print("Thursday")
        case 5: print("Friday")
        case 6: print("Saturday")
        case 7: print("Sunday")
       default: print("Uncorrect input")
    }
}
  dayOfWeek(2)


//:  2.5 Опишите функцию, которая получает время в качестве трех аргументов (часы, минуты, секунды) и возвращает время в качестве (с тремя этими компонентами). С помощью typealias можете назвать исходящий тип по-своему.
func printTime(_ day: Int, _ month: Int, _ year: Int) {
    
    let calendar = Calendar.current
    var dateComponents = DateComponents()
    dateComponents.day = day
    dateComponents.month = month
    dateComponents.year = year
 
    guard let date = calendar.date(from: dateComponents) else { return }
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ru_Ru")
    dateFormatter.dateFormat = "EEEE"
    
    let weekday = dateFormatter.string(from: date)
    let capitalizedWeekday = weekday.capitalized
    
    print(capitalizedWeekday)
    
}

printTime(17, 11, 2020)

func printTime2(_ hours: Int, _ minutes: Int, _ seconds: Int) {
    
    let calendar = Calendar.current
    var dateComponents = DateComponents()
    dateComponents.second = seconds
    dateComponents.minute = minutes
    dateComponents.hour = hours
 
    guard let date = calendar.date(from: dateComponents) else { return }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    let time = dateFormatter.string(from: date)
    print(time)
    
}

printTime2(2, 23, 22)


//: 2.6 Опишите функцию, принимающую время в виде кортежа, описанного в предыдущем задании, конвертирует полученное время в секунды и возвращает значение Int(количество секунд)

func numberOfSeconds(_ hours: Int, _ minutes: Int, _ seconds: Int) -> Int {
    
    var numberOfSeconds = 0
    
    if (hours <= 24 && minutes <= 60 && seconds <= 60) {
        numberOfSeconds = hours*3600 + minutes*60 + seconds
    }else {
        print("Uncorrect input")
    }

    return numberOfSeconds
}

numberOfSeconds(24, 10, 10)


//:  2.7 Опишите функцию обратную функции из предыдущего задания, принимающую 1 аргумент - количество секунд(например 1500) и конвертирует полученное время в формат кортежа (часы, минуты, секунды) из пункта 2.5

func reverse(_ seconds: Int) -> (one:Int, two:Int, three:Int) {
    
    let hour = Int(seconds/3600)
    let minute = Int(seconds-hour*3600)/60
    let second = Int(seconds-hour*3600-minute*60)
    
    let reversedTime = (hour, minute, second)
    print(reversedTime)
    return reversedTime
    
}

reverse(87010)



//:  2.8 Объявите переменную которая будет иметь тип Closure(замыкание), которое принимает аргументы Int и String и возвращает массив String. Присвойте ей реализацию, которая повторит в массиве строку n раз. Выполните эту функцию, передав ей число 7 и строку "test".


func closure(number: Int, text: String) -> [String] {
    var array = [String]()
    
 for i in 0 ..< number {
    array.append(text)
    }
    
    return array

}

var one = closure(number: 7, text: "test")
print(one)


//:  2.9 Используя функцию `filter', получите массив только с городами с населением более 15 млн человек

struct City: CustomStringConvertible {
   
    
    let population: Int
    let country: String
    let name: String
    
    var description: String {
        return ("\nPopulation: \(population), country: \(country), name: \(name) \n")
    }
}

var citiesArray = [City(population: 24_256_800, country: "Китай", name: "Шанхай"),
City(population: 23_500_000, country: "Пакистан", name: "Карачи" ),
City(population: 21_516_000, country: "Пекин", name: "Китай"),
City(population: 16_349_831, country: "Индия", name: "Дели"),
City(population: 16_060_303, country: "Нигерия", name: "Лагос"),
City(population: 15_200_000, country: "Китай", name: "Тяньцзинь"),
City(population: 14_160_467, country: "Турция", name: "Стамбул"),
City(population: 13_513_734, country: "Япония", name: "Токио"),
City(population: 13_080_500, country: "Китай", name: "Гуанчжоу"),
City(population: 12_442_373, country: "Индия", name: "Мумбаи"),
City(population: 12_197_596, country: "Россия", name: "москва"),
City(population: 11_895_893, country: "Бразилия", name: "Сан-Паулу"),
City(population: 10_467_400, country: "Китай", name: "Шэньчжэнь"),
City(population: 10_075_310, country: "Индонезия", name: "Джакарта"),
City(population: 10_052_000, country: "Пакистан", name: "Лахор"),]


let cities = citiesArray.filter {$0.population>=15_000_000}

print(cities)

//: # 3. (5 баллов за каждый пункт)
//: ### Представьте себе задачу по разработке приложения для домашней климатической техники. В рамках данной задачи вам необходимо выполнить следующее:
/*:
 3.1 Опишите базовый класс HomeSensor, который содержит несколько общих свойств для разных датчиков (например: датчик влажности, температуры, CO2):
 - значение измеряемого параметра данным датчиком value,
 - название измеряемого параметра,
 - целевое значение параметра - идальный показатель (targetValue),
 - точность в процентах (погрешность датчика),
 - id датчика
 - Опишите Void(Ничего не возвращающую) функцию "output" с пустым телом (т.е. что бы она ничего не делала) */
 
class HomeSensor: CustomStringConvertible {

    var value: Int
    var parameterName:String
    var room: String
    var sensorPrecision: Int
    var sensor_id: Int
    var targetValue: Int
    
    func output() {
    }
    
    init(value: Int,parameterName: String, room: String, sensorPrecision: Int, sensor_id:Int, targetValue: Int ) {
        self.value = value
        self.parameterName = parameterName
        self.room = room
        self.sensorPrecision = sensorPrecision
        self.sensor_id = sensor_id
        self.targetValue = targetValue
    }
    
    var description: String {
        return ("Value: \(value), parameterName: \(parameterName), room: \(room), sensorPrecision: \(sensorPrecision), sensor_id: \(sensor_id), targetValue: \(targetValue)")
    }
}

class HumiditySensor: HomeSensor {
    override func output() {
        print("Humidity at sensor №\(super.sensor_id) in \(super.room) is \(super.value)\(super.parameterName), precision is +/- \(sensorPrecision) %, targetValue is \(super.targetValue)\(super.parameterName)")
    }
}
class TemperatureSensor: HomeSensor {
    override func output() {
        print("Temperature at sensor №\(super.sensor_id) in \(super.room) is \(super.value)\(super.parameterName), precision is +/- \(sensorPrecision) %, targetValue is \(super.targetValue)\(super.parameterName)")
    }
}
class COSensor: HomeSensor {
    override func output() {
        print("Level of CO2 at sensor №\(super.sensor_id) in \(super.room) is \(super.value) \(super.parameterName), precision is +/- \(sensorPrecision) %, targetValue is \(super.targetValue)\(super.parameterName)")
    }
}

class Room: CustomStringConvertible {
    
    var sensors:[HomeSensor]
    var roomName: String
    
    init(sensors: [HomeSensor], roomName: String) {
        self.sensors = sensors
        self.roomName = roomName
    }
    
    var description: String {
        return ("Sensors: \(sensors), roomName: \(roomName)")
    }
    
}

class Home: CustomStringConvertible {
 
    var rooms:[Room]
    
    init(rooms: [Room]) {
        self.rooms = rooms
        
    }
    
    func sensorView() {
        for i in rooms {
            for j in i.sensors {
                j.output()
            }
        }
    }
    
    var description: String {
        return ("Rooms: \(rooms))")
        
    }
}



let tempSensor = TemperatureSensor(value: 22, parameterName: "ºC", room: "Kitchen", sensorPrecision: 1, sensor_id: 1, targetValue: 19)
let tempSensor2 = TemperatureSensor(value: 25, parameterName: "ºC", room: "Living Room", sensorPrecision: 1, sensor_id: 2, targetValue: 22)
let tempSensor3 = TemperatureSensor(value: 20, parameterName: "ºC", room: "Bed room", sensorPrecision: 1, sensor_id: 3,  targetValue: 17)

let humiditySensor = HumiditySensor(value: 35, parameterName: "%", room: "Kitchen", sensorPrecision: 1, sensor_id: 4,  targetValue: 33)
let humiditySensor2 = HumiditySensor(value: 37, parameterName: "%", room: "Living Room", sensorPrecision: 1, sensor_id: 5, targetValue: 34)
let humiditySensor3 = HumiditySensor(value: 40, parameterName: "%", room: "Bed room", sensorPrecision: 1, sensor_id: 6,  targetValue: 37)

let coSensor = COSensor(value: 700, parameterName: "ppm", room: "Kitchen", sensorPrecision: 1, sensor_id: 7,  targetValue: 720)
let coSensor2 = COSensor(value: 750, parameterName: "ppm", room: "Living Room", sensorPrecision: 1, sensor_id: 8,  targetValue: 770)
let coSensor3 = COSensor(value: 800, parameterName: "ppm", room: "Bed room", sensorPrecision: 1, sensor_id: 9,  targetValue: 820)

var kitchen = Room(sensors: [tempSensor, humiditySensor, coSensor], roomName: "Kitchen")
var livingroom = Room(sensors: [tempSensor2, humiditySensor2, coSensor2], roomName: "Living Room")
var bedroom = Room(sensors: [tempSensor3, humiditySensor3, coSensor3], roomName: "Bed Room")

var home = Home(rooms: [kitchen, livingroom, bedroom])
home.sensorView()




/*
 3.2 Опишите наследуемые классы для каждого типа датчиков (HumiditySensor, TemperatureSensor, COSensor)=
 3.3 В дочерних классах переопределите функцию Output, что бы она выводила описание типа "Температура на датчике 13 равна 15ºС +/- 1ºС. Целевое значение - 19ºС"

 3.4 Опишите класс для комнаты(Room), который может содержать несколько сенсоров(HomeSensor) в одном свойстве c названием sensors. Так же Room должно содержать свойство - название комнаты.
 3.5 Опишите класс Home, который может содержать несколько комнат(Room) в одном свойстве c названием rooms, а также опишите в нем функцию, которая выводит в консоль показания всех датчиков в каждой комнате, используя метод output
 */

/*:
 Продемонстрируйте работу:
 - Создайте 1 экземпляр класса Home и  3 экземпляра Room (кухня, гостинная, спальня). Добавьте созданные экземпляры комнат в объект Home (в проперти rooms объекта Home)
 - Создайте и добавьте несколько экземпляров датчиков в каждую комнату
 - У объекта Home вызовите функцию, которая выводит в консоль показания всех датчиков в каждой комнате
 */


//: Дополнительное задание:
/*:
 Для каждого датчика:
 - опишите дополнительное значение нижнего предела targetValueMin
 - опишите метод, устанавливающий targetValueMin и targetValueMax, предусмотрите валидацию введенного значения (что бы с точки зрения контекста каждого измерения не нарушалась логика)
 - в didSet проперти value предусмотрите сообщение в консоль в случае если новое значение больше, чем targetValue
 */
