import System.IO;

import Data.List;
import Data.List.Split;

processLine l = sort (map (read) (splitOn "x" l) :: [Integer])

processData d = map (processLine) (splitOn "\n" d) 

task1Core arr = 3*arr!!0*arr!!1 + 2*arr!!0*arr!!2 + 2*arr!!1*arr!!2

task2Core arr = arr!!0 * arr!!1 * arr!!2 + 2*arr!!0 + 2*arr!!1

main = do
    contents <- readFile "data.txt"
    print $ sum (map task1Core (processData contents))
    print $ sum (map task2Core (processData contents))
    


