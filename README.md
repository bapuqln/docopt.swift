![build status](https://travis-ci.org/docopt/docopt.swift.svg)
``docopt.swift`` is a Swift port of [docopt](https://github.com/docopt/docopt)
======================================================================

**docopt.swift** helps you create most beautiful command-line interfaces *easily*:

Swift:
``` Swift
let doc : String = """
Not a serious example.

Usage:
  calculator_example.py <value> ( ( + | - | * | / ) <value> )...
  calculator_example.py <function> <value> [( , <value> )]...
  calculator_example.py (-h | --help)
  
Examples:
  calculator_example.py 1 + 2 + 3 + 4 + 5
  calculator_example.py 1 + 2 '*' 3 / 4 - 5    # note quotes around '*'
  calculator_example.py sum 10 , 20 , 30 , 40
  
Options:
  -h, --help
"""

var args = Process.arguments
args.removeAtIndex(0) // arguments[0] is always the program_name
let result = Docopt.parse(doc, argv: args, help: true, version: "1.0")
println("Docopt result: \(result)")
```

Objective-C:
``` Objective-c
NSArray *arguments = [[NSProcessInfo processInfo] arguments];
arguments = arguments.count > 1 ? [arguments subarrayWithRange:NSMakeRange(1, arguments.count - 1)] : @[];

NSDictionary *result = [Docopt parse:doc argv:arguments help:YES version:@"1.0" optionsFirst:NO];
NSLog(@"Docopt result:\n%@", result);
```

Installation
======

Swift:
- Check out `docopt.swift`
- Add `docopt` folder to your project

Swift Package Manager:
```swift
.package(url: "https://github.com/docopt/docopt.swift", from: "0.6.6"),
```

Objective-C:
- Check out `docopt.swift`
- Build `Docopt` target
- Add `Docopt.framework` to your project

License
======
`docopt.swift` is released under the MIT License.
