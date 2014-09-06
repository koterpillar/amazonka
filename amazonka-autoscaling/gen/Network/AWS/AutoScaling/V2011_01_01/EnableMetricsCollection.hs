{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.AutoScaling.V2011_01_01.EnableMetricsCollection
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Enables monitoring of group metrics for the Auto Scaling group specified in
-- AutoScalingGroupName. You can specify the list of enabled metrics with the
-- Metrics parameter. Auto Scaling metrics collection can be turned on only if
-- the InstanceMonitoring flag, in the Auto Scaling group's launch
-- configuration, is set to True.
module Network.AWS.AutoScaling.V2011_01_01.EnableMetricsCollection
    (
    -- * Request
      EnableMetricsCollection
    -- ** Request constructor
    , mkEnableMetricsCollection
    -- ** Request lenses
    , emcAutoScalingGroupName
    , emcMetrics
    , emcGranularity

    -- * Response
    , EnableMetricsCollectionResponse
    ) where

import Network.AWS.Request.Query
import Network.AWS.AutoScaling.V2011_01_01.Types
import Network.AWS.Prelude

-- | 
data EnableMetricsCollection = EnableMetricsCollection
    { _emcAutoScalingGroupName :: Text
    , _emcMetrics :: [Text]
    , _emcGranularity :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'EnableMetricsCollection' request.
mkEnableMetricsCollection :: Text -- ^ 'emcAutoScalingGroupName'
                          -> Text -- ^ 'emcGranularity'
                          -> EnableMetricsCollection
mkEnableMetricsCollection p1 p3 = EnableMetricsCollection
    { _emcAutoScalingGroupName = p1
    , _emcMetrics = mempty
    , _emcGranularity = p3
    }
{-# INLINE mkEnableMetricsCollection #-}

-- | The name or ARN of the Auto Scaling group.
emcAutoScalingGroupName :: Lens' EnableMetricsCollection Text
emcAutoScalingGroupName =
    lens _emcAutoScalingGroupName
         (\s a -> s { _emcAutoScalingGroupName = a })
{-# INLINE emcAutoScalingGroupName #-}

-- | The list of metrics to collect. If no metrics are specified, all metrics
-- are enabled. The following metrics are supported: GroupMinSize GroupMaxSize
-- GroupDesiredCapacity GroupInServiceInstances GroupPendingInstances
-- GroupStandbyInstances GroupTerminatingInstances GroupTotalInstances The
-- GroupStandbyInstances metric is not returned by default. You must
-- explicitly request it when calling EnableMetricsCollection.
emcMetrics :: Lens' EnableMetricsCollection [Text]
emcMetrics = lens _emcMetrics (\s a -> s { _emcMetrics = a })
{-# INLINE emcMetrics #-}

-- | The granularity to associate with the metrics to collect. Currently, the
-- only legal granularity is "1Minute".
emcGranularity :: Lens' EnableMetricsCollection Text
emcGranularity = lens _emcGranularity (\s a -> s { _emcGranularity = a })
{-# INLINE emcGranularity #-}

instance ToQuery EnableMetricsCollection where
    toQuery = genericQuery def

data EnableMetricsCollectionResponse = EnableMetricsCollectionResponse
    deriving (Eq, Show, Generic)

instance AWSRequest EnableMetricsCollection where
    type Sv EnableMetricsCollection = AutoScaling
    type Rs EnableMetricsCollection = EnableMetricsCollectionResponse

    request = post "EnableMetricsCollection"
    response _ = nullaryResponse EnableMetricsCollectionResponse
