module Main exposing (main)

import Browser
import Element as E
import Html exposing (Html)


type alias Model =
    ()


type Msg
    = Noop


update : Msg -> Model -> Model
update msg model =
    model


view : Model -> Html Msg
view model =
    E.layout [] <| E.text "hello world"


type alias Flags =
    ()


main : Program Flags Model Msg
main =
    Browser.sandbox
        { init = ()
        , update = update
        , view = view
        }
