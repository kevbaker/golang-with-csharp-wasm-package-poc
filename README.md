# Golang App with Dotnet Wasm Package

## Overview

A Golang App with Dotnet Wasm package instantiated through `wasmer-go`. The goal is to create a "Universal Package" out of existing dotnet code that can be used directly in Golang.

## Steps

* [x] Create project
* [x] Setup VS Code
* [x] Install Wasmer
* [x] Build WASM
* [x] Execute WASM with Wasmer
* [x] Create Go project 
* [ ] Go project consumes WASM

## Usage

### Build / Test Dotnet Package

Build the dotnet wasm package

`make build`

Run the dotnet wasm package
`make run-dotnet`

### Run Go App

This copies the dotnet wasm file over to go project.

`make run-go`

## Errors

Currently getting an error when running. This is related to how the wasm package is being instantiated... I think.

```bash
panic: runtime error: invalid memory address or nil pointer dereference
[signal SIGSEGV: segmentation violation code=0x1 addr=0x8 pc=0x1000ad01c]

goroutine 1 [running]:
main.main()
	/Users/Kevin.Baker/Code/Analog/Learn/dotnetcore/first-dotnetcore/FirstDotnetWebAssembly/src/go/main.go:29 +0x13c
exit status 2
make: *** [run-go] Error 1
```

### Make Commands

`make <command>`
- `build`                          Build project for deployment
- `run-wasm`                       Start dev environment
- `run-go`                         Start dev environment
- `stats`                          Start dev environment


## Notes

Install Wasmer

`curl https://get.wasmer.io -sSfL | sh`

Install the WASI SDK:

`dotnet add package Wasi.Sdk --prerelease`


## Resources

- [Getting Started Dotnet VS Code](https://mail.google.com/mail/u/0/#inbox/KtbxLxgBxdcqnMZbGcVttnshQcCFnslmzg?projector=1)

- WAPM, Wasm Module Video - https://youtu.be/ghnw-lOYWrs
- WebAssembly/wasi-sdk: WASI-enabled WebAssembly C/C++ toolchain. This is what we need to publish C# code as WASM.
  - https://github.com/WebAssembly/wasi-sdk
- How to use WASI-SDK with Dotnet Video
  - https://youtu.be/A0vz_BWxIMc
- SteveSandersonMS/dotnet-wasi-sdk: Packages for building .NET projects as standalone WASI-compliant modules
  - https://github.com/SteveSandersonMS/dotnet-wasi-sdk
- Wasmer - Wasm runtime
  - https://wasmer.io
- Wasmer for Go - This can load WA packages into go for execution
  - Source code here on how to instantiate the package.
  - https://github.com/wasmerio/wasmer-go
- Fix WASI Export
  - https://github.com/WebAssembly/wasi-sdk/issues/110