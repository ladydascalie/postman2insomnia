# Postman -> Insomnia Environment Converter

## Requirements

- lua 5.3+
- luarocks (for installing dependencies)

## Running

```bash
luarocks install lunajson
luarocks install argparse
lua main.lua -f <input file> -o <output file>
```

## Usage

```bash
Usage: lua main.lua [-h] [-f <file>] [-o <output>]

Convert Postman environment to Insomnia environment

Options:
   -h, --help            Show this help message and exit.
       -f <file>,        Path to the Postman environment input file
   --file <file>
         -o <output>,    Path to the desired Insomnia environment output file (default is export.json, in the current directory)))
   --output <output>
```
