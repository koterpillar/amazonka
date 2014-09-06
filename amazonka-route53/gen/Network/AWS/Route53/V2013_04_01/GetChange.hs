{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Route53.V2013_04_01.GetChange
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | This action returns the current status of a change batch request. The
-- status is one of the following values: - PENDING indicates that the changes
-- in this request have not replicated to all Route 53 DNS servers. This is
-- the initial status of all change batch requests. - INSYNC indicates that
-- the changes have replicated to all Amazon Route 53 DNS servers.
module Network.AWS.Route53.V2013_04_01.GetChange
    (
    -- * Request
      GetChange
    -- ** Request constructor
    , mkGetChange
    -- ** Request lenses
    , gcId

    -- * Response
    , GetChangeResponse
    -- ** Response lenses
    , gcrsChangeInfo
    ) where

import Network.AWS.Request.RestXML
import Network.AWS.Route53.V2013_04_01.Types
import Network.AWS.Prelude
import Network.AWS.Types (Region)

-- | The input for a GetChange request.
newtype GetChange = GetChange
    { _gcId :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'GetChange' request.
mkGetChange :: Text -- ^ 'gcId'
            -> GetChange
mkGetChange p1 = GetChange
    { _gcId = p1
    }
{-# INLINE mkGetChange #-}

-- | The ID of the change batch request. The value that you specify here is the
-- value that ChangeResourceRecordSets returned in the Id element when you
-- submitted the request.
gcId :: Lens' GetChange Text
gcId = lens _gcId (\s a -> s { _gcId = a })
{-# INLINE gcId #-}

instance ToPath GetChange where
    toPath GetChange{..} = mconcat
        [ "/2013-04-01/change/"
        , toBS _gcId
        ]

instance ToQuery GetChange

instance ToHeaders GetChange

instance ToXML GetChange where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "GetChangeRequest"

-- | A complex type that contains the ChangeInfo element.
newtype GetChangeResponse = GetChangeResponse
    { _gcrsChangeInfo :: ChangeInfo
    } deriving (Show, Generic)

-- | A complex type that contains information about the specified change batch,
-- including the change batch ID, the status of the change, and the date and
-- time of the request.
gcrsChangeInfo :: Lens' GetChangeResponse ChangeInfo
gcrsChangeInfo = lens _gcrsChangeInfo (\s a -> s { _gcrsChangeInfo = a })
{-# INLINE gcrsChangeInfo #-}

instance FromXML GetChangeResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest GetChange where
    type Sv GetChange = Route53
    type Rs GetChange = GetChangeResponse

    request = get
    response _ = xmlResponse
