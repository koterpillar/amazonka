{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.RDS.V2013_09_09.DescribeOptionGroupOptions
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Describes all available options. https://rds.amazonaws.com/
-- ?Action=DescribeOptionGroupOptions &EngineName=oracle-se1
-- &MajorEngineVersion=11.2 11.2 true Oracle Enterprise Manager 1158 OEM
-- oracle-se1 0.2.v3 false false d9c8f6a1-84c7-11e1-a264-0b23c28bc344.
module Network.AWS.RDS.V2013_09_09.DescribeOptionGroupOptions
    (
    -- * Request
      DescribeOptionGroupOptions
    -- ** Request constructor
    , mkDescribeOptionGroupOptions
    -- ** Request lenses
    , dogoEngineName
    , dogoMajorEngineVersion
    , dogoMaxRecords
    , dogoMarker

    -- * Response
    , DescribeOptionGroupOptionsResponse
    -- ** Response lenses
    , dogorsOptionGroupOptions
    , dogorsMarker
    ) where

import Network.AWS.Request.Query
import Network.AWS.RDS.V2013_09_09.Types
import Network.AWS.Prelude

-- | 
data DescribeOptionGroupOptions = DescribeOptionGroupOptions
    { _dogoEngineName :: Text
    , _dogoMajorEngineVersion :: Maybe Text
    , _dogoMaxRecords :: Maybe Integer
    , _dogoMarker :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeOptionGroupOptions' request.
mkDescribeOptionGroupOptions :: Text -- ^ 'dogoEngineName'
                             -> DescribeOptionGroupOptions
mkDescribeOptionGroupOptions p1 = DescribeOptionGroupOptions
    { _dogoEngineName = p1
    , _dogoMajorEngineVersion = Nothing
    , _dogoMaxRecords = Nothing
    , _dogoMarker = Nothing
    }
{-# INLINE mkDescribeOptionGroupOptions #-}

-- | A required parameter. Options available for the given Engine name will be
-- described.
dogoEngineName :: Lens' DescribeOptionGroupOptions Text
dogoEngineName = lens _dogoEngineName (\s a -> s { _dogoEngineName = a })
{-# INLINE dogoEngineName #-}

-- | If specified, filters the results to include only options for the specified
-- major engine version.
dogoMajorEngineVersion :: Lens' DescribeOptionGroupOptions (Maybe Text)
dogoMajorEngineVersion =
    lens _dogoMajorEngineVersion (\s a -> s { _dogoMajorEngineVersion = a })
{-# INLINE dogoMajorEngineVersion #-}

-- | The maximum number of records to include in the response. If more records
-- exist than the specified MaxRecords value, a pagination token called a
-- marker is included in the response so that the remaining results can be
-- retrieved. Default: 100 Constraints: minimum 20, maximum 100.
dogoMaxRecords :: Lens' DescribeOptionGroupOptions (Maybe Integer)
dogoMaxRecords = lens _dogoMaxRecords (\s a -> s { _dogoMaxRecords = a })
{-# INLINE dogoMaxRecords #-}

-- | An optional pagination token provided by a previous request. If this
-- parameter is specified, the response includes only records beyond the
-- marker, up to the value specified by MaxRecords.
dogoMarker :: Lens' DescribeOptionGroupOptions (Maybe Text)
dogoMarker = lens _dogoMarker (\s a -> s { _dogoMarker = a })
{-# INLINE dogoMarker #-}

instance ToQuery DescribeOptionGroupOptions where
    toQuery = genericQuery def

-- | 
data DescribeOptionGroupOptionsResponse = DescribeOptionGroupOptionsResponse
    { _dogorsOptionGroupOptions :: [OptionGroupOption]
    , _dogorsMarker :: Maybe Text
    } deriving (Show, Generic)

-- | List of available option group options.
dogorsOptionGroupOptions :: Lens' DescribeOptionGroupOptionsResponse [OptionGroupOption]
dogorsOptionGroupOptions =
    lens _dogorsOptionGroupOptions
         (\s a -> s { _dogorsOptionGroupOptions = a })
{-# INLINE dogorsOptionGroupOptions #-}

-- | An optional pagination token provided by a previous request. If this
-- parameter is specified, the response includes only records beyond the
-- marker, up to the value specified by MaxRecords.
dogorsMarker :: Lens' DescribeOptionGroupOptionsResponse (Maybe Text)
dogorsMarker = lens _dogorsMarker (\s a -> s { _dogorsMarker = a })
{-# INLINE dogorsMarker #-}

instance FromXML DescribeOptionGroupOptionsResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest DescribeOptionGroupOptions where
    type Sv DescribeOptionGroupOptions = RDS
    type Rs DescribeOptionGroupOptions = DescribeOptionGroupOptionsResponse

    request = post "DescribeOptionGroupOptions"
    response _ = xmlResponse

instance AWSPager DescribeOptionGroupOptions where
    next rq rs = (\x -> rq { _dogoMarker = Just x })
        <$> (_dogorsMarker rs)
