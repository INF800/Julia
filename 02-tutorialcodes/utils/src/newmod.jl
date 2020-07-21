module importExport
    greet() = println("I am exported")
    export greet 

    notExportedGreet() = println("I am not exported")
end