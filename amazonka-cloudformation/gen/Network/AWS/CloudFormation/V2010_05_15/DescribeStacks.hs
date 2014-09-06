{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudFormation.V2010_05_15.DescribeStacks
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns the description for the specified stack; if no stack name was
-- specified, then it returns the description for all the stacks created.
-- https://cloudformation.us-east-1.amazonaws.com/ ?Action=DescribeStacks
-- &StackName=MyStack &Version=2010-05-15 &SignatureVersion=2
-- &Timestamp=2010-07-27T22%3A26%3A28.000Z &AWSAccessKeyId=[AWS Access KeyID]
-- &Signature=[Signature] MyStack
-- arn:aws:cloudformation:us-east-1:123456789:stack/MyStack/aaf549a0-a413-11df-adb3-5081b3858e83
-- 2010-07-27T22:28:28Z CREATE_COMPLETE false StartPage
-- http://my-load-balancer.amazonaws.com:80/index.html.
module Network.AWS.CloudFormation.V2010_05_15.DescribeStacks
    (
    -- * Request
      DescribeStacks
    -- ** Request constructor
    , mkDescribeStacks
    -- ** Request lenses
    , ds1StackName
    , ds1NextToken

    -- * Response
    , DescribeStacksResponse
    -- ** Response lenses
    , dsrsStacks
    , dsrsNextToken
    ) where

import Network.AWS.Request.Query
import Network.AWS.CloudFormation.V2010_05_15.Types
import Network.AWS.Prelude

-- | The input for DescribeStacks action.
data DescribeStacks = DescribeStacks
    { _ds1StackName :: Maybe Text
    , _ds1NextToken :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeStacks' request.
mkDescribeStacks :: DescribeStacks
mkDescribeStacks = DescribeStacks
    { _ds1StackName = Nothing
    , _ds1NextToken = Nothing
    }
{-# INLINE mkDescribeStacks #-}

-- | The name or the unique identifier associated with the stack, which are not
-- always interchangeable: Running stacks: You can specify either the stack's
-- name or its unique stack ID. Deleted stacks: You must specify the unique
-- stack ID. Default: There is no default value.
ds1StackName :: Lens' DescribeStacks (Maybe Text)
ds1StackName = lens _ds1StackName (\s a -> s { _ds1StackName = a })
{-# INLINE ds1StackName #-}

-- | String that identifies the start of the next list of stacks, if there is
-- one.
ds1NextToken :: Lens' DescribeStacks (Maybe Text)
ds1NextToken = lens _ds1NextToken (\s a -> s { _ds1NextToken = a })
{-# INLINE ds1NextToken #-}

instance ToQuery DescribeStacks where
    toQuery = genericQuery def

-- | The output for a DescribeStacks action.
data DescribeStacksResponse = DescribeStacksResponse
    { _dsrsStacks :: [Stack]
    , _dsrsNextToken :: Maybe Text
    } deriving (Show, Generic)

-- | A list of stack structures.
dsrsStacks :: Lens' DescribeStacksResponse [Stack]
dsrsStacks = lens _dsrsStacks (\s a -> s { _dsrsStacks = a })
{-# INLINE dsrsStacks #-}

-- | String that identifies the start of the next list of stacks, if there is
-- one.
dsrsNextToken :: Lens' DescribeStacksResponse (Maybe Text)
dsrsNextToken = lens _dsrsNextToken (\s a -> s { _dsrsNextToken = a })
{-# INLINE dsrsNextToken #-}

instance FromXML DescribeStacksResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest DescribeStacks where
    type Sv DescribeStacks = CloudFormation
    type Rs DescribeStacks = DescribeStacksResponse

    request = post "DescribeStacks"
    response _ = xmlResponse

instance AWSPager DescribeStacks where
    next rq rs = (\x -> rq { _ds1NextToken = Just x })
        <$> (_dsrsNextToken rs)
