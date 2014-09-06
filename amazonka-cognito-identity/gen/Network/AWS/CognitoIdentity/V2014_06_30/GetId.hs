{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CognitoIdentity.V2014_06_30.GetId
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Generates (or retrieves) a Cognito ID. Supplying multiple logins will
-- create an implicit linked account. GetId The following example shows a
-- GetId request for an unauthenticated identity. { "AccountId":
-- "123456789012;", "IdentityPoolId":
-- "us-east-1:af4311ca-835e-4b49-814c-2290EXAMPLE1" } { "IdentityId":
-- "us-east-1:852d4250-9eec-4006-8f84-4e82EXAMPLE3" }.
module Network.AWS.CognitoIdentity.V2014_06_30.GetId
    (
    -- * Request
      GetId
    -- ** Request constructor
    , mkGetId
    -- ** Request lenses
    , giAccountId
    , giIdentityPoolId
    , giLogins

    -- * Response
    , GetIdResponse
    -- ** Response lenses
    , girsIdentityId
    ) where

import           Network.AWS.CognitoIdentity.V2014_06_30.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Input to the GetId action.
data GetId = GetId
    { _giAccountId :: Text
    , _giIdentityPoolId :: Text
    , _giLogins :: Map Text Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'GetId' request.
mkGetId :: Text -- ^ 'giAccountId'
        -> Text -- ^ 'giIdentityPoolId'
        -> GetId
mkGetId p1 p2 = GetId
    { _giAccountId = p1
    , _giIdentityPoolId = p2
    , _giLogins = mempty
    }
{-# INLINE mkGetId #-}

-- | A standard AWS account ID (9+ digits).
giAccountId :: Lens' GetId Text
giAccountId = lens _giAccountId (\s a -> s { _giAccountId = a })
{-# INLINE giAccountId #-}

-- | An identity pool ID in the format REGION:GUID.
giIdentityPoolId :: Lens' GetId Text
giIdentityPoolId =
    lens _giIdentityPoolId (\s a -> s { _giIdentityPoolId = a })
{-# INLINE giIdentityPoolId #-}

-- | A set of optional name/value pairs that map provider names to provider
-- tokens.
giLogins :: Lens' GetId (Map Text Text)
giLogins = lens _giLogins (\s a -> s { _giLogins = a })
{-# INLINE giLogins #-}

instance ToPath GetId

instance ToQuery GetId

instance ToHeaders GetId

instance ToJSON GetId

-- | Returned in the response to a GetId request.
newtype GetIdResponse = GetIdResponse
    { _girsIdentityId :: Maybe Text
    } deriving (Show, Generic)

-- | A unique identifier in the format REGION:GUID.
girsIdentityId :: Lens' GetIdResponse (Maybe Text)
girsIdentityId = lens _girsIdentityId (\s a -> s { _girsIdentityId = a })
{-# INLINE girsIdentityId #-}

instance FromJSON GetIdResponse

instance AWSRequest GetId where
    type Sv GetId = CognitoIdentity
    type Rs GetId = GetIdResponse

    request = get
    response _ = jsonResponse
