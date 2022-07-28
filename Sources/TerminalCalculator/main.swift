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

print (Calculator.calculate(tokens: (Lexer(line: arguments)).getTokens()))