{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Route53.V2013_04_01.DeleteHealthCheck
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | This action deletes a health check. To delete a health check, send a DELETE
-- request to the 2013-04-01/healthcheck/health check ID resource. You can
-- delete a health check only if there are no resource record sets associated
-- with this health check. If resource record sets are associated with this
-- health check, you must disassociate them before you can delete your health
-- check. If you try to delete a health check that is associated with resource
-- record sets, Route 53 will deny your request with a HealthCheckInUse error.
-- For information about disassociating the records from your health check,
-- see ChangeResourceRecordSets.
module Network.AWS.Route53.V2013_04_01.DeleteHealthCheck
    (
    -- * Request
      DeleteHealthCheck
    -- ** Request constructor
    , mkDeleteHealthCheck
    -- ** Request lenses
    , dhcHealthCheckId

    -- * Response
    , DeleteHealthCheckResponse
    ) where

import Network.AWS.Request.RestXML
import Network.AWS.Route53.V2013_04_01.Types
import Network.AWS.Prelude
import Network.AWS.Types (Region)

-- | A complex type containing the request information for delete health check.
newtype DeleteHealthCheck = DeleteHealthCheck
    { _dhcHealthCheckId :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DeleteHealthCheck' request.
mkDeleteHealthCheck :: Text -- ^ 'dhcHealthCheckId'
                    -> DeleteHealthCheck
mkDeleteHealthCheck p1 = DeleteHealthCheck
    { _dhcHealthCheckId = p1
    }
{-# INLINE mkDeleteHealthCheck #-}

-- | The ID of the health check to delete.
dhcHealthCheckId :: Lens' DeleteHealthCheck Text
dhcHealthCheckId =
    lens _dhcHealthCheckId (\s a -> s { _dhcHealthCheckId = a })
{-# INLINE dhcHealthCheckId #-}

instance ToPath DeleteHealthCheck where
    toPath DeleteHealthCheck{..} = mconcat
        [ "/2013-04-01/healthcheck/"
        , toBS _dhcHealthCheckId
        ]

instance ToQuery DeleteHealthCheck

instance ToHeaders DeleteHealthCheck

instance ToXML DeleteHealthCheck where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "DeleteHealthCheckRequest"

-- | Empty response for the request.
    deriving (Eq, Show, Generic)

instance AWSRequest DeleteHealthCheck where
    type Sv DeleteHealthCheck = Route53
    type Rs DeleteHealthCheck = DeleteHealthCheckResponse

    request = delete
    response _ = nullaryResponse DeleteHealthCheckResponse
