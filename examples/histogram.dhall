{-|
Given a list of words the `histogram` function returns an ASCII-art histogram
showing the frequency of the words in the list.

You may run it on the example list of words (coming from the first chapter of the
Book of Genesis, in the public domain World English Bible translation) with:

```
dhall --file ./histogram.dhall
```
-}

let L = ../src/Logic/package.dhall

let P = ../src/Predicates/package.dhall

let barFragment = "▬"

let histogram =
      λ(words : List Text) →
        let f =
              λ(word : Text) →
              λ(histogram : Text) →
                let word_ = "\t${Text/show word}\n"

                in  L.ifThenElse
                      (P.contains word_ histogram)
                      (Text/replace word_ "${barFragment}${word_}" histogram)
                      "${histogram}${barFragment}${word_}"

        in  Text/replace "\t" " " (List/fold Text words Text f "")

in  histogram
      ["IN","THE","BEGINNING","GOD","CREATED","THE","HEAVENS","AND","THE","EARTH","THE","EARTH","WAS","FORMLESS","AND","EMPTY","DARKNESS","WAS","ON","THE","SURFACE","OF","THE","DEEP","AND","GOD'S","SPIRIT","WAS","HOVERING","OVER","THE","SURFACE","OF","THE","WATERS","GOD","SAID","LET","THERE","BE","LIGHT","AND","THERE","WAS","LIGHT","GOD","SAW","THE","LIGHT","AND","SAW","THAT","IT","WAS","GOOD","GOD","DIVIDED","THE","LIGHT","FROM","THE","DARKNESS","GOD","CALLED","THE","LIGHT","DAY","AND","THE","DARKNESS","HE","CALLED","NIGHT","THERE","WAS","EVENING","AND","THERE","WAS","MORNING","THE","FIRST","DAY","GOD","SAID","LET","THERE","BE","AN","EXPANSE","IN","THE","MIDDLE","OF","THE","WATERS","AND","LET","IT","DIVIDE","THE","WATERS","FROM","THE","WATERS","GOD","MADE","THE","EXPANSE","AND","DIVIDED","THE","WATERS","WHICH","WERE","UNDER","THE","EXPANSE","FROM","THE","WATERS","WHICH","WERE","ABOVE","THE","EXPANSE","AND","IT","WAS","SO","GOD","CALLED","THE","EXPANSE","SKY","THERE","WAS","EVENING","AND","THERE","WAS","MORNING","A","SECOND","DAY","GOD","SAID","LET","THE","WATERS","UNDER","THE","SKY","BE","GATHERED","TOGETHER","TO","ONE","PLACE","AND","LET","THE","DRY","LAND","APPEAR","AND","IT","WAS","SO","GOD","CALLED","THE","DRY","LAND","EARTH","AND","THE","GATHERING","TOGETHER","OF","THE","WATERS","HE","CALLED","SEAS","GOD","SAW","THAT","IT","WAS","GOOD","GOD","SAID","LET","THE","EARTH","YIELD","GRASS","HERBS","YIELDING","SEEDS","AND","FRUIT","TREES","BEARING","FRUIT","AFTER","THEIR","KIND","WITH","THEIR","SEEDS","IN","IT","ON","THE","EARTH","AND","IT","WAS","SO","THE","EARTH","YIELDED","GRASS","HERBS","YIELDING","SEED","AFTER","THEIR","KIND","AND","TREES","BEARING","FRUIT","WITH","THEIR","SEEDS","IN","IT","AFTER","THEIR","KIND","AND","GOD","SAW","THAT","IT","WAS","GOOD","THERE","WAS","EVENING","AND","THERE","WAS","MORNING","A","THIRD","DAY","GOD","SAID","LET","THERE","BE","LIGHTS","IN","THE","EXPANSE","OF","THE","SKY","TO","DIVIDE","THE","DAY","FROM","THE","NIGHT","AND","LET","THEM","BE","FOR","SIGNS","TO","MARK","SEASONS","DAYS","AND","YEARS","AND","LET","THEM","BE","FOR","LIGHTS","IN","THE","EXPANSE","OF","THE","SKY","TO","GIVE","LIGHT","ON","THE","EARTH","AND","IT","WAS","SO","GOD","MADE","THE","TWO","GREAT","LIGHTS","THE","GREATER","LIGHT","TO","RULE","THE","DAY","AND","THE","LESSER","LIGHT","TO","RULE","THE","NIGHT","HE","ALSO","MADE","THE","STARS","GOD","SET","THEM","IN","THE","EXPANSE","OF","THE","SKY","TO","GIVE","LIGHT","TO","THE","EARTH","AND","TO","RULE","OVER","THE","DAY","AND","OVER","THE","NIGHT","AND","TO","DIVIDE","THE","LIGHT","FROM","THE","DARKNESS","GOD","SAW","THAT","IT","WAS","GOOD","THERE","WAS","EVENING","AND","THERE","WAS","MORNING","A","FOURTH","DAY","GOD","SAID","LET","THE","WATERS","ABOUND","WITH","LIVING","CREATURES","AND","LET","BIRDS","FLY","ABOVE","THE","EARTH","IN","THE","OPEN","EXPANSE","OF","THE","SKY","GOD","CREATED","THE","LARGE","SEA","CREATURES","AND","EVERY","LIVING","CREATURE","THAT","MOVES","WITH","WHICH","THE","WATERS","SWARMED","AFTER","THEIR","KIND","AND","EVERY","WINGED","BIRD","AFTER","ITS","KIND","GOD","SAW","THAT","IT","WAS","GOOD","GOD","BLESSED","THEM","SAYING","BE","FRUITFUL","AND","MULTIPLY","AND","FILL","THE","WATERS","IN","THE","SEAS","AND","LET","BIRDS","MULTIPLY","ON","THE","EARTH","THERE","WAS","EVENING","AND","THERE","WAS","MORNING","A","FIFTH","DAY","GOD","SAID","LET","THE","EARTH","PRODUCE","LIVING","CREATURES","AFTER","THEIR","KIND","LIVESTOCK","CREEPING","THINGS","AND","ANIMALS","OF","THE","EARTH","AFTER","THEIR","KIND","AND","IT","WAS","SO","GOD","MADE","THE","ANIMALS","OF","THE","EARTH","AFTER","THEIR","KIND","AND","THE","LIVESTOCK","AFTER","THEIR","KIND","AND","EVERYTHING","THAT","CREEPS","ON","THE","GROUND","AFTER","ITS","KIND","GOD","SAW","THAT","IT","WAS","GOOD","GOD","SAID","LET'S","MAKE","MAN","IN","OUR","IMAGE","AFTER","OUR","LIKENESS","LET","THEM","HAVE","DOMINION","OVER","THE","FISH","OF","THE","SEA","AND","OVER","THE","BIRDS","OF","THE","SKY","AND","OVER","THE","LIVESTOCK","AND","OVER","ALL","THE","EARTH","AND","OVER","EVERY","CREEPING","THING","THAT","CREEPS","ON","THE","EARTH","GOD","CREATED","MAN","IN","HIS","OWN","IMAGE","IN","GOD'S","IMAGE","HE","CREATED","HIM","MALE","AND","FEMALE","HE","CREATED","THEM","GOD","BLESSED","THEM","GOD","SAID","TO","THEM","BE","FRUITFUL","MULTIPLY","FILL","THE","EARTH","AND","SUBDUE","IT","HAVE","DOMINION","OVER","THE","FISH","OF","THE","SEA","OVER","THE","BIRDS","OF","THE","SKY","AND","OVER","EVERY","LIVING","THING","THAT","MOVES","ON","THE","EARTH","GOD","SAID","BEHOLD","I","HAVE","GIVEN","YOU","EVERY","HERB","YIELDING","SEED","WHICH","IS","ON","THE","SURFACE","OF","ALL","THE","EARTH","AND","EVERY","TREE","WHICH","BEARS","FRUIT","YIELDING","SEED","IT","WILL","BE","YOUR","FOOD","TO","EVERY","ANIMAL","OF","THE","EARTH","AND","TO","EVERY","BIRD","OF","THE","SKY","AND","TO","EVERYTHING","THAT","CREEPS","ON","THE","EARTH","IN","WHICH","THERE","IS","LIFE","I","HAVE","GIVEN","EVERY","GREEN","HERB","FOR","FOOD","AND","IT","WAS","SO","GOD","SAW","EVERYTHING","THAT","HE","HAD","MADE","AND","BEHOLD","IT","WAS","VERY","GOOD","THERE","WAS","EVENING","AND","THERE","WAS","MORNING","A","SIXTH","DAY"
      ]
