{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.S3.V2006_03_01.DeleteBucketWebsite
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | This operation removes the website configuration from the bucket.
module Network.AWS.S3.V2006_03_01.DeleteBucketWebsite
    (
    -- * Request
      DeleteBucketWebsite
    -- ** Request constructor
    , mkDeleteBucketWebsite
    -- ** Request lenses
    , dbwBucket

    -- * Response
    , DeleteBucketWebsiteResponse
    ) where

import Network.AWS.Request.RestS3
import Network.AWS.S3.V2006_03_01.Types
import Network.AWS.Prelude
import Network.AWS.Types (Region)

newtype DeleteBucketWebsite = DeleteBucketWebsite
    { _dbwBucket :: BucketName
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DeleteBucketWebsite' request.
mkDeleteBucketWebsite :: BucketName -- ^ 'dbwBucket'
                      -> DeleteBucketWebsite
mkDeleteBucketWebsite p1 = DeleteBucketWebsite
    { _dbwBucket = p1
    }
{-# INLINE mkDeleteBucketWebsite #-}

dbwBucket :: Lens' DeleteBucketWebsite BucketName
dbwBucket = lens _dbwBucket (\s a -> s { _dbwBucket = a })
{-# INLINE dbwBucket #-}

instance ToPath DeleteBucketWebsite where
    toPath DeleteBucketWebsite{..} = mconcat
        [ "/"
        , toBS _dbwBucket
        ]

instance ToQuery DeleteBucketWebsite where
    toQuery DeleteBucketWebsite{..} = mconcat
        [ "website"
        ]

instance ToHeaders DeleteBucketWebsite

instance ToBody DeleteBucketWebsite

data DeleteBucketWebsiteResponse = DeleteBucketWebsiteResponse
    deriving (Eq, Show, Generic)

instance AWSRequest DeleteBucketWebsite where
    type Sv DeleteBucketWebsite = S3
    type Rs DeleteBucketWebsite = DeleteBucketWebsiteResponse

    request = delete
    response _ = nullaryResponse DeleteBucketWebsiteResponse
