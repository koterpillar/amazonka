{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.AutoScaling.V2011_01_01.UpdateAutoScalingGroup
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Updates the configuration for the specified AutoScalingGroup. To update an
-- Auto Scaling group with a launch configuration that has the
-- InstanceMonitoring flag set to False, you must first ensure that collection
-- of group metrics is disabled. Otherwise, calls to UpdateAutoScalingGroup
-- will fail. If you have previously enabled group metrics collection, you can
-- disable collection of all group metrics by calling
-- DisableMetricsCollection. The new settings are registered upon the
-- completion of this call. Any launch configuration settings take effect on
-- any triggers after this call returns. Scaling activities that are currently
-- in progress aren't affected. If a new value is specified for MinSize
-- without specifying the value for DesiredCapacity, and if the new MinSize is
-- larger than the current size of the Auto Scaling Group, there will be an
-- implicit call to SetDesiredCapacity to set the group to the new MinSize. If
-- a new value is specified for MaxSize without specifying the value for
-- DesiredCapacity, and the new MaxSize is smaller than the current size of
-- the Auto Scaling Group, there will be an implicit call to
-- SetDesiredCapacity to set the group to the new MaxSize. All other optional
-- parameters are left unchanged if not passed in the request. Update existing
-- Auto Scaling group with ELB health check
-- https://autoscaling.amazonaws.com/?HealthCheckType=ELB
-- &HealthCheckGracePeriod=300 &AutoScalingGroupName=my-test-asg-lbs
-- &Version=2011-01-01 &Action=UpdateAutoScalingGroup &AUTHPARAMS
-- adafead0-ab8a-11e2-ba13-ab0ccEXAMPLE Update existing Auto Scaling group
-- with a new Availability Zone
-- https://autoscaling.amazonaws.com/?AutoScalingGroupName=my-test-asg-lbs
-- &AvailabilityZones.member.1=us-east-1a
-- &AvailabilityZones.member.2=us-east-1b
-- &AvailabilityZones.member.3=us-east-1c &MinSize=3 &Version=2011-01-01
-- &Action=UpdateAutoScalingGroup &AUTHPARAMS
-- adafead0-ab8a-11e2-ba13-ab0ccEXAMPLE.
module Network.AWS.AutoScaling.V2011_01_01.UpdateAutoScalingGroup
    (
    -- * Request
      UpdateAutoScalingGroup
    -- ** Request constructor
    , mkUpdateAutoScalingGroup
    -- ** Request lenses
    , uasgAutoScalingGroupName
    , uasgLaunchConfigurationName
    , uasgMinSize
    , uasgMaxSize
    , uasgDesiredCapacity
    , uasgDefaultCooldown
    , uasgAvailabilityZones
    , uasgHealthCheckType
    , uasgHealthCheckGracePeriod
    , uasgPlacementGroup
    , uasgVPCZoneIdentifier
    , uasgTerminationPolicies

    -- * Response
    , UpdateAutoScalingGroupResponse
    ) where

import Network.AWS.Request.Query
import Network.AWS.AutoScaling.V2011_01_01.Types
import Network.AWS.Prelude

-- | 
data UpdateAutoScalingGroup = UpdateAutoScalingGroup
    { _uasgAutoScalingGroupName :: Text
    , _uasgLaunchConfigurationName :: Maybe Text
    , _uasgMinSize :: Maybe Integer
    , _uasgMaxSize :: Maybe Integer
    , _uasgDesiredCapacity :: Maybe Integer
    , _uasgDefaultCooldown :: Maybe Integer
    , _uasgAvailabilityZones :: Maybe [Text]
    , _uasgHealthCheckType :: Maybe Text
    , _uasgHealthCheckGracePeriod :: Maybe Integer
    , _uasgPlacementGroup :: Maybe Text
    , _uasgVPCZoneIdentifier :: Maybe Text
    , _uasgTerminationPolicies :: [Text]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'UpdateAutoScalingGroup' request.
mkUpdateAutoScalingGroup :: Text -- ^ 'uasgAutoScalingGroupName'
                         -> UpdateAutoScalingGroup
mkUpdateAutoScalingGroup p1 = UpdateAutoScalingGroup
    { _uasgAutoScalingGroupName = p1
    , _uasgLaunchConfigurationName = Nothing
    , _uasgMinSize = Nothing
    , _uasgMaxSize = Nothing
    , _uasgDesiredCapacity = Nothing
    , _uasgDefaultCooldown = Nothing
    , _uasgAvailabilityZones = Nothing
    , _uasgHealthCheckType = Nothing
    , _uasgHealthCheckGracePeriod = Nothing
    , _uasgPlacementGroup = Nothing
    , _uasgVPCZoneIdentifier = Nothing
    , _uasgTerminationPolicies = mempty
    }
{-# INLINE mkUpdateAutoScalingGroup #-}

-- | The name of the Auto Scaling group.
uasgAutoScalingGroupName :: Lens' UpdateAutoScalingGroup Text
uasgAutoScalingGroupName =
    lens _uasgAutoScalingGroupName
         (\s a -> s { _uasgAutoScalingGroupName = a })
{-# INLINE uasgAutoScalingGroupName #-}

-- | The name of the launch configuration.
uasgLaunchConfigurationName :: Lens' UpdateAutoScalingGroup (Maybe Text)
uasgLaunchConfigurationName =
    lens _uasgLaunchConfigurationName
         (\s a -> s { _uasgLaunchConfigurationName = a })
{-# INLINE uasgLaunchConfigurationName #-}

-- | The minimum size of the Auto Scaling group.
uasgMinSize :: Lens' UpdateAutoScalingGroup (Maybe Integer)
uasgMinSize = lens _uasgMinSize (\s a -> s { _uasgMinSize = a })
{-# INLINE uasgMinSize #-}

-- | The maximum size of the Auto Scaling group.
uasgMaxSize :: Lens' UpdateAutoScalingGroup (Maybe Integer)
uasgMaxSize = lens _uasgMaxSize (\s a -> s { _uasgMaxSize = a })
{-# INLINE uasgMaxSize #-}

-- | The desired capacity for the Auto Scaling group.
uasgDesiredCapacity :: Lens' UpdateAutoScalingGroup (Maybe Integer)
uasgDesiredCapacity =
    lens _uasgDesiredCapacity (\s a -> s { _uasgDesiredCapacity = a })
{-# INLINE uasgDesiredCapacity #-}

-- | The amount of time, in seconds, after a scaling activity completes before
-- any further scaling activities can start. For more information, see
-- Cooldown Period.
uasgDefaultCooldown :: Lens' UpdateAutoScalingGroup (Maybe Integer)
uasgDefaultCooldown =
    lens _uasgDefaultCooldown (\s a -> s { _uasgDefaultCooldown = a })
{-# INLINE uasgDefaultCooldown #-}

-- | Availability Zones for the group.
uasgAvailabilityZones :: Lens' UpdateAutoScalingGroup (Maybe [Text])
uasgAvailabilityZones =
    lens _uasgAvailabilityZones (\s a -> s { _uasgAvailabilityZones = a })
{-# INLINE uasgAvailabilityZones #-}

-- | The type of health check for the instances in the Auto Scaling group. The
-- health check type can either be EC2 for Amazon EC2 or ELB for Elastic Load
-- Balancing.
uasgHealthCheckType :: Lens' UpdateAutoScalingGroup (Maybe Text)
uasgHealthCheckType =
    lens _uasgHealthCheckType (\s a -> s { _uasgHealthCheckType = a })
{-# INLINE uasgHealthCheckType #-}

-- | The length of time that Auto Scaling waits before checking an instance's
-- health status. The grace period begins when the instance passes System
-- Status and the Instance Status checks from Amazon EC2. For more
-- information, see DescribeInstanceStatus.
uasgHealthCheckGracePeriod :: Lens' UpdateAutoScalingGroup (Maybe Integer)
uasgHealthCheckGracePeriod =
    lens _uasgHealthCheckGracePeriod
         (\s a -> s { _uasgHealthCheckGracePeriod = a })
{-# INLINE uasgHealthCheckGracePeriod #-}

-- | The name of the cluster placement group, if applicable. For more
-- information, go to Using Cluster Instances in the Amazon EC2 User Guide.
uasgPlacementGroup :: Lens' UpdateAutoScalingGroup (Maybe Text)
uasgPlacementGroup =
    lens _uasgPlacementGroup (\s a -> s { _uasgPlacementGroup = a })
{-# INLINE uasgPlacementGroup #-}

-- | The subnet identifier for the Amazon VPC connection, if applicable. You can
-- specify several subnets in a comma-separated list. When you specify
-- VPCZoneIdentifier with AvailabilityZones, ensure that the subnets'
-- Availability Zones match the values you specify for AvailabilityZones. For
-- more information on creating your Auto Scaling group in Amazon VPC by
-- specifying subnets, see Launch Auto Scaling Instances into Amazon VPC in
-- the the Auto Scaling Developer Guide.
uasgVPCZoneIdentifier :: Lens' UpdateAutoScalingGroup (Maybe Text)
uasgVPCZoneIdentifier =
    lens _uasgVPCZoneIdentifier (\s a -> s { _uasgVPCZoneIdentifier = a })
{-# INLINE uasgVPCZoneIdentifier #-}

-- | A standalone termination policy or a list of termination policies used to
-- select the instance to terminate. The policies are executed in the order
-- that they are listed. For more information on creating a termination policy
-- for your Auto Scaling group, go to Instance Termination Policy for Your
-- Auto Scaling Group in the the Auto Scaling Developer Guide.
uasgTerminationPolicies :: Lens' UpdateAutoScalingGroup [Text]
uasgTerminationPolicies =
    lens _uasgTerminationPolicies
         (\s a -> s { _uasgTerminationPolicies = a })
{-# INLINE uasgTerminationPolicies #-}

instance ToQuery UpdateAutoScalingGroup where
    toQuery = genericQuery def

data UpdateAutoScalingGroupResponse = UpdateAutoScalingGroupResponse
    deriving (Eq, Show, Generic)

instance AWSRequest UpdateAutoScalingGroup where
    type Sv UpdateAutoScalingGroup = AutoScaling
    type Rs UpdateAutoScalingGroup = UpdateAutoScalingGroupResponse

    request = post "UpdateAutoScalingGroup"
    response _ = nullaryResponse UpdateAutoScalingGroupResponse
