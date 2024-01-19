ASCIIdigit = ["0","1","2","3","4","5","6","7","8","9"]

ASCIIupper = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

ASCIIlower = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

ASCIIalpha = ASCIIuppercase # ASCIIlowercase

ASCIIalnum = ASCIIalpha # ASCIIdigit

ASCIIcontrol = ["\u00","\u01","\u02","\u03","\u04","\u05","\u06","\u07","\u08","\u09","\u0A","\u0B","\u0C","\u0D","\u0E","\u0F","\u10","\u11","\u12","\u13","\u14","\u15","\u16","\u17","\u18","\u19","\u1A","\u1B","\u1C","\u1D","\u1E","\u1F","\u7F"]

ASCIIprintable = ["\u20","\u21","\u22","\u23","\u24","\u25","\u26","\u27","\u28","\u29","\u2A","\u2B","\u2C","\u2D","\u2E","\u2F","\u30","\u31","\u32","\u33","\u34","\u35","\u36","\u37","\u38","\u39","\u3A","\u3B","\u3C","\u3D","\u3E","\u3F","\u40","\u41","\u42","\u43","\u44","\u45","\u46","\u47","\u48","\u49","\u4A","\u4B","\u4C","\u4D","\u4E","\u4F","\u50","\u51","\u52","\u53","\u54","\u55","\u56","\u57","\u58","\u59","\u5A","\u5B","\u5C","\u5D","\u5E","\u5F","\u60","\u61","\u62","\u63","\u64","\u65","\u66","\u67","\u68","\u69","\u6A","\u6B","\u6C","\u6D","\u6E","\u6F","\u70","\u71","\u72","\u73","\u74","\u75","\u76","\u77","\u78","\u79","\u7A","\u7B","\u7C","\u7D","\u7E"]

ASCII = ["\u00","\u01","\u02","\u03","\u04","\u05","\u06","\u07","\u08","\u09","\u0A","\u0B","\u0C","\u0D","\u0E","\u0F","\u10","\u11","\u12","\u13","\u14","\u15","\u16","\u17","\u18","\u19","\u1A","\u1B","\u1C","\u1D","\u1E","\u1F","\u20","\u21","\u22","\u23","\u24","\u25","\u26","\u27","\u28","\u29","\u2A","\u2B","\u2C","\u2D","\u2E","\u2F","\u30","\u31","\u32","\u33","\u34","\u35","\u36","\u37","\u38","\u39","\u3A","\u3B","\u3C","\u3D","\u3E","\u3F","\u40","\u41","\u42","\u43","\u44","\u45","\u46","\u47","\u48","\u49","\u4A","\u4B","\u4C","\u4D","\u4E","\u4F","\u50","\u51","\u52","\u53","\u54","\u55","\u56","\u57","\u58","\u59","\u5A","\u5B","\u5C","\u5D","\u5E","\u5F","\u60","\u61","\u62","\u63","\u64","\u65","\u66","\u67","\u68","\u69","\u6A","\u6B","\u6C","\u6D","\u6E","\u6F","\u70","\u71","\u72","\u73","\u74","\u75","\u76","\u77","\u78","\u79","\u7A","\u7B","\u7C","\u7D","\u7E","\u7F"]

let contains = ./contains.dhall
let TextBool = ./Logic/contains.dhall
let isContainedIn : (haystack : Text) -> (needle : Text) -> TextBool = \(haystack : Text) -> \(needle : Text) -> contains needle haystack
in isContainedIn

let any = ./Logic/any.dhall
let TextBool = ./Logic/contains.dhall
let isContainedIn = ./isContainedIn.dhall
let containsOneOf : ( ts : List Text ) -> ( t : Text ) -> TextBool
 = \( ts : List Text ) -> \( t : Text ) -> any Text (isContainedIn t) ts 
in containsOneOf

let isTrue : (v : TextBool) -> Type = \(v : TextBool) -> true === v
let QED = assert : true === true

let hasLengthAtMost (n : Natural) -> (t : Text) -> (isTrue (isASCII t)) -> TextBool
		Text/replace  "x" -- like foldRemove...

let hasLengthAtLeast (n : Natural) -> (t : Text) -> (isTrue (isASCII t)) -> TextBool
		Text/replace  "x" -- like foldRemove...

let hasLength (n : Natural) -> (t : Text) -> (isTrue (isASCII t)) -> TextBool
		Text/replace  "x" -- like foldRemove...


consistsOf ASCIIdigit/ASCIIupper/ASCIIlower/ASCIIalpha/ASCIIalnum/ASCIIcontrol/ASCIIprintable/ASCII
