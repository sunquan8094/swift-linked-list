// Playground - noun: a place where people can play

import UIKit
class LLNode<T> {
    var data:T? = nil
    var next:LLNode<T>? = nil
    init(data:T?) {
        self.data = data
    }
    func getData() -> T? {
        return data
    }
    func setData(d:T?) {
        self.data = d
    }
    func getNext() -> LLNode<T>? {
        return next
    }
    func setNext(n:LLNode<T>?) {
        self.next = n
    }
}

class DCLL<T> {
    var root:LLNode<T>? = nil
    init() {
        self.root = nil
    }
    
    func add(d:T?) {
        if (self.root == nil) {
            self.root = LLNode(data: d)
            return
        }
        var temp:LLNode<T>? = self.root
        while (temp != nil) {
            if (temp!.getNext() == nil) {
                var child:LLNode<T>? = LLNode(data: d)
                temp!.setNext(child)
                break
            }
            else {
                temp = temp!.getNext()
            }
        }
    }
    
    func deleteByIndex(n:Int) {
        var temp:LLNode<T>? =  self.root
        var prev:LLNode<T>? = nil
        var h:Int = 0;
        while (temp != nil && h < n) {
            prev = temp;
            temp = temp!.getNext()
            h++
        }
        if (temp != nil && h == n) {
            if (prev == nil) {
                self.root = temp!.getNext()
            }
            else {
                prev!.setNext(temp!.getNext())
            }
        }
    }
    
    func get(i:Int) -> T? {
        var temp:LLNode<T>? = self.root
        var arr:Int = 0
        while (arr < i && temp != nil) {
            temp = temp!.getNext()
            arr++
        }
        if (temp == nil) {
            return nil
        }
        else {
            return temp!.getData()
        }
    }
}

var listOfStrings:DCLL<String> = DCLL<String>()

listOfStrings.add("jin")
listOfStrings.add("merr")
listOfStrings.add("gurdur")
listOfStrings.add("lol")
listOfStrings.get(0)
listOfStrings.get(1)
listOfStrings.deleteByIndex(1)
listOfStrings.deleteByIndex(0);
listOfStrings.get(0)

