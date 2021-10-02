module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events as Events
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)


type Msg
    = UserPressedButton


view : () -> Html Msg
view _ =
    layout [ padding 50 ] <|
        column [ spacing 40 ]
            [ Input.button [] { onPress = Nothing, label = text "Unstyled button" }
            , Input.button
                [ padding 10
                , Border.width 3
                , Border.rounded 6
                , Border.color color.blue
                , Background.color color.lightBlue
                , Font.variant Font.smallCaps

                -- The order of mouseDown/mouseOver can be significant when changing
                -- the same attribute in both
                , mouseDown
                    [ Background.color color.blue
                    , Border.color color.blue
                    , Font.color color.white
                    ]
                , mouseOver
                    [ Background.color color.white
                    , Border.color color.lightGrey
                    ]
                ]
                { onPress = Just UserPressedButton, label = text "styled button" }
            , column [ spacing 5 ]
                [ text "Image button:"
                , Input.button
                    [ padding 3
                    , Border.rounded 9
                    , Border.width 3
                    , Border.color color.blue
                    ]
                    { onPress = Nothing
                    , label =
                        -- The label can be any element, so for example, the button
                        -- can contain an image
                        el [ clip, Border.rounded 6 ] <|
                            image
                                [ width <| px 200
                                , height <| px 200
                                , mouseOver [ alpha 0.7 ]
                                ]
                                { src = "https://picsum.photos/200/200?grayscale"
                                , description = "Image button"
                                }
                    }
                ]
            , Input.button
                [ padding 20
                , Background.color color.lightBlue
                , Border.width 2
                , Border.rounded 16
                , Border.color color.blue
                , Border.shadow
                    { offset = ( 4, 4 ), size = 3, blur = 10, color = color.lightGrey }
                , Font.color color.white
                , mouseDown
                    [ Background.color color.white, Font.color color.darkCharcoal ]
                , focused
                    [ Border.shadow
                        { offset = ( 4, 4 ), size = 3, blur = 10, color = color.blue }
                    ]
                ]
                { onPress = Just UserPressedButton
                , label = text "Button with focus style"
                }
            ]


main : Program () () Msg
main =
    Browser.sandbox
        { init = ()
        , view = view
        , update = \_ _ -> ()
        }


color =
    { blue = rgb255 0x72 0x9F 0xCF
    , darkCharcoal = rgb255 0x2E 0x34 0x36
    , lightBlue = rgb255 0xC5 0xE8 0xF7
    , lightGrey = rgb255 0xE0 0xE0 0xE0
    , white = rgb255 0xFF 0xFF 0xFF
    }