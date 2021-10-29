import Foundation

//public class SyncArray<Element> {
//    fileprivate let queue = DispatchQueue(label: "io.SynchArray", attributes: .concurrent)
//    fileprivate var array = [Element]()
//}
//
//// MARK: -
//// MARK: Immutable
//
//public extension SyncArray {
//
//    func first(where predicate: (Element) -> Bool) -> Element? {
//        var result: Element?
//        queue.sync { result = self.array.first(where: predicate) }
//        return result
//    }
//
//    func filter(_ isIncluded: (Element) -> Bool) -> [Element] {
//        var result = [Element]()
//        queue.sync { result = self.array.filter(isIncluded) }
//        return result
//    }
//
//    func index(where predicate: (Element) -> Bool) -> Int? {
//        var result: Int?
//        queue.sync { result = self.array.firstIndex(where: predicate) }
//        return result
//    }
//
//    func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
//        var result = [Element]()
//        queue.sync { result = self.array.sorted(by: areInIncreasingOrder) }
//        return result
//    }
//
//    func compactMap<ElementOfResult>(_ transform: (Element) -> ElementOfResult?) -> [ElementOfResult] {
//        var result = [ElementOfResult]()
//        queue.sync { result = self.array.compactMap(transform) }
//        return result
//    }
//
//    func forEach(_ body: (Element) -> Void) {
//        queue.sync { self.array.forEach(body) }
//    }
//
//    func contains(where predicate: (Element) -> Bool) -> Bool {
//        var result = false
//        queue.sync { result = self.array.contains(where: predicate) }
//        return result
//    }
//}
//
//// MARK: -
//// MARK: Mutable
//
//public extension SyncArray {
//
//    func append( _ element: Element) {
//        queue.async(flags: .barrier) {
//            self.array.append(element)
//        }
//    }
//
//    func append( _ elements: [Element]) {
//        queue.async(flags: .barrier) {
//            self.array += elements
//        }
//    }
//
//    func insert( _ element: Element, at index: Int) {
//        queue.async(flags: .barrier) {
//            self.array.insert(element, at: index)
//        }
//    }
//
//    func remove(at index: Int, completion: ((Element) -> Void)? = nil) {
//        queue.async(flags: .barrier) {
//            let element = self.array.remove(at: index)
//
//            DispatchQueue.main.async {
//                completion?(element)
//            }
//        }
//    }
//
//    func remove(where predicate: @escaping (Element) -> Bool, completion: ((Element) -> Void)? = nil) {
//        queue.async(flags: .barrier) {
//            guard let index = self.array.firstIndex(where: predicate) else { return }
//            let element = self.array.remove(at: index)
//
//            DispatchQueue.main.async {
//                completion?(element)
//            }
//        }
//    }
//
//    func removeAll(completion: (([Element]) -> Void)? = nil) {
//        queue.async(flags: .barrier) {
//            let elements = self.array
//            self.array.removeAll()
//
//            DispatchQueue.main.async {
//                completion?(elements)
//            }
//        }
//    }
//}
//
//// MARK: -
//// MARK: Equatable
//public extension SyncArray where Element: Equatable {
//
//    func contains(_ element: Element) -> Bool {
//        var result = false
//        queue.sync { result = self.array.contains(element) }
//        return result
//    }
//}

public class Atomic<A> {

    // MARK: -
    // MARK: Variables

    var value: A {
        get {
            return queue.sync { self._value }
        }
    }
    private var _value: A

    private let queue = DispatchQueue(label: "Atomic serial queue")

    // MARK: -
    // MARK: Initialization

    init(_ value: A) {
        self._value = value
    }

    // MARK: -
    // MARK: Public

    func mutate(_ transform: (inout A) -> ()) {
        queue.sync {
            transform(&self._value)
        }
    }
}
