{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.S3.V2006_03_01.PutBucketLifecycle
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Sets lifecycle configuration for your bucket. If a lifecycle configuration
-- exists, it replaces it.
module Network.AWS.S3.V2006_03_01.PutBucketLifecycle
    (
    -- * Request
      PutBucketLifecycle
    -- ** Request constructor
    , mkPutBucketLifecycle
    -- ** Request lenses
    , pblBucket
    , pblContentMD5
    , pblLifecycleConfiguration

    -- * Response
    , PutBucketLifecycleResponse
    ) where

import Network.AWS.Request.RestS3
import Network.AWS.S3.V2006_03_01.Types
import Network.AWS.Prelude
import Network.AWS.Types (Region)

data PutBucketLifecycle = PutBucketLifecycle
    { _pblBucket :: BucketName
    , _pblContentMD5 :: Maybe Text
    , _pblLifecycleConfiguration :: Maybe LifecycleConfiguration
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'PutBucketLifecycle' request.
mkPutBucketLifecycle :: BucketName -- ^ 'pblBucket'
                     -> PutBucketLifecycle
mkPutBucketLifecycle p1 = PutBucketLifecycle
    { _pblBucket = p1
    , _pblContentMD5 = Nothing
    , _pblLifecycleConfiguration = Nothing
    }
{-# INLINE mkPutBucketLifecycle #-}

pblBucket :: Lens' PutBucketLifecycle BucketName
pblBucket = lens _pblBucket (\s a -> s { _pblBucket = a })
{-# INLINE pblBucket #-}

pblContentMD5 :: Lens' PutBucketLifecycle (Maybe Text)
pblContentMD5 = lens _pblContentMD5 (\s a -> s { _pblContentMD5 = a })
{-# INLINE pblContentMD5 #-}

pblLifecycleConfiguration :: Lens' PutBucketLifecycle (Maybe LifecycleConfiguration)
pblLifecycleConfiguration =
    lens _pblLifecycleConfiguration
         (\s a -> s { _pblLifecycleConfiguration = a })
{-# INLINE pblLifecycleConfiguration #-}

instance ToPath PutBucketLifecycle where
    toPath PutBucketLifecycle{..} = mconcat
        [ "/"
        , toBS _pblBucket
        ]

instance ToQuery PutBucketLifecycle where
    toQuery PutBucketLifecycle{..} = mconcat
        [ "lifecycle"
        ]

instance ToHeaders PutBucketLifecycle where
    toHeaders PutBucketLifecycle{..} = concat
        [ "Content-MD5" =: _pblContentMD5
        ]

instance ToBody PutBucketLifecycle where
    toBody = toBody . encodeXML . _pblLifecycleConfiguration

data PutBucketLifecycleResponse = PutBucketLifecycleResponse
    deriving (Eq, Show, Generic)

instance AWSRequest PutBucketLifecycle where
    type Sv PutBucketLifecycle = S3
    type Rs PutBucketLifecycle = PutBucketLifecycleResponse

    request = put
    response _ = nullaryResponse PutBucketLifecycleResponse
