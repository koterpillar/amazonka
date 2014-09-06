{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.SQS.V2012_11_05.ListDeadLetterSourceQueues
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns a list of your queues that have the RedrivePolicy queue attribute
-- configured with a dead letter queue. The following example Query request
-- returns a list of dead letter source queues. In this example only one
-- source queue, MySourceQueue, was configured with a dead letter queue.
-- Action=ListDeadLetterSourceQueues &Version=2012-11-05
-- http://sqs.us-east-1.amazonaws.com/123456789012/MySourceQueue
-- 8ffb921f-b85e-53d9-abcf-d8d0057f38fc For more information about using dead
-- letter queues, see Using Amazon SQS Dead Letter Queues.
module Network.AWS.SQS.V2012_11_05.ListDeadLetterSourceQueues
    (
    -- * Request
      ListDeadLetterSourceQueues
    -- ** Request constructor
    , mkListDeadLetterSourceQueues
    -- ** Request lenses
    , ldlsqQueueUrl

    -- * Response
    , ListDeadLetterSourceQueuesResponse
    -- ** Response lenses
    , ldlsqrsQueueUrls
    ) where

import Network.AWS.Request.Query
import Network.AWS.SQS.V2012_11_05.Types
import Network.AWS.Prelude

-- | 
newtype ListDeadLetterSourceQueues = ListDeadLetterSourceQueues
    { _ldlsqQueueUrl :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'ListDeadLetterSourceQueues' request.
mkListDeadLetterSourceQueues :: Text -- ^ 'ldlsqQueueUrl'
                             -> ListDeadLetterSourceQueues
mkListDeadLetterSourceQueues p1 = ListDeadLetterSourceQueues
    { _ldlsqQueueUrl = p1
    }
{-# INLINE mkListDeadLetterSourceQueues #-}

-- | The queue URL of a dead letter queue.
ldlsqQueueUrl :: Lens' ListDeadLetterSourceQueues Text
ldlsqQueueUrl = lens _ldlsqQueueUrl (\s a -> s { _ldlsqQueueUrl = a })
{-# INLINE ldlsqQueueUrl #-}

instance ToQuery ListDeadLetterSourceQueues where
    toQuery = genericQuery def

-- | A list of your dead letter source queues.
newtype ListDeadLetterSourceQueuesResponse = ListDeadLetterSourceQueuesResponse
    { _ldlsqrsQueueUrls :: [Text]
    } deriving (Show, Generic)

-- | A list of source queue URLs that have the RedrivePolicy queue attribute
-- configured with a dead letter queue.
ldlsqrsQueueUrls :: Lens' ListDeadLetterSourceQueuesResponse [Text]
ldlsqrsQueueUrls =
    lens _ldlsqrsQueueUrls (\s a -> s { _ldlsqrsQueueUrls = a })
{-# INLINE ldlsqrsQueueUrls #-}

instance FromXML ListDeadLetterSourceQueuesResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest ListDeadLetterSourceQueues where
    type Sv ListDeadLetterSourceQueues = SQS
    type Rs ListDeadLetterSourceQueues = ListDeadLetterSourceQueuesResponse

    request = post "ListDeadLetterSourceQueues"
    response _ = xmlResponse
