{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.V2014_06_15.AssociateAddress
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Associates an Elastic IP address with an instance or a network interface.
-- An Elastic IP address is for use in either the EC2-Classic platform or in a
-- VPC. For more information, see Elastic IP Addresses in the Amazon Elastic
-- Compute Cloud User Guide. [EC2-Classic, default VPC] If the Elastic IP
-- address is already associated with a different instance, it is
-- disassociated from that instance and associated with the specified
-- instance. [EC2-VPC] If you don't specify a private IP address, the Elastic
-- IP address is associated with the primary IP address. If the Elastic IP
-- address is already associated with a different instance or a network
-- interface, you get an error unless you allow reassociation. This is an
-- idempotent operation. If you perform the operation more than once, Amazon
-- EC2 doesn't return an error. Example for EC2-Classic This example request
-- associates an Elastic IP address with an instance in EC2-Classic.
-- https://ec2.amazonaws.com/?Action=AssociateAddress
-- &amp;InstanceId=i-2ea64347 &amp;PublicIp=192.0.2.1 &amp;AUTHPARAMS
-- &lt;AssociateAddressResponse
-- xmlns="http://ec2.amazonaws.com/doc/2013-10-01/"&gt;
-- &lt;requestId&gt;59dbff89-35bd-4eac-99ed-be587EXAMPLE&lt;/requestId&gt;
-- &lt;return&gt;true&lt;/return&gt; &lt;/AssociateAddressResponse&gt; Example
-- for EC2-VPC This example request associates a Elastic IP address with an
-- instance in a VPC. The AllowReassignment parameter allows the Elastic IP
-- address to be associated with the specified instance even if it's already
-- associated with a different instance or a network interface.
-- https://ec2.amazonaws.com/?Action=AssociateAddress
-- &amp;InstanceId=i-4fd2431a &amp;AllocationId=eipalloc-5723d13e
-- &amp;AllowReassignment=true &amp;AUTHPARAMS &lt;AssociateAddressResponse
-- xmlns="http://ec2.amazonaws.com/doc/2013-10-01/"&gt;
-- &lt;requestId&gt;59dbff89-35bd-4eac-99ed-be587EXAMPLE&lt;/requestId&gt;
-- &lt;return&gt;true&lt;/return&gt;
-- &lt;associationId&gt;eipassoc-fc5ca095&lt;/associationId&gt;
-- &lt;/AssociateAddressResponse&gt;.
module Network.AWS.EC2.V2014_06_15.AssociateAddress
    (
    -- * Request
      AssociateAddress
    -- ** Request constructor
    , mkAssociateAddress
    -- ** Request lenses
    , aa1InstanceId
    , aa1PublicIp
    , aa1AllocationId
    , aa1NetworkInterfaceId
    , aa1PrivateIpAddress
    , aa1AllowReassociation

    -- * Response
    , AssociateAddressResponse
    -- ** Response lenses
    , aarsrsAssociationId
    ) where

import Network.AWS.Request.Query
import Network.AWS.EC2.V2014_06_15.Types
import Network.AWS.Prelude

-- | 
data AssociateAddress = AssociateAddress
    { _aa1InstanceId :: Maybe Text
    , _aa1PublicIp :: Maybe Text
    , _aa1AllocationId :: Maybe Text
    , _aa1NetworkInterfaceId :: Maybe Text
    , _aa1PrivateIpAddress :: Maybe Text
    , _aa1AllowReassociation :: Maybe Bool
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'AssociateAddress' request.
mkAssociateAddress :: AssociateAddress
mkAssociateAddress = AssociateAddress
    { _aa1InstanceId = Nothing
    , _aa1PublicIp = Nothing
    , _aa1AllocationId = Nothing
    , _aa1NetworkInterfaceId = Nothing
    , _aa1PrivateIpAddress = Nothing
    , _aa1AllowReassociation = Nothing
    }
{-# INLINE mkAssociateAddress #-}

-- | The ID of the instance. The operation fails if you specify an instance ID
-- unless exactly one network interface is attached.
aa1InstanceId :: Lens' AssociateAddress (Maybe Text)
aa1InstanceId = lens _aa1InstanceId (\s a -> s { _aa1InstanceId = a })
{-# INLINE aa1InstanceId #-}

-- | The Elastic IP address.
aa1PublicIp :: Lens' AssociateAddress (Maybe Text)
aa1PublicIp = lens _aa1PublicIp (\s a -> s { _aa1PublicIp = a })
{-# INLINE aa1PublicIp #-}

-- | [EC2-VPC] The allocation ID. This is required for EC2-VPC.
aa1AllocationId :: Lens' AssociateAddress (Maybe Text)
aa1AllocationId = lens _aa1AllocationId (\s a -> s { _aa1AllocationId = a })
{-# INLINE aa1AllocationId #-}

-- | [EC2-VPC] The ID of the network interface. If the instance has more than
-- one network interface, you must specify a network interface ID.
aa1NetworkInterfaceId :: Lens' AssociateAddress (Maybe Text)
aa1NetworkInterfaceId =
    lens _aa1NetworkInterfaceId (\s a -> s { _aa1NetworkInterfaceId = a })
{-# INLINE aa1NetworkInterfaceId #-}

-- | [EC2-VPC] The primary or secondary private IP address to associate with the
-- Elastic IP address. If no private IP address is specified, the Elastic IP
-- address is associated with the primary private IP address.
aa1PrivateIpAddress :: Lens' AssociateAddress (Maybe Text)
aa1PrivateIpAddress =
    lens _aa1PrivateIpAddress (\s a -> s { _aa1PrivateIpAddress = a })
{-# INLINE aa1PrivateIpAddress #-}

-- | [EC2-VPC] Allows an Elastic IP address that is already associated with an
-- instance or network interface to be re-associated with the specified
-- instance or network interface. Otherwise, the operation fails. Default:
-- false.
aa1AllowReassociation :: Lens' AssociateAddress (Maybe Bool)
aa1AllowReassociation =
    lens _aa1AllowReassociation (\s a -> s { _aa1AllowReassociation = a })
{-# INLINE aa1AllowReassociation #-}

instance ToQuery AssociateAddress where
    toQuery = genericQuery def

-- | 
newtype AssociateAddressResponse = AssociateAddressResponse
    { _aarsrsAssociationId :: Maybe Text
    } deriving (Show, Generic)

-- | [EC2-VPC] The ID that represents the association of the Elastic IP address
-- with an instance.
aarsrsAssociationId :: Lens' AssociateAddressResponse (Maybe Text)
aarsrsAssociationId =
    lens _aarsrsAssociationId (\s a -> s { _aarsrsAssociationId = a })
{-# INLINE aarsrsAssociationId #-}

instance FromXML AssociateAddressResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest AssociateAddress where
    type Sv AssociateAddress = EC2
    type Rs AssociateAddress = AssociateAddressResponse

    request = post "AssociateAddress"
    response _ = xmlResponse
