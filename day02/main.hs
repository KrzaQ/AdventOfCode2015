import System.IO;

import Data.List;
import Data.List.Split;

processLine l = sort (map (read) (splitOn "x" l) :: [Integer])

processData d = map processLine (lines d) 

task1Core arr = 3 * a * b + 2 * a * c + 2 * b * c where [a,b,c] = arr

task2Core arr = a * b * c + 2 * a + 2 * b where [a,b,c] = arr

main = do
    contents <- readFile "data.txt"
    print $ sum (map task1Core (processData contents))
    print $ sum (map task2Core (processData contents))
