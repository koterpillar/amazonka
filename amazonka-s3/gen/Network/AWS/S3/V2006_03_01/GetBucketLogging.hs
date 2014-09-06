{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.S3.V2006_03_01.GetBucketLogging
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns the logging status of a bucket and the permissions users have to
-- view and modify that status. To use GET, you must be the bucket owner.
module Network.AWS.S3.V2006_03_01.GetBucketLogging
    (
    -- * Request
      GetBucketLogging
    -- ** Request constructor
    , mkGetBucketLogging
    -- ** Request lenses
    , gbl2Bucket

    -- * Response
    , GetBucketLoggingResponse
    -- ** Response lenses
    , gblrs1LoggingEnabled
    ) where

import Network.AWS.Request.RestS3
import Network.AWS.S3.V2006_03_01.Types
import Network.AWS.Prelude
import Network.AWS.Types (Region)

newtype GetBucketLogging = GetBucketLogging
    { _gbl2Bucket :: BucketName
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'GetBucketLogging' request.
mkGetBucketLogging :: BucketName -- ^ 'gbl2Bucket'
                   -> GetBucketLogging
mkGetBucketLogging p1 = GetBucketLogging
    { _gbl2Bucket = p1
    }
{-# INLINE mkGetBucketLogging #-}

gbl2Bucket :: Lens' GetBucketLogging BucketName
gbl2Bucket = lens _gbl2Bucket (\s a -> s { _gbl2Bucket = a })
{-# INLINE gbl2Bucket #-}

instance ToPath GetBucketLogging where
    toPath GetBucketLogging{..} = mconcat
        [ "/"
        , toBS _gbl2Bucket
        ]

instance ToQuery GetBucketLogging where
    toQuery GetBucketLogging{..} = mconcat
        [ "logging"
        ]

instance ToHeaders GetBucketLogging

instance ToBody GetBucketLogging

newtype GetBucketLoggingResponse = GetBucketLoggingResponse
    { _gblrs1LoggingEnabled :: Maybe LoggingEnabled
    } deriving (Show, Generic)

gblrs1LoggingEnabled :: Lens' GetBucketLoggingResponse (Maybe LoggingEnabled)
gblrs1LoggingEnabled =
    lens _gblrs1LoggingEnabled (\s a -> s { _gblrs1LoggingEnabled = a })
{-# INLINE gblrs1LoggingEnabled #-}

instance FromXML GetBucketLoggingResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest GetBucketLogging where
    type Sv GetBucketLogging = S3
    type Rs GetBucketLogging = GetBucketLoggingResponse

    request = get
    response _ = xmlResponse
