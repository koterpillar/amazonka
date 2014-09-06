{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.ElasticBeanstalk.V2010_12_01.DescribeApplicationVersions
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns descriptions for existing application versions.
-- https://elasticbeanstalk.us-east-1.amazon.com/?ApplicationName=SampleApp
-- &Operation=DescribeApplicationVersions &AuthParams amazonaws.com sample.war
-- Version1 description SampleApp 2010-11-17T03:21:59.161Z
-- 2010-11-17T03:21:59.161Z 773cd80a-f26c-11df-8a78-9f77047e0d0c.
module Network.AWS.ElasticBeanstalk.V2010_12_01.DescribeApplicationVersions
    (
    -- * Request
      DescribeApplicationVersions
    -- ** Request constructor
    , mkDescribeApplicationVersions
    -- ** Request lenses
    , dav1ApplicationName
    , dav1VersionLabels

    -- * Response
    , DescribeApplicationVersionsResponse
    -- ** Response lenses
    , davrsApplicationVersions
    ) where

import Network.AWS.Request.Query
import Network.AWS.ElasticBeanstalk.V2010_12_01.Types
import Network.AWS.Prelude

-- | Result message containing a list of configuration descriptions.
data DescribeApplicationVersions = DescribeApplicationVersions
    { _dav1ApplicationName :: Maybe Text
    , _dav1VersionLabels :: [Text]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeApplicationVersions' request.
mkDescribeApplicationVersions :: DescribeApplicationVersions
mkDescribeApplicationVersions = DescribeApplicationVersions
    { _dav1ApplicationName = Nothing
    , _dav1VersionLabels = mempty
    }
{-# INLINE mkDescribeApplicationVersions #-}

-- | If specified, AWS Elastic Beanstalk restricts the returned descriptions to
-- only include ones that are associated with the specified application.
dav1ApplicationName :: Lens' DescribeApplicationVersions (Maybe Text)
dav1ApplicationName =
    lens _dav1ApplicationName (\s a -> s { _dav1ApplicationName = a })
{-# INLINE dav1ApplicationName #-}

-- | If specified, restricts the returned descriptions to only include ones that
-- have the specified version labels.
dav1VersionLabels :: Lens' DescribeApplicationVersions [Text]
dav1VersionLabels =
    lens _dav1VersionLabels (\s a -> s { _dav1VersionLabels = a })
{-# INLINE dav1VersionLabels #-}

instance ToQuery DescribeApplicationVersions where
    toQuery = genericQuery def

-- | Result message wrapping a list of application version descriptions.
newtype DescribeApplicationVersionsResponse = DescribeApplicationVersionsResponse
    { _davrsApplicationVersions :: [ApplicationVersionDescription]
    } deriving (Show, Generic)

-- | A list of ApplicationVersionDescription .
davrsApplicationVersions :: Lens' DescribeApplicationVersionsResponse [ApplicationVersionDescription]
davrsApplicationVersions =
    lens _davrsApplicationVersions
         (\s a -> s { _davrsApplicationVersions = a })
{-# INLINE davrsApplicationVersions #-}

instance FromXML DescribeApplicationVersionsResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest DescribeApplicationVersions where
    type Sv DescribeApplicationVersions = ElasticBeanstalk
    type Rs DescribeApplicationVersions = DescribeApplicationVersionsResponse

    request = post "DescribeApplicationVersions"
    response _ = xmlResponse
