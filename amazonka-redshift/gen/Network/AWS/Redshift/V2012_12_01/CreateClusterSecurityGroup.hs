{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Redshift.V2012_12_01.CreateClusterSecurityGroup
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Creates a new Amazon Redshift security group. You use security groups to
-- control access to non-VPC clusters. For information about managing security
-- groups, go to Amazon Redshift Cluster Security Groups in the Amazon
-- Redshift Management Guide. https://redshift.us-east-1.amazonaws.com/
-- ?Action=CreateClusterSecurityGroup &ClusterSecurityGroupName=securitygroup1
-- &Description=my security group &Version=2012-12-01
-- &x-amz-algorithm=AWS4-HMAC-SHA256
-- &x-amz-credential=AKIAIOSFODNN7EXAMPLE/20130123/us-east-1/redshift/aws4_request
-- &x-amz-date=20130123T005817Z
-- &x-amz-signedheaders=content-type;host;x-amz-date my security group
-- securitygroup1 f9ee270f-64f7-11e2-a8da-655adc216806.
module Network.AWS.Redshift.V2012_12_01.CreateClusterSecurityGroup
    (
    -- * Request
      CreateClusterSecurityGroup
    -- ** Request constructor
    , mkCreateClusterSecurityGroup
    -- ** Request lenses
    , ccsgClusterSecurityGroupName
    , ccsgDescription

    -- * Response
    , CreateClusterSecurityGroupResponse
    -- ** Response lenses
    , ccsgrsClusterSecurityGroup
    ) where

import Network.AWS.Request.Query
import Network.AWS.Redshift.V2012_12_01.Types
import Network.AWS.Prelude

-- | ???.
data CreateClusterSecurityGroup = CreateClusterSecurityGroup
    { _ccsgClusterSecurityGroupName :: Text
    , _ccsgDescription :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'CreateClusterSecurityGroup' request.
mkCreateClusterSecurityGroup :: Text -- ^ 'ccsgClusterSecurityGroupName'
                             -> Text -- ^ 'ccsgDescription'
                             -> CreateClusterSecurityGroup
mkCreateClusterSecurityGroup p1 p2 = CreateClusterSecurityGroup
    { _ccsgClusterSecurityGroupName = p1
    , _ccsgDescription = p2
    }
{-# INLINE mkCreateClusterSecurityGroup #-}

-- | The name for the security group. Amazon Redshift stores the value as a
-- lowercase string. Constraints: Must contain no more than 255 alphanumeric
-- characters or hyphens. Must not be "Default". Must be unique for all
-- security groups that are created by your AWS account. Example:
-- examplesecuritygroup.
ccsgClusterSecurityGroupName :: Lens' CreateClusterSecurityGroup Text
ccsgClusterSecurityGroupName =
    lens _ccsgClusterSecurityGroupName
         (\s a -> s { _ccsgClusterSecurityGroupName = a })
{-# INLINE ccsgClusterSecurityGroupName #-}

-- | A description for the security group.
ccsgDescription :: Lens' CreateClusterSecurityGroup Text
ccsgDescription = lens _ccsgDescription (\s a -> s { _ccsgDescription = a })
{-# INLINE ccsgDescription #-}

instance ToQuery CreateClusterSecurityGroup where
    toQuery = genericQuery def

newtype CreateClusterSecurityGroupResponse = CreateClusterSecurityGroupResponse
    { _ccsgrsClusterSecurityGroup :: Maybe ClusterSecurityGroup
    } deriving (Show, Generic)

-- | Describes a security group.
ccsgrsClusterSecurityGroup :: Lens' CreateClusterSecurityGroupResponse (Maybe ClusterSecurityGroup)
ccsgrsClusterSecurityGroup =
    lens _ccsgrsClusterSecurityGroup
         (\s a -> s { _ccsgrsClusterSecurityGroup = a })
{-# INLINE ccsgrsClusterSecurityGroup #-}

instance FromXML CreateClusterSecurityGroupResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest CreateClusterSecurityGroup where
    type Sv CreateClusterSecurityGroup = Redshift
    type Rs CreateClusterSecurityGroup = CreateClusterSecurityGroupResponse

    request = post "CreateClusterSecurityGroup"
    response _ = xmlResponse
