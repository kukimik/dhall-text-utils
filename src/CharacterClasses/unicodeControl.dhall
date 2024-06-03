{-|
List of all Unicode control characters (C0 controls `\u0000` to `\u001F`,
delete `\u007F` and C1 controls `\u0080` to `\u009F`).
).
-}
let ASCIIcontrol = ./ASCIIcontrol.dhall

let nonASCIIcontrol =
      [ "\u0080"
      , "\u0081"
      , "\u0082"
      , "\u0083"
      , "\u0084"
      , "\u0085"
      , "\u0086"
      , "\u0087"
      , "\u0088"
      , "\u0089"
      , "\u008A"
      , "\u008B"
      , "\u008C"
      , "\u008D"
      , "\u008E"
      , "\u008F"
      , "\u0090"
      , "\u0091"
      , "\u0092"
      , "\u0093"
      , "\u0094"
      , "\u0095"
      , "\u0096"
      , "\u0097"
      , "\u0098"
      , "\u0099"
      , "\u009A"
      , "\u009B"
      , "\u009C"
      , "\u009D"
      , "\u009E"
      , "\u009F"
      ]

let unicodeControl = ASCIIcontrol # nonASCIIcontrol

in  unicodeControl
