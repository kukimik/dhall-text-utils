let L = ../src/Logic/package.dhall
let A = ../src/Assertions/package.dhall
let C = ../src/CharacterClasses/package.dhall
let T = ../src/Transformations/package.dhall
let validIP = \(ip : Text) -> \(reservedIPs : List Text)
	let
	let component1 = L.findFirst (A.isPrefixOf ip) xs ip
	let withoutComponent1 =
		L.ifThenElse
			component1.wasFound
			(T.stripPrefix component1.value ip)
			""
	let component2 = L.findFirst (A.isPrefixOf ip) xs withoutComponent1
	let withoutComponents1_2 =
		L.ifThenElse
			component1.wasFound
			(T.stripPrefix component2.value withoutComponent1)
			""
	let component3 = L.findFirst (A.isPrefixOf ip) xs withoutComponents1_2
	let withoutComponents1_2_3 =
		L.ifThenElse
			component1.wasFound
			(T.stripPrefix component3.value withoutComponents1_2)
			""
	let component4 = L.findFirst (A.isPrefixOf ip) xs withoutComponents1_2_3
	let withoutComponents1_2_3_4 = (T.stripPrefix component4.value withoutComponents1_2_3)
	let conditions =
		[
		 A.consistsOf (A.ASCIIdigit # ["."])
		,component1.wasFound
		,component2.wasFound
		,component3.wasFound
		,component4.wasFound
		,A.isEmpty withoutComponents1_2_3_4
		,not A.elementOf reservedIPs "${component1.value}${component2.value}${component3.value}${component4.value}"
		]
	in L.and conditions

in goodUsername
