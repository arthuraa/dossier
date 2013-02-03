{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.Enter where

import Import

getEnterR :: Handler RepHtml
getEnterR = do
  (formWidget, formEnctype) <- generateFormPost enterForm
  defaultLayout $ do
    setTitle "Please, log in"
    $(widgetFile "enter")

postEnterR :: Handler RepHtml
postEnterR = do
  ((result, _), _) <- runFormPost enterForm
  let maybeUsername = case result of
        FormSuccess user -> Just user
        _ -> Nothing
  redirect HomeR

enterForm :: Form Text
enterForm = renderDivs $ areq textField "Username" Nothing
