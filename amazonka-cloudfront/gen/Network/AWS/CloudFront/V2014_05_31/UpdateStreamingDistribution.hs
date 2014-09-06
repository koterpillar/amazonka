{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudFront.V2014_05_31.UpdateStreamingDistribution
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Update a streaming distribution.
module Network.AWS.CloudFront.V2014_05_31.UpdateStreamingDistribution
    (
    -- * Request
      UpdateStreamingDistribution
    -- ** Request constructor
    , mkUpdateStreamingDistribution
    -- ** Request lenses
    , usdStreamingDistributionConfig
    , usdId
    , usdIfMatch

    -- * Response
    , UpdateStreamingDistributionResponse
    -- ** Response lenses
    , usdrsStreamingDistribution
    , usdrsETag
    ) where

import Network.AWS.Request.RestXML
import Network.AWS.CloudFront.V2014_05_31.Types
import Network.AWS.Prelude
import Network.AWS.Types (Region)

-- | The request to update a streaming distribution.
data UpdateStreamingDistribution = UpdateStreamingDistribution
    { _usdStreamingDistributionConfig :: StreamingDistributionConfig
    , _usdId :: Text
    , _usdIfMatch :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'UpdateStreamingDistribution' request.
mkUpdateStreamingDistribution :: StreamingDistributionConfig -- ^ 'usdStreamingDistributionConfig'
                              -> Text -- ^ 'usdId'
                              -> UpdateStreamingDistribution
mkUpdateStreamingDistribution p1 p2 = UpdateStreamingDistribution
    { _usdStreamingDistributionConfig = p1
    , _usdId = p2
    , _usdIfMatch = Nothing
    }
{-# INLINE mkUpdateStreamingDistribution #-}

-- | The streaming distribution's configuration information.
usdStreamingDistributionConfig :: Lens' UpdateStreamingDistribution StreamingDistributionConfig
usdStreamingDistributionConfig =
    lens _usdStreamingDistributionConfig
         (\s a -> s { _usdStreamingDistributionConfig = a })
{-# INLINE usdStreamingDistributionConfig #-}

-- | The streaming distribution's id.
usdId :: Lens' UpdateStreamingDistribution Text
usdId = lens _usdId (\s a -> s { _usdId = a })
{-# INLINE usdId #-}

-- | The value of the ETag header you received when retrieving the streaming
-- distribution's configuration. For example: E2QWRUHAPOMQZL.
usdIfMatch :: Lens' UpdateStreamingDistribution (Maybe Text)
usdIfMatch = lens _usdIfMatch (\s a -> s { _usdIfMatch = a })
{-# INLINE usdIfMatch #-}

instance ToPath UpdateStreamingDistribution where
    toPath UpdateStreamingDistribution{..} = mconcat
        [ "/2014-05-31/streaming-distribution/"
        , toBS _usdId
        , "/config"
        ]

instance ToQuery UpdateStreamingDistribution

instance ToHeaders UpdateStreamingDistribution where
    toHeaders UpdateStreamingDistribution{..} = concat
        [ "If-Match" =: _usdIfMatch
        ]

instance ToXML UpdateStreamingDistribution where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "UpdateStreamingDistributionRequest"

-- | The returned result of the corresponding request.
data UpdateStreamingDistributionResponse = UpdateStreamingDistributionResponse
    { _usdrsStreamingDistribution :: Maybe StreamingDistribution
    , _usdrsETag :: Maybe Text
    } deriving (Show, Generic)

-- | The streaming distribution's information.
usdrsStreamingDistribution :: Lens' UpdateStreamingDistributionResponse (Maybe StreamingDistribution)
usdrsStreamingDistribution =
    lens _usdrsStreamingDistribution
         (\s a -> s { _usdrsStreamingDistribution = a })
{-# INLINE usdrsStreamingDistribution #-}

-- | The current version of the configuration. For example: E2QWRUHAPOMQZL.
usdrsETag :: Lens' UpdateStreamingDistributionResponse (Maybe Text)
usdrsETag = lens _usdrsETag (\s a -> s { _usdrsETag = a })
{-# INLINE usdrsETag #-}

instance AWSRequest UpdateStreamingDistribution where
    type Sv UpdateStreamingDistribution = CloudFront
    type Rs UpdateStreamingDistribution = UpdateStreamingDistributionResponse

    request = put
    response _ = cursorResponse $ \hs xml ->
        pure UpdateStreamingDistributionResponse
            <*> xml %|? "StreamingDistribution"
            <*> hs ~:? "ETag"
