module Web.Controller.Sessions where

import Web.Controller.Prelude
import Web.View.Sessions.New
import qualified IHP.AuthSupport.Controller.Sessions as Sessions

instance Controller SessionsController where
    action NewSessionAction = Sessions.newSessionAction @User
    action CreateSessionAction = Sessions.createSessionAction @User
    action DeleteSessionAction = Sessions.deleteSessionAction @User
    action MyAction = do
        case currentUserOrNothing of
            Just currentUser -> do
                let text = "Hello " <> cs currentUser.email
                renderPlain text
            Nothing -> renderPlain "Please login first"

instance Sessions.SessionsControllerConfig User where
    beforeLogin user = do
        user
            |> modify #failedLoginAttempts (\count -> count + 1)
            |> updateRecord
        case user.lockedAt of 
            Just timestamp -> do
                setErrorMessage "Please click the confirmation link we sent to your email before you can use the App"
                redirectTo NewSessionAction
            Nothing -> pure ()
    

