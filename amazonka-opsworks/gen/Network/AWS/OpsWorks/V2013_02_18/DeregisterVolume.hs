{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.OpsWorks.V2013_02_18.DeregisterVolume
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deregisters an Amazon EBS volume. The volume can then be registered by
-- another stack. For more information, see Resource Management. Required
-- Permissions: To use this action, an IAM user must have a Manage permissions
-- level for the stack, or an attached policy that explicitly grants
-- permissions. For more information on user permissions, see Managing User
-- Permissions.
module Network.AWS.OpsWorks.V2013_02_18.DeregisterVolume
    (
    -- * Request
      DeregisterVolume
    -- ** Request constructor
    , mkDeregisterVolume
    -- ** Request lenses
    , dvVolumeId

    -- * Response
    , DeregisterVolumeResponse
    ) where

import           Network.AWS.OpsWorks.V2013_02_18.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

newtype DeregisterVolume = DeregisterVolume
    { _dvVolumeId :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DeregisterVolume' request.
mkDeregisterVolume :: Text -- ^ 'dvVolumeId'
                   -> DeregisterVolume
mkDeregisterVolume p1 = DeregisterVolume
    { _dvVolumeId = p1
    }
{-# INLINE mkDeregisterVolume #-}

-- | The volume ID.
dvVolumeId :: Lens' DeregisterVolume Text
dvVolumeId = lens _dvVolumeId (\s a -> s { _dvVolumeId = a })
{-# INLINE dvVolumeId #-}

instance ToPath DeregisterVolume

instance ToQuery DeregisterVolume

instance ToHeaders DeregisterVolume

instance ToJSON DeregisterVolume

data DeregisterVolumeResponse = DeregisterVolumeResponse
    deriving (Eq, Show, Generic)

instance AWSRequest DeregisterVolume where
    type Sv DeregisterVolume = OpsWorks
    type Rs DeregisterVolume = DeregisterVolumeResponse

    request = get
    response _ = nullaryResponse DeregisterVolumeResponse
