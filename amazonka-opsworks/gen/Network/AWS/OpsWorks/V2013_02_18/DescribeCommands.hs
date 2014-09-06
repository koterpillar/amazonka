{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.OpsWorks.V2013_02_18.DescribeCommands
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Describes the results of specified commands. You must specify at least one
-- of the parameters. Required Permissions: To use this action, an IAM user
-- must have a Show, Deploy, or Manage permissions level for the stack, or an
-- attached policy that explicitly grants permissions. For more information on
-- user permissions, see Managing User Permissions.
module Network.AWS.OpsWorks.V2013_02_18.DescribeCommands
    (
    -- * Request
      DescribeCommands
    -- ** Request constructor
    , mkDescribeCommands
    -- ** Request lenses
    , dc1DeploymentId
    , dc1InstanceId
    , dc1CommandIds

    -- * Response
    , DescribeCommandsResponse
    -- ** Response lenses
    , dcrsCommands
    ) where

import           Network.AWS.OpsWorks.V2013_02_18.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

data DescribeCommands = DescribeCommands
    { _dc1DeploymentId :: Maybe Text
    , _dc1InstanceId :: Maybe Text
    , _dc1CommandIds :: [Text]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeCommands' request.
mkDescribeCommands :: DescribeCommands
mkDescribeCommands = DescribeCommands
    { _dc1DeploymentId = Nothing
    , _dc1InstanceId = Nothing
    , _dc1CommandIds = mempty
    }
{-# INLINE mkDescribeCommands #-}

-- | The deployment ID. If you include this parameter, DescribeCommands returns
-- a description of the commands associated with the specified deployment.
dc1DeploymentId :: Lens' DescribeCommands (Maybe Text)
dc1DeploymentId = lens _dc1DeploymentId (\s a -> s { _dc1DeploymentId = a })
{-# INLINE dc1DeploymentId #-}

-- | The instance ID. If you include this parameter, DescribeCommands returns a
-- description of the commands associated with the specified instance.
dc1InstanceId :: Lens' DescribeCommands (Maybe Text)
dc1InstanceId = lens _dc1InstanceId (\s a -> s { _dc1InstanceId = a })
{-# INLINE dc1InstanceId #-}

-- | An array of command IDs. If you include this parameter, DescribeCommands
-- returns a description of the specified commands. Otherwise, it returns a
-- description of every command.
dc1CommandIds :: Lens' DescribeCommands [Text]
dc1CommandIds = lens _dc1CommandIds (\s a -> s { _dc1CommandIds = a })
{-# INLINE dc1CommandIds #-}

instance ToPath DescribeCommands

instance ToQuery DescribeCommands

instance ToHeaders DescribeCommands

instance ToJSON DescribeCommands

-- | Contains the response to a DescribeCommands request.
newtype DescribeCommandsResponse = DescribeCommandsResponse
    { _dcrsCommands :: [Command]
    } deriving (Show, Generic)

-- | An array of Command objects that describe each of the specified commands.
dcrsCommands :: Lens' DescribeCommandsResponse [Command]
dcrsCommands = lens _dcrsCommands (\s a -> s { _dcrsCommands = a })
{-# INLINE dcrsCommands #-}

instance FromJSON DescribeCommandsResponse

instance AWSRequest DescribeCommands where
    type Sv DescribeCommands = OpsWorks
    type Rs DescribeCommands = DescribeCommandsResponse

    request = get
    response _ = jsonResponse
