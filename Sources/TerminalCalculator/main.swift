var arguments: String

if CommandLine.arguments.count == 1{
    print("> ", terminator: "")
    arguments = readLine()!
}else{
    arguments = ""
    for arg in CommandLine.arguments[1...]{
        arguments += arg
    }
}

let lexer = Lexer(line: arguments)

let pr = Processing(tokens: lexer.getTokens())

print (Calculator.calculate(tokens: pr.getTokens()))