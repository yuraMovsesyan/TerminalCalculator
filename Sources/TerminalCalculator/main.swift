print(CommandLine.arguments)

var arguments: String

if CommandLine.arguments.count == 1{
    arguments = "2 + (2 - 3)"
}else{
    arguments = ""
    for arg in CommandLine.arguments[1...]{
        arguments += arg
    }
}

let tokens = Lexer(line: arguments)
tokens.printTokens()

let numberStack = Stack<Double>()
let operationStack = Stack<Token>()

for token in tokens.getTokens(){
    print(token.value, terminator: "")

    if token.typeToken == Token.type.number{
        numberStack.push(Double(token.value)!)
    }else if (token.typeToken == Token.type.operation){
        while let opr = operationStack.pop(){
            if opr.value != "("{
                if Operation.getPriority(Character(opr.value)) >= Operation.getPriority(Character(token.value)){
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

        operationStack.push(token)
    }else{
        if token.value == "("{
            operationStack.push(token)
        }else{
            while let opr = operationStack.pop(){
                if opr.value != "("{
                    let b = numberStack.pop()!
                    let a = numberStack.pop()!

                    numberStack.push(Operation.calculate(opr: Character(opr.value), a: a, b: b)!)
                }else{
                    operationStack.push(opr)
                    break
                }
            }

            if let opr = operationStack.pop(){
                if opr.value != "("{
                    operationStack.push(opr)
                    operationStack.push(token)
                }
            }
        }
    }
}

while let opr = operationStack.pop(){
    let b = numberStack.pop()!
    let a = numberStack.pop()!

    numberStack.push(Operation.calculate(opr: Character(opr.value), a: a, b: b)!)
}
print()
print(numberStack.pop()!)