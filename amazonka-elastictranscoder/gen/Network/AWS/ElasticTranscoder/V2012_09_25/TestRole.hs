{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.ElasticTranscoder.V2012_09_25.TestRole
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | The TestRole operation tests the IAM role used to create the pipeline. The
-- TestRole action lets you determine whether the IAM role you are using has
-- sufficient permissions to let Elastic Transcoder perform tasks associated
-- with the transcoding process. The action attempts to assume the specified
-- IAM role, checks read access to the input and output buckets, and tries to
-- send a test notification to Amazon SNS topics that you specify. POST
-- /2012-09-25/roleTests HTTP/1.1 Content-Type: application/json;
-- charset=UTF-8 Accept: */* Host: elastictranscoder.[Elastic
-- Transcoder-endpoint].amazonaws.com:443 x-amz-date: 20130114T174952Z
-- Authorization: AWS4-HMAC-SHA256
-- Credential=[access-key-id]/[request-date]/[Elastic
-- Transcoder-endpoint]/ets/aws4_request,
-- SignedHeaders=host;x-amz-date;x-amz-target,
-- Signature=[calculated-signature] Content-Length:
-- [number-of-characters-in-JSON-string] {
-- "InputBucket":"salesoffice.example.com-source",
-- "OutputBucket":"salesoffice.example.com-public-promos",
-- "Role":"arn:aws:iam::123456789012:role/transcode-service", "Topics":
-- ["arn:aws:sns:us-east-1:111222333444:ETS_Errors",
-- "arn:aws:sns:us-east-1:111222333444:ETS_Progressing"] } Status: 200 OK
-- x-amzn-RequestId: c321ec43-378e-11e2-8e4c-4d5b971203e9 Content-Type:
-- application/json Content-Length: [number-of-characters-in-response] Date:
-- Mon, 14 Jan 2013 06:01:47 GMT { "Messages":[ "The role
-- arn:aws:iam::123456789012:role/transcode-service does not have access to
-- the bucket: salesoffice.example.com-source", "The role
-- arn:aws:iam::123456789012:role/transcode-service does not have access to
-- the topic: arn:aws:sns:us-east-1:111222333444:ETS_Errors" ], "Success":
-- "false" }.
module Network.AWS.ElasticTranscoder.V2012_09_25.TestRole
    (
    -- * Request
      TestRole
    -- ** Request constructor
    , mkTestRole
    -- ** Request lenses
    , trRole
    , trInputBucket
    , trOutputBucket
    , trTopics

    -- * Response
    , TestRoleResponse
    -- ** Response lenses
    , trrsSuccess
    , trrsMessages
    ) where

import           Network.AWS.ElasticTranscoder.V2012_09_25.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | The TestRoleRequest structure.
data TestRole = TestRole
    { _trRole :: Text
    , _trInputBucket :: Text
    , _trOutputBucket :: Text
    , _trTopics :: [Text]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'TestRole' request.
mkTestRole :: Text -- ^ 'trRole'
           -> Text -- ^ 'trInputBucket'
           -> Text -- ^ 'trOutputBucket'
           -> [Text] -- ^ 'trTopics'
           -> TestRole
mkTestRole p1 p2 p3 p4 = TestRole
    { _trRole = p1
    , _trInputBucket = p2
    , _trOutputBucket = p3
    , _trTopics = p4
    }
{-# INLINE mkTestRole #-}

-- | The IAM Amazon Resource Name (ARN) for the role that you want Elastic
-- Transcoder to test.
trRole :: Lens' TestRole Text
trRole = lens _trRole (\s a -> s { _trRole = a })
{-# INLINE trRole #-}

-- | The Amazon S3 bucket that contains media files to be transcoded. The action
-- attempts to read from this bucket.
trInputBucket :: Lens' TestRole Text
trInputBucket = lens _trInputBucket (\s a -> s { _trInputBucket = a })
{-# INLINE trInputBucket #-}

-- | The Amazon S3 bucket that Elastic Transcoder will write transcoded media
-- files to. The action attempts to read from this bucket.
trOutputBucket :: Lens' TestRole Text
trOutputBucket = lens _trOutputBucket (\s a -> s { _trOutputBucket = a })
{-# INLINE trOutputBucket #-}

-- | The ARNs of one or more Amazon Simple Notification Service (Amazon SNS)
-- topics that you want the action to send a test notification to.
trTopics :: Lens' TestRole [Text]
trTopics = lens _trTopics (\s a -> s { _trTopics = a })
{-# INLINE trTopics #-}

instance ToPath TestRole where
    toPath = const "/2012-09-25/roleTests"

instance ToQuery TestRole

instance ToHeaders TestRole

instance ToJSON TestRole

-- | The TestRoleResponse structure.
data TestRoleResponse = TestRoleResponse
    { _trrsSuccess :: Maybe Text
    , _trrsMessages :: [Text]
    } deriving (Show, Generic)

-- | If the operation is successful, this value is true; otherwise, the value is
-- false.
trrsSuccess :: Lens' TestRoleResponse (Maybe Text)
trrsSuccess = lens _trrsSuccess (\s a -> s { _trrsSuccess = a })
{-# INLINE trrsSuccess #-}

-- | If the Success element contains false, this value is an array of one or
-- more error messages that were generated during the test process.
trrsMessages :: Lens' TestRoleResponse [Text]
trrsMessages = lens _trrsMessages (\s a -> s { _trrsMessages = a })
{-# INLINE trrsMessages #-}

instance FromJSON TestRoleResponse

instance AWSRequest TestRole where
    type Sv TestRole = ElasticTranscoder
    type Rs TestRole = TestRoleResponse

    request = post
    response _ = jsonResponse
