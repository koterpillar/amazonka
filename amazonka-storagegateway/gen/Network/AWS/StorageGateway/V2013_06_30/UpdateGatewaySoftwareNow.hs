{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.StorageGateway.V2013_06_30.UpdateGatewaySoftwareNow
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | This operation updates the gateway virtual machine (VM) software. The
-- request immediately triggers the software update. Before sending this
-- request, you should make sure all your applications have finished writing
-- to your gateway's storage volumes in order to avoid data loss. During the
-- update, applications cannot use the gateway's storage volumes. --> When you
-- make this request, you get a 200 OK success response immediately. However,
-- it might take some time for the update to complete. You can call
-- DescribeGatewayInformation to verify the gateway is in the STATE_RUNNING
-- state. A software update forces a system restart of your gateway. You can
-- minimize the chance of any disruption to your applications by increasing
-- your iSCSI Initiators' timeouts. For more information about increasing
-- iSCSI Initiator timeouts for Windows and Linux, see Customizing Your
-- Windows iSCSI Settings and Customizing Your Linux iSCSI Settings,
-- respectively. Example Request The following example shows a request that
-- initiates a gateway VM update. POST / HTTP/1.1 Host:
-- storagegateway.us-east-1.amazonaws.com x-amz-Date: 20120425T120000Z
-- Authorization: CSOC7TJPLR0OOKIRLGOHVAICUFVV4KQNSO5AEMVJF66Q9ASUAAJG
-- Content-type: application/x-amz-json-1.1 x-amz-target:
-- StorageGateway_20120630.UpdateGatewaySoftwareNow { "GatewayARN":
-- "arn:aws:storagegateway:us-east-1:111122223333:gateway/mygateway" }
-- HTTP/1.1 200 OK x-amzn-RequestId:
-- CSOC7TJPLR0OOKIRLGOHVAICUFVV4KQNSO5AEMVJF66Q9ASUAAJG Date: Wed, 25 Apr 2012
-- 12:00:02 GMT Content-type: application/x-amz-json-1.1 Content-length: 80 {
-- "GatewayARN":
-- "arn:aws:storagegateway:us-east-1:111122223333:gateway/mygateway" }.
module Network.AWS.StorageGateway.V2013_06_30.UpdateGatewaySoftwareNow
    (
    -- * Request
      UpdateGatewaySoftwareNow
    -- ** Request constructor
    , mkUpdateGatewaySoftwareNow
    -- ** Request lenses
    , ugsnGatewayARN

    -- * Response
    , UpdateGatewaySoftwareNowResponse
    -- ** Response lenses
    , ugsnrsGatewayARN
    ) where

import           Network.AWS.StorageGateway.V2013_06_30.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | A JSON object containing the of the gateway to update.
newtype UpdateGatewaySoftwareNow = UpdateGatewaySoftwareNow
    { _ugsnGatewayARN :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'UpdateGatewaySoftwareNow' request.
mkUpdateGatewaySoftwareNow :: Text -- ^ 'ugsnGatewayARN'
                           -> UpdateGatewaySoftwareNow
mkUpdateGatewaySoftwareNow p1 = UpdateGatewaySoftwareNow
    { _ugsnGatewayARN = p1
    }
{-# INLINE mkUpdateGatewaySoftwareNow #-}

-- | The Amazon Resource Name (ARN) of the gateway. Use the ListGateways
-- operation to return a list of gateways for your account and region.
ugsnGatewayARN :: Lens' UpdateGatewaySoftwareNow Text
ugsnGatewayARN = lens _ugsnGatewayARN (\s a -> s { _ugsnGatewayARN = a })
{-# INLINE ugsnGatewayARN #-}

instance ToPath UpdateGatewaySoftwareNow

instance ToQuery UpdateGatewaySoftwareNow

instance ToHeaders UpdateGatewaySoftwareNow

instance ToJSON UpdateGatewaySoftwareNow

-- | A JSON object containing the of the gateway that was updated.
newtype UpdateGatewaySoftwareNowResponse = UpdateGatewaySoftwareNowResponse
    { _ugsnrsGatewayARN :: Maybe Text
    } deriving (Show, Generic)

-- | The Amazon Resource Name (ARN) of the gateway. Use the ListGateways
-- operation to return a list of gateways for your account and region.
ugsnrsGatewayARN :: Lens' UpdateGatewaySoftwareNowResponse (Maybe Text)
ugsnrsGatewayARN =
    lens _ugsnrsGatewayARN (\s a -> s { _ugsnrsGatewayARN = a })
{-# INLINE ugsnrsGatewayARN #-}

instance FromJSON UpdateGatewaySoftwareNowResponse

instance AWSRequest UpdateGatewaySoftwareNow where
    type Sv UpdateGatewaySoftwareNow = StorageGateway
    type Rs UpdateGatewaySoftwareNow = UpdateGatewaySoftwareNowResponse

    request = get
    response _ = jsonResponse
