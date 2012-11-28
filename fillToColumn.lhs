>import qualified System.Environment as SE
>main = do
> args <- SE.getArgs
> let
>  col :: Int
>  col = read (args !! 0)
> putStrLn $ "Filling to column " ++ (show col) ++ "."
> let
>  fileIn :: FilePath
>  fileIn = args !! 1
> putStrLn $ "From file " ++ fileIn ++ "."
> let
>  fileOut :: FilePath
>  fileOut = args !! 2
> putStrLn $ "To file " ++ fileOut ++ "."
> contents <- readFile fileIn
> let
>  (_,filledContents) =
>   foldr
>    (\char (c,fc) ->
>     case (c,char) of
>      (_,'\n') -> (0,char:fc)
>      (n,_) | n == (col-1) -> (0,char:'\n':fc)
>      (_,_) -> (c+1,char:fc))
>    (0::Int,[])
>    contents
> writeFile fileOut filledContents


