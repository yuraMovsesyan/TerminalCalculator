class OperationType {
    let symbol: Character
    let priority: Int

    let getResult: (Double, Double) -> Double

    init(symbol: Character, priority: Int, getResult: @escaping (Double, Double) -> Double){
        self.symbol = symbol
        self.priority = priority
        self.getResult = getResult
    }
}

class Operation{

    static let operations: [OperationType] = [
        OperationType(symbol: "+", priority: 1, getResult: {(a: Double, b: Double) -> Double in return a + b}),
        OperationType(symbol: "-", priority: 1, getResult: {(a: Double, b: Double) -> Double in return b - a}),
        OperationType(symbol: "*", priority: 2, getResult: {(a: Double, b: Double) -> Double in return a * b}),
        OperationType(symbol: "/", priority: 2, getResult: {(a: Double, b: Double) -> Double in return b / a})
    ]

    private static func getOperation(_ opr: Character) -> OperationType?{
        for operation in operations{
            if opr ==  operation.symbol{
                return operation
            }
        }
        return nil
    }

    static func getPriority(_ opr: Character) -> Int{
        return getOperation(opr)!.priority
    }

    static func calculate (opr: Character, a: Double, b: Double) -> Double?{
        if let operation = getOperation(opr){
            return operation.getResult(a, b)
        }
        return nil
    }

    static func isOperation(_ opr: Character) -> Bool {
        if getOperation(opr) != nil{
            return true
        }else{
            return false
        }
    }
}