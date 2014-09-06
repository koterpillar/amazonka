{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.ElastiCache.V2014_07_15.CopySnapshot
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | The CopySnapshot operation makes a copy of an existing snapshot.
module Network.AWS.ElastiCache.V2014_07_15.CopySnapshot
    (
    -- * Request
      CopySnapshot
    -- ** Request constructor
    , mkCopySnapshot
    -- ** Request lenses
    , csSourceSnapshotName
    , csTargetSnapshotName

    -- * Response
    , CopySnapshotResponse
    -- ** Response lenses
    , csrsSnapshot
    ) where

import Network.AWS.Request.Query
import Network.AWS.ElastiCache.V2014_07_15.Types
import Network.AWS.Prelude

-- | Represents the input of a CopySnapshotMessage operation.
data CopySnapshot = CopySnapshot
    { _csSourceSnapshotName :: Text
    , _csTargetSnapshotName :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'CopySnapshot' request.
mkCopySnapshot :: Text -- ^ 'csSourceSnapshotName'
               -> Text -- ^ 'csTargetSnapshotName'
               -> CopySnapshot
mkCopySnapshot p1 p2 = CopySnapshot
    { _csSourceSnapshotName = p1
    , _csTargetSnapshotName = p2
    }
{-# INLINE mkCopySnapshot #-}

-- | The name of an existing snapshot from which to copy.
csSourceSnapshotName :: Lens' CopySnapshot Text
csSourceSnapshotName =
    lens _csSourceSnapshotName (\s a -> s { _csSourceSnapshotName = a })
{-# INLINE csSourceSnapshotName #-}

-- | A name for the copied snapshot.
csTargetSnapshotName :: Lens' CopySnapshot Text
csTargetSnapshotName =
    lens _csTargetSnapshotName (\s a -> s { _csTargetSnapshotName = a })
{-# INLINE csTargetSnapshotName #-}

instance ToQuery CopySnapshot where
    toQuery = genericQuery def

newtype CopySnapshotResponse = CopySnapshotResponse
    { _csrsSnapshot :: Maybe Snapshot
    } deriving (Show, Generic)

-- | Represents a copy of an entire cache cluster as of the time when the
-- snapshot was taken.
csrsSnapshot :: Lens' CopySnapshotResponse (Maybe Snapshot)
csrsSnapshot = lens _csrsSnapshot (\s a -> s { _csrsSnapshot = a })
{-# INLINE csrsSnapshot #-}

instance FromXML CopySnapshotResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest CopySnapshot where
    type Sv CopySnapshot = ElastiCache
    type Rs CopySnapshot = CopySnapshotResponse

    request = post "CopySnapshot"
    response _ = xmlResponse
