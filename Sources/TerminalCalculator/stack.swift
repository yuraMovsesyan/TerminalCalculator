class Stack <T>{
    private var myArray: [T] = []
    
    var count: Int{ myArray.count }

    func push(_ element: T) {
        myArray.append(element)
    }
    
    func pop() -> T? {
        return myArray.popLast()
    }
}