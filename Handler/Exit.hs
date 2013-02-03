module Handler.Exit where

import Import

getExitR :: Handler RepHtml
getExitR = do
  deleteSession "username"
  redirect HomeR