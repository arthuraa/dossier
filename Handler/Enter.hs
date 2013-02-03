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
  case result of
    FormSuccess username -> do
      setSession "username" username
      redirect HomeR
    _ -> redirect EnterR

enterForm :: Form Text
enterForm = renderDivs $ areq textField "Username" Nothing
