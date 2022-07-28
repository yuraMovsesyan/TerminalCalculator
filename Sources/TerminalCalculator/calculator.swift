class Calculator {
    static func calculate(tokens: [Token]) -> Double {
        let numberStack = Stack<Double>()
        let operationStack = Stack<Token>()

        func empty_stack_operation(token: Token? = nil){
            while let opr = operationStack.pop(){
                if opr.value != "(" || token == nil {
                    var isCal: Bool
                    if token == nil || token!.value == ")" {
                        isCal = true
                    } else {
                        isCal = Operation.getPriority(Character(opr.value)) >= Operation.getPriority(Character(token!.value))
                    }

                    if isCal{
                        let b = numberStack.pop()!
                        let a = numberStack.pop()!

                        numberStack.push(Operation.calculate(opr: Character(opr.value), a: a, b: b)!)
                    }
                    else{
                        operationStack.push(opr)
                        break 
                    }
                }else{
                    operationStack.push(opr)
                    break
                }
            }
        }

        for token in tokens{
            if token.typeToken == Token.type.number{
                numberStack.push(Double(token.value)!)
            }else if (token.typeToken == Token.type.operation){
                empty_stack_operation(token: token)

                operationStack.push(token)
            }else{
                if token.value == "("{
                    operationStack.push(token)
                }else{
                    empty_stack_operation(token: token)

                    if let opr = operationStack.pop(){
                        if opr.value != "("{
                            operationStack.push(opr)
                            operationStack.push(token)
                        }
                    }
                }
            }
        }

        empty_stack_operation()

        return numberStack.pop()!
    }
}