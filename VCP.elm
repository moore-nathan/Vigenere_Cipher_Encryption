module VCP exposing (main)
import String
import List
import Html exposing (Html, div, text, ul, li)
import Html.Attributes exposing (class)
import Maybe exposing (withDefault)
import Array
import Debug exposing (log)
import Char

message = "THEELMPROGRAMMER"
keyText = "NEERAJ"

msg = String.split "" message
key = String.split "" keyText
msgLen = (List.length msg)


something: Int -> Int -> List String -> List String
something i j nK =
    if i < msgLen then
        if j == (List.length key) then
            something i 0 nK
        else
            -- log (String.fromInt j + " " +)
            something (i+1) (j+1) (nK ++
                [(withDefault "" (Array.get j (Array.fromList key)))])
    else
        nK
newKey = something 0 0 []

something2: Int -> List String -> List Char -> List Char -> List String
something2 i em msg2 newKey2 =
    if i < msgLen then
        something2 (i+1) (em ++ [String.fromChar
            (Char.fromCode ((modBy 26 ((Char.toCode (withDefault '!' (Array.get i (Array.fromList msg2))))
            + (Char.toCode (withDefault '!' (Array.get i (Array.fromList newKey2))))))
            + Char.toCode 'A'))
            ])
        msg2 newKey2
    else
        em
encryptedMsg = something2 0 [] (String.toList message) (String.toList (String.join "" newKey))


something3: Int -> List String -> List Char -> List Char -> List String
something3 i dm em2 newKey3 =
    if i < msgLen then
        something3 (i+1) (dm ++ [String.fromChar
            (Char.fromCode ((modBy 26
            (((Char.toCode (withDefault '!' (Array.get i (Array.fromList em2))))
            - (Char.toCode (withDefault '!' (Array.get i (Array.fromList newKey3))))) + 26))
            + Char.toCode 'A'))
            ])
        em2 newKey3
    else
        dm
decryptedMsg = something3 0 [] (String.toList (String.join "" encryptedMsg)) (String.toList (String.join "" newKey))


main : Html msg
main =
    div [ class "text-center" ]
        [ div [] [text ("Original Message: " ++ (String.join "" msg))]
        , div [] [text ("Key: " ++ (String.join "" key))]
        , div [] [text ("Generated Key: " ++ (String.join "" newKey))]
        , div [] [text ("Encrypted Message: " ++ (String.join "" encryptedMsg))]
        , div [] [text ("Decrypted Message: " ++ (String.join "" decryptedMsg))]
        ]
