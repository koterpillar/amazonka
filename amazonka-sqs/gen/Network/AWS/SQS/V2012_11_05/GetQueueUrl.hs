{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.SQS.V2012_11_05.GetQueueUrl
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns the URL of an existing queue. This action provides a simple way to
-- retrieve the URL of an Amazon SQS queue. To access a queue that belongs to
-- another AWS account, use the QueueOwnerAWSAccountId parameter to specify
-- the account ID of the queue's owner. The queue's owner must grant you
-- permission to access the queue. For more information about shared queue
-- access, see AddPermission or go to Shared Queues in the Amazon SQS
-- Developer Guide. The following example Query request gets the URL for the
-- specified queue. http://sqs.us-east-1.amazonaws.com/ ?Action=GetQueueUrl
-- &QueueName=testQueue &Version=2011-10-01 &SignatureMethod=HmacSHA256
-- &Expires=2011-10-24T22%3A52%3A43PST &AWSAccessKeyId=AKIAIOSFODNN7EXAMPLE
-- &SignatureVersion=2 &Signature=Dqlp3Sd6ljTUA9Uf6SGtEExwUQEXAMPLE
-- http://&useast1-query;/123456789012/testQueue
-- 470a6f13-2ed9-4181-ad8a-2fdea142988e.
module Network.AWS.SQS.V2012_11_05.GetQueueUrl
    (
    -- * Request
      GetQueueUrl
    -- ** Request constructor
    , mkGetQueueUrl
    -- ** Request lenses
    , gquQueueName
    , gquQueueOwnerAWSAccountId

    -- * Response
    , GetQueueUrlResponse
    -- ** Response lenses
    , gqursQueueUrl
    ) where

import Network.AWS.Request.Query
import Network.AWS.SQS.V2012_11_05.Types
import Network.AWS.Prelude

-- | 
data GetQueueUrl = GetQueueUrl
    { _gquQueueName :: Text
    , _gquQueueOwnerAWSAccountId :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'GetQueueUrl' request.
mkGetQueueUrl :: Text -- ^ 'gquQueueName'
              -> GetQueueUrl
mkGetQueueUrl p1 = GetQueueUrl
    { _gquQueueName = p1
    , _gquQueueOwnerAWSAccountId = Nothing
    }
{-# INLINE mkGetQueueUrl #-}

-- | The name of the queue whose URL must be fetched. Maximum 80 characters;
-- alphanumeric characters, hyphens (-), and underscores (_) are allowed.
gquQueueName :: Lens' GetQueueUrl Text
gquQueueName = lens _gquQueueName (\s a -> s { _gquQueueName = a })
{-# INLINE gquQueueName #-}

-- | The AWS account ID of the account that created the queue.
gquQueueOwnerAWSAccountId :: Lens' GetQueueUrl (Maybe Text)
gquQueueOwnerAWSAccountId =
    lens _gquQueueOwnerAWSAccountId
         (\s a -> s { _gquQueueOwnerAWSAccountId = a })
{-# INLINE gquQueueOwnerAWSAccountId #-}

instance ToQuery GetQueueUrl where
    toQuery = genericQuery def

-- | For more information, see Responses in the Amazon SQS Developer Guide.
newtype GetQueueUrlResponse = GetQueueUrlResponse
    { _gqursQueueUrl :: Maybe Text
    } deriving (Show, Generic)

-- | The URL for the queue.
gqursQueueUrl :: Lens' GetQueueUrlResponse (Maybe Text)
gqursQueueUrl = lens _gqursQueueUrl (\s a -> s { _gqursQueueUrl = a })
{-# INLINE gqursQueueUrl #-}

instance FromXML GetQueueUrlResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest GetQueueUrl where
    type Sv GetQueueUrl = SQS
    type Rs GetQueueUrl = GetQueueUrlResponse

    request = post "GetQueueUrl"
    response _ = xmlResponse
