{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.OpsWorks.V2013_02_18.RegisterVolume
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Registers an Amazon EBS volume with a specified stack. A volume can be
-- registered with only one stack at a time. If the volume is already
-- registered, you must first deregister it by calling DeregisterVolume. For
-- more information, see Resource Management. Required Permissions: To use
-- this action, an IAM user must have a Manage permissions level for the
-- stack, or an attached policy that explicitly grants permissions. For more
-- information on user permissions, see Managing User Permissions.
module Network.AWS.OpsWorks.V2013_02_18.RegisterVolume
    (
    -- * Request
      RegisterVolume
    -- ** Request constructor
    , mkRegisterVolume
    -- ** Request lenses
    , rvEc2VolumeId
    , rvStackId

    -- * Response
    , RegisterVolumeResponse
    -- ** Response lenses
    , rvrsVolumeId
    ) where

import           Network.AWS.OpsWorks.V2013_02_18.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

data RegisterVolume = RegisterVolume
    { _rvEc2VolumeId :: Maybe Text
    , _rvStackId :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'RegisterVolume' request.
mkRegisterVolume :: Text -- ^ 'rvStackId'
                 -> RegisterVolume
mkRegisterVolume p2 = RegisterVolume
    { _rvEc2VolumeId = Nothing
    , _rvStackId = p2
    }
{-# INLINE mkRegisterVolume #-}

-- | The Amazon EBS volume ID.
rvEc2VolumeId :: Lens' RegisterVolume (Maybe Text)
rvEc2VolumeId = lens _rvEc2VolumeId (\s a -> s { _rvEc2VolumeId = a })
{-# INLINE rvEc2VolumeId #-}

-- | The stack ID.
rvStackId :: Lens' RegisterVolume Text
rvStackId = lens _rvStackId (\s a -> s { _rvStackId = a })
{-# INLINE rvStackId #-}

instance ToPath RegisterVolume

instance ToQuery RegisterVolume

instance ToHeaders RegisterVolume

instance ToJSON RegisterVolume

-- | Contains the response to a RegisterVolume request.
newtype RegisterVolumeResponse = RegisterVolumeResponse
    { _rvrsVolumeId :: Maybe Text
    } deriving (Show, Generic)

-- | The volume ID.
rvrsVolumeId :: Lens' RegisterVolumeResponse (Maybe Text)
rvrsVolumeId = lens _rvrsVolumeId (\s a -> s { _rvrsVolumeId = a })
{-# INLINE rvrsVolumeId #-}

instance FromJSON RegisterVolumeResponse

instance AWSRequest RegisterVolume where
    type Sv RegisterVolume = OpsWorks
    type Rs RegisterVolume = RegisterVolumeResponse

    request = get
    response _ = jsonResponse
