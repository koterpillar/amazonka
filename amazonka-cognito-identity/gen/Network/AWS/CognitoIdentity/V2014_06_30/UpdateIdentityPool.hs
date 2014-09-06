{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CognitoIdentity.V2014_06_30.UpdateIdentityPool
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Updates a user pool. UpdateIdentityPool The following are a request and
-- response for the UpdateIdentityPool action. { "IdentityPoolId":
-- "us-east-1:1a234b56-7890-1cd2-3e45-f6g7hEXAMPLE", "IdentityPoolName":
-- "MyUpdatedPool", "IdentityPoolDescription": "An identity pool that needs
-- updating", "Unauthenticated": true, "SupportedLoginProviders": {
-- "www.amazon.com": "Amazon_App_ID", "graph.facebook.com": "Facebook_App_ID",
-- "accounts.google.com": "Google_App_ID" } } { "IdentityPoolDescription": "An
-- identity pool that needs updating", "IdentityPoolId":
-- "us-east-1:1a234b56-7890-1cd2-3e45-f6g7hEXAMPLE", "IdentityPoolName":
-- "MyUpdatedPool", "SupportedLoginProviders": { "www.amazon.com":
-- "Amazon_App_ID", "graph.facebook.com": "Facebook_App_ID",
-- "accounts.google.com": "Google_App_ID" }, "AllowUnauthenticatedIdentities":
-- true }.
module Network.AWS.CognitoIdentity.V2014_06_30.UpdateIdentityPool
    (
    -- * Request
      UpdateIdentityPool
    -- ** Request constructor
    , mkUpdateIdentityPool
    -- ** Request lenses
    , uipIdentityPoolId
    , uipIdentityPoolName
    , uipAllowUnauthenticatedIdentities
    , uipSupportedLoginProviders

    -- * Response
    , UpdateIdentityPoolResponse
    -- ** Response lenses
    , uiprsIdentityPoolId
    , uiprsIdentityPoolName
    , uiprsAllowUnauthenticatedIdentities
    , uiprsSupportedLoginProviders
    ) where

import           Network.AWS.CognitoIdentity.V2014_06_30.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | An object representing a Cognito identity pool.
data UpdateIdentityPool = UpdateIdentityPool
    { _uipIdentityPoolId :: Text
    , _uipIdentityPoolName :: Text
    , _uipAllowUnauthenticatedIdentities :: Bool
    , _uipSupportedLoginProviders :: Map Text Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'UpdateIdentityPool' request.
mkUpdateIdentityPool :: Text -- ^ 'uipIdentityPoolId'
                     -> Text -- ^ 'uipIdentityPoolName'
                     -> Bool -- ^ 'uipAllowUnauthenticatedIdentities'
                     -> UpdateIdentityPool
mkUpdateIdentityPool p1 p2 p3 = UpdateIdentityPool
    { _uipIdentityPoolId = p1
    , _uipIdentityPoolName = p2
    , _uipAllowUnauthenticatedIdentities = p3
    , _uipSupportedLoginProviders = mempty
    }
{-# INLINE mkUpdateIdentityPool #-}

-- | An identity pool ID in the format REGION:GUID.
uipIdentityPoolId :: Lens' UpdateIdentityPool Text
uipIdentityPoolId =
    lens _uipIdentityPoolId (\s a -> s { _uipIdentityPoolId = a })
{-# INLINE uipIdentityPoolId #-}

-- | A string that you provide.
uipIdentityPoolName :: Lens' UpdateIdentityPool Text
uipIdentityPoolName =
    lens _uipIdentityPoolName (\s a -> s { _uipIdentityPoolName = a })
{-# INLINE uipIdentityPoolName #-}

-- | TRUE if the identity pool supports unauthenticated logins.
uipAllowUnauthenticatedIdentities :: Lens' UpdateIdentityPool Bool
uipAllowUnauthenticatedIdentities =
    lens _uipAllowUnauthenticatedIdentities
         (\s a -> s { _uipAllowUnauthenticatedIdentities = a })
{-# INLINE uipAllowUnauthenticatedIdentities #-}

-- | Optional key:value pairs mapping provider names to provider app IDs.
uipSupportedLoginProviders :: Lens' UpdateIdentityPool (Map Text Text)
uipSupportedLoginProviders =
    lens _uipSupportedLoginProviders
         (\s a -> s { _uipSupportedLoginProviders = a })
{-# INLINE uipSupportedLoginProviders #-}

instance ToPath UpdateIdentityPool

instance ToQuery UpdateIdentityPool

instance ToHeaders UpdateIdentityPool

instance ToJSON UpdateIdentityPool

-- | An object representing a Cognito identity pool.
data UpdateIdentityPoolResponse = UpdateIdentityPoolResponse
    { _uiprsIdentityPoolId :: Text
    , _uiprsIdentityPoolName :: Text
    , _uiprsAllowUnauthenticatedIdentities :: Bool
    , _uiprsSupportedLoginProviders :: Map Text Text
    } deriving (Show, Generic)

-- | An identity pool ID in the format REGION:GUID.
uiprsIdentityPoolId :: Lens' UpdateIdentityPoolResponse Text
uiprsIdentityPoolId =
    lens _uiprsIdentityPoolId (\s a -> s { _uiprsIdentityPoolId = a })
{-# INLINE uiprsIdentityPoolId #-}

-- | A string that you provide.
uiprsIdentityPoolName :: Lens' UpdateIdentityPoolResponse Text
uiprsIdentityPoolName =
    lens _uiprsIdentityPoolName (\s a -> s { _uiprsIdentityPoolName = a })
{-# INLINE uiprsIdentityPoolName #-}

-- | TRUE if the identity pool supports unauthenticated logins.
uiprsAllowUnauthenticatedIdentities :: Lens' UpdateIdentityPoolResponse Bool
uiprsAllowUnauthenticatedIdentities =
    lens _uiprsAllowUnauthenticatedIdentities
         (\s a -> s { _uiprsAllowUnauthenticatedIdentities = a })
{-# INLINE uiprsAllowUnauthenticatedIdentities #-}

-- | Optional key:value pairs mapping provider names to provider app IDs.
uiprsSupportedLoginProviders :: Lens' UpdateIdentityPoolResponse (Map Text Text)
uiprsSupportedLoginProviders =
    lens _uiprsSupportedLoginProviders
         (\s a -> s { _uiprsSupportedLoginProviders = a })
{-# INLINE uiprsSupportedLoginProviders #-}

instance FromJSON UpdateIdentityPoolResponse

instance AWSRequest UpdateIdentityPool where
    type Sv UpdateIdentityPool = CognitoIdentity
    type Rs UpdateIdentityPool = UpdateIdentityPoolResponse

    request = get
    response _ = jsonResponse
