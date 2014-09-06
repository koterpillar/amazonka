{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudSearch.V2013_01_01.BuildSuggesters
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Indexes the search suggestions.
module Network.AWS.CloudSearch.V2013_01_01.BuildSuggesters
    (
    -- * Request
      BuildSuggesters
    -- ** Request constructor
    , mkBuildSuggesters
    -- ** Request lenses
    , bsDomainName

    -- * Response
    , BuildSuggestersResponse
    -- ** Response lenses
    , bsrsFieldNames
    ) where

import Network.AWS.Request.Query
import Network.AWS.CloudSearch.V2013_01_01.Types
import Network.AWS.Prelude

-- | Container for the parameters to the BuildSuggester operation. Specifies the
-- name of the domain you want to update.
newtype BuildSuggesters = BuildSuggesters
    { _bsDomainName :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'BuildSuggesters' request.
mkBuildSuggesters :: Text -- ^ 'bsDomainName'
                  -> BuildSuggesters
mkBuildSuggesters p1 = BuildSuggesters
    { _bsDomainName = p1
    }
{-# INLINE mkBuildSuggesters #-}

-- | A string that represents the name of a domain. Domain names are unique
-- across the domains owned by an account within an AWS region. Domain names
-- start with a letter or number and can contain the following characters: a-z
-- (lowercase), 0-9, and - (hyphen).
bsDomainName :: Lens' BuildSuggesters Text
bsDomainName = lens _bsDomainName (\s a -> s { _bsDomainName = a })
{-# INLINE bsDomainName #-}

instance ToQuery BuildSuggesters where
    toQuery = genericQuery def

-- | The result of a BuildSuggester request. Contains a list of the fields used
-- for suggestions.
newtype BuildSuggestersResponse = BuildSuggestersResponse
    { _bsrsFieldNames :: [Text]
    } deriving (Show, Generic)

-- | A list of field names.
bsrsFieldNames :: Lens' BuildSuggestersResponse [Text]
bsrsFieldNames = lens _bsrsFieldNames (\s a -> s { _bsrsFieldNames = a })
{-# INLINE bsrsFieldNames #-}

instance FromXML BuildSuggestersResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest BuildSuggesters where
    type Sv BuildSuggesters = CloudSearch
    type Rs BuildSuggesters = BuildSuggestersResponse

    request = post "BuildSuggesters"
    response _ = xmlResponse
