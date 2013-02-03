module Handler.Timelines where
import Import

getTimelinesR :: Handler RepHtml
getTimelinesR = do
  defaultLayout $ do
    setTitle "Here are the available Timelines"
    $(widgetFile "timelines")
