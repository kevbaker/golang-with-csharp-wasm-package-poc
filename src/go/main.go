package main

import (
	"fmt"
	"io/ioutil"

	"github.com/wasmerio/wasmer-go/wasmer"
	"rsc.io/quote"
)

func main() {
	fmt.Println("Hello, World!")
	fmt.Println(quote.Go())

	// Wasm stuff
	wasmBytes, _ := ioutil.ReadFile("FirstDotnetWebAssembly.wasm")

	engine := wasmer.NewEngine()
	store := wasmer.NewStore(engine)

	// // Compiles the module
	module, _ := wasmer.NewModule(store, wasmBytes)

	// // Instantiates the module
	importObject := wasmer.NewImportObject()
	instance, _ := wasmer.NewInstance(module, importObject)

	// // Gets the `sum` exported function from the WebAssembly instance.
	Sum, _ := instance.Exports.GetFunction("Sum")

	// // Calls that exported function with Go standard values. The WebAssembly
	// // types are inferred and values are casted automatically.
	result, _ := Sum(5, 37)
	fmt.Println(result)

}
