local json = require("lunajson")

local argparse = require("argparse")
local parser = argparse("postman2insomnia", "Convert Postman environment to Insomnia environment")
parser:option("-f --file", "Path to the Postman environment input file")
parser:option("-o --output",
	"Path to the desired Insomnia environment output file (default is export.json, in the current directory)))")

local args = parser:parse()

if args.file == nil then
	error("No input file specified", 1)
end

if args.output == nil then
	-- use a default path the output file.
	args.output = "export.json"
end

print("Importing from " .. args.file .. "...")

-- read the path to the file from the command line
local file = io.open(args.file, "r")
if not file then
	error("File not found", 1)
end

local file = io.open("import.json", "r")
if not file then
	error("File not found", 1)
end

local fileContents = file:read("*a")
file:close()

-- The environment imported from Postman.
local postmanEnvironment = json.decode(fileContents)

-- The environment exported for Insomnia.
local insomniaEnvironment = {}

print("Transforming environment...")

for _, v in pairs(postmanEnvironment["values"]) do
	insomniaEnvironment[v["key"]] = v["value"]
end

local result = json.encode(insomniaEnvironment)

io.output("export.json")
io.write(result)

print("Done!")
