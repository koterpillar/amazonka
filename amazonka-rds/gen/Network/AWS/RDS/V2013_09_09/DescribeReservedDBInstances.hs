{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.RDS.V2013_09_09.DescribeReservedDBInstances
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns information about reserved DB instances for this account, or about
-- a specified reserved DB instance. https://rds.amazonaws.com/
-- ?Action=DescribeReservedDBInstances
-- &ReservedDBInstanceId=customerSpecifiedID &SignatureVersion=2
-- &SignatureMethod=HmacSHA256 &Timestamp=2012-12-18T18%3A31%3A36.118Z
-- &AWSAccessKeyId= &Signature= Medium Utilization USD mysql
-- 649fd0c8-cf6d-47a0-bfa6-060f8e75e95f false active myreservationid 1
-- 2010-12-15T00:25:14.131Z 31536000 227.5 0.046 db.m1.small
-- c695119b-2961-11e1-bd06-6fe008f046c3.
module Network.AWS.RDS.V2013_09_09.DescribeReservedDBInstances
    (
    -- * Request
      DescribeReservedDBInstances
    -- ** Request constructor
    , mkDescribeReservedDBInstances
    -- ** Request lenses
    , drdbiReservedDBInstanceId
    , drdbiReservedDBInstancesOfferingId
    , drdbiDBInstanceClass
    , drdbiDuration
    , drdbiProductDescription
    , drdbiOfferingType
    , drdbiMultiAZ
    , drdbiMaxRecords
    , drdbiMarker

    -- * Response
    , DescribeReservedDBInstancesResponse
    -- ** Response lenses
    , drdbirsMarker
    , drdbirsReservedDBInstances
    ) where

import Network.AWS.Request.Query
import Network.AWS.RDS.V2013_09_09.Types
import Network.AWS.Prelude

-- | 
data DescribeReservedDBInstances = DescribeReservedDBInstances
    { _drdbiReservedDBInstanceId :: Maybe Text
    , _drdbiReservedDBInstancesOfferingId :: Maybe Text
    , _drdbiDBInstanceClass :: Maybe Text
    , _drdbiDuration :: Maybe Text
    , _drdbiProductDescription :: Maybe Text
    , _drdbiOfferingType :: Maybe Text
    , _drdbiMultiAZ :: Maybe Bool
    , _drdbiMaxRecords :: Maybe Integer
    , _drdbiMarker :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeReservedDBInstances' request.
mkDescribeReservedDBInstances :: DescribeReservedDBInstances
mkDescribeReservedDBInstances = DescribeReservedDBInstances
    { _drdbiReservedDBInstanceId = Nothing
    , _drdbiReservedDBInstancesOfferingId = Nothing
    , _drdbiDBInstanceClass = Nothing
    , _drdbiDuration = Nothing
    , _drdbiProductDescription = Nothing
    , _drdbiOfferingType = Nothing
    , _drdbiMultiAZ = Nothing
    , _drdbiMaxRecords = Nothing
    , _drdbiMarker = Nothing
    }
{-# INLINE mkDescribeReservedDBInstances #-}

-- | The reserved DB instance identifier filter value. Specify this parameter to
-- show only the reservation that matches the specified reservation ID.
drdbiReservedDBInstanceId :: Lens' DescribeReservedDBInstances (Maybe Text)
drdbiReservedDBInstanceId =
    lens _drdbiReservedDBInstanceId
         (\s a -> s { _drdbiReservedDBInstanceId = a })
{-# INLINE drdbiReservedDBInstanceId #-}

-- | The offering identifier filter value. Specify this parameter to show only
-- purchased reservations matching the specified offering identifier.
drdbiReservedDBInstancesOfferingId :: Lens' DescribeReservedDBInstances (Maybe Text)
drdbiReservedDBInstancesOfferingId =
    lens _drdbiReservedDBInstancesOfferingId
         (\s a -> s { _drdbiReservedDBInstancesOfferingId = a })
{-# INLINE drdbiReservedDBInstancesOfferingId #-}

-- | The DB instance class filter value. Specify this parameter to show only
-- those reservations matching the specified DB instances class.
drdbiDBInstanceClass :: Lens' DescribeReservedDBInstances (Maybe Text)
drdbiDBInstanceClass =
    lens _drdbiDBInstanceClass (\s a -> s { _drdbiDBInstanceClass = a })
{-# INLINE drdbiDBInstanceClass #-}

-- | The duration filter value, specified in years or seconds. Specify this
-- parameter to show only reservations for this duration. Valid Values: 1 | 3
-- | 31536000 | 94608000.
drdbiDuration :: Lens' DescribeReservedDBInstances (Maybe Text)
drdbiDuration = lens _drdbiDuration (\s a -> s { _drdbiDuration = a })
{-# INLINE drdbiDuration #-}

-- | The product description filter value. Specify this parameter to show only
-- those reservations matching the specified product description.
drdbiProductDescription :: Lens' DescribeReservedDBInstances (Maybe Text)
drdbiProductDescription =
    lens _drdbiProductDescription
         (\s a -> s { _drdbiProductDescription = a })
{-# INLINE drdbiProductDescription #-}

-- | The offering type filter value. Specify this parameter to show only the
-- available offerings matching the specified offering type. Valid Values:
-- "Light Utilization" | "Medium Utilization" | "Heavy Utilization".
drdbiOfferingType :: Lens' DescribeReservedDBInstances (Maybe Text)
drdbiOfferingType =
    lens _drdbiOfferingType (\s a -> s { _drdbiOfferingType = a })
{-# INLINE drdbiOfferingType #-}

-- | The Multi-AZ filter value. Specify this parameter to show only those
-- reservations matching the specified Multi-AZ parameter.
drdbiMultiAZ :: Lens' DescribeReservedDBInstances (Maybe Bool)
drdbiMultiAZ = lens _drdbiMultiAZ (\s a -> s { _drdbiMultiAZ = a })
{-# INLINE drdbiMultiAZ #-}

-- | The maximum number of records to include in the response. If more than the
-- MaxRecords value is available, a pagination token called a marker is
-- included in the response so that the following results can be retrieved.
-- Default: 100 Constraints: minimum 20, maximum 100.
drdbiMaxRecords :: Lens' DescribeReservedDBInstances (Maybe Integer)
drdbiMaxRecords = lens _drdbiMaxRecords (\s a -> s { _drdbiMaxRecords = a })
{-# INLINE drdbiMaxRecords #-}

-- | An optional pagination token provided by a previous request. If this
-- parameter is specified, the response includes only records beyond the
-- marker, up to the value specified by MaxRecords.
drdbiMarker :: Lens' DescribeReservedDBInstances (Maybe Text)
drdbiMarker = lens _drdbiMarker (\s a -> s { _drdbiMarker = a })
{-# INLINE drdbiMarker #-}

instance ToQuery DescribeReservedDBInstances where
    toQuery = genericQuery def

-- | Contains the result of a successful invocation of the
-- DescribeReservedDBInstances action.
data DescribeReservedDBInstancesResponse = DescribeReservedDBInstancesResponse
    { _drdbirsMarker :: Maybe Text
    , _drdbirsReservedDBInstances :: [ReservedDBInstance]
    } deriving (Show, Generic)

-- | An optional pagination token provided by a previous request. If this
-- parameter is specified, the response includes only records beyond the
-- marker, up to the value specified by MaxRecords.
drdbirsMarker :: Lens' DescribeReservedDBInstancesResponse (Maybe Text)
drdbirsMarker = lens _drdbirsMarker (\s a -> s { _drdbirsMarker = a })
{-# INLINE drdbirsMarker #-}

-- | A list of reserved DB instances.
drdbirsReservedDBInstances :: Lens' DescribeReservedDBInstancesResponse [ReservedDBInstance]
drdbirsReservedDBInstances =
    lens _drdbirsReservedDBInstances
         (\s a -> s { _drdbirsReservedDBInstances = a })
{-# INLINE drdbirsReservedDBInstances #-}

instance FromXML DescribeReservedDBInstancesResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest DescribeReservedDBInstances where
    type Sv DescribeReservedDBInstances = RDS
    type Rs DescribeReservedDBInstances = DescribeReservedDBInstancesResponse

    request = post "DescribeReservedDBInstances"
    response _ = xmlResponse

instance AWSPager DescribeReservedDBInstances where
    next rq rs = (\x -> rq { _drdbiMarker = Just x })
        <$> (_drdbirsMarker rs)
