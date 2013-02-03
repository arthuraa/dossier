module Handler.Timelines where
import Import

timelineForm :: Form Timeline
timelineForm = renderDivs $ Timeline
  <$> areq textField "Name" Nothing
  <*> areq textField "Description" Nothing
  <*> areq textareaField "Contents" Nothing

getTimelinesR :: Handler RepHtml
getTimelinesR = do
  (widget, enctype) <- generateFormPost timelineForm
  
  defaultLayout $ do
    setTitle "Here are the available Timelines"
    $(widgetFile "timelines")

postTimelinesR :: Handler RepHtml
postTimelinesR = undefined -- do
  -- TODO stub
