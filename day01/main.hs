import System.IO;

import Data.List;
import Data.List.Split;
import Data.Maybe;
import Text.Printf;

parenToOffset :: Char -> Int
parenToOffset c
    | c == '(' = 1
    | c == ')' = -1
    | otherwise = 0

toCurrentLevelImpl :: ([Int], [Int]) -> ([Int], [Int])
toCurrentLevelImpl (arr, []) = toCurrentLevelImpl (arr, [0])
toCurrentLevelImpl ([], a) = ([], a)
toCurrentLevelImpl (instructions, state) =
    toCurrentLevelImpl (tail instructions, [(head state + head instructions)] ++ state)

toCurrentLevel x = reverse $ snd (toCurrentLevelImpl (x, []))

levelsAtIndex contents = toCurrentLevel (map parenToOffset contents)

main = do
    contents <- readFile "data.txt"
    printf "Task 1: %d\n" (last $ levelsAtIndex contents) 
    printf "Task 2: %d\n" (fromMaybe (-1) (elemIndex (-1) (levelsAtIndex contents)))
