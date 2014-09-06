{-# LANGUAGE DeriveDataTypeable          #-}
{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE StandaloneDeriving          #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Redshift.V2012_12_01.Types
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Amazon Redshift is a fast, fully managed, petabyte-scale data warehouse
-- service that makes it simple and cost-effective to efficiently analyze all
-- your data using your existing business intelligence tools. You can start
-- small for just $0.25 per hour with no commitments or upfront costs and
-- scale to a petabyte or more for $1,000 per terabyte per year, less than a
-- tenth of most other data warehousing solutions.
module Network.AWS.Redshift.V2012_12_01.Types
    (
    -- * Service
      Redshift
    -- ** Errors
    , Er (..)
    -- ** XML
    , xmlOptions

    -- * SourceType
    , SourceType (..)

    -- * AccountWithRestoreAccess
    , AccountWithRestoreAccess
    , mkAccountWithRestoreAccess
    , awraAccountId

    -- * AvailabilityZone
    , AvailabilityZone
    , mkAvailabilityZone
    , azName

    -- * Cluster
    , Cluster
    , mkCluster
    , cClusterIdentifier
    , cNodeType
    , cClusterStatus
    , cModifyStatus
    , cMasterUsername
    , cDBName
    , cEndpoint
    , cClusterCreateTime
    , cAutomatedSnapshotRetentionPeriod
    , cClusterSecurityGroups
    , cVpcSecurityGroups
    , cClusterParameterGroups
    , cClusterSubnetGroupName
    , cVpcId
    , cAvailabilityZone
    , cPreferredMaintenanceWindow
    , cPendingModifiedValues
    , cClusterVersion
    , cAllowVersionUpgrade
    , cNumberOfNodes
    , cPubliclyAccessible
    , cEncrypted
    , cRestoreStatus
    , cHsmStatus
    , cClusterSnapshotCopyStatus
    , cClusterPublicKey
    , cClusterNodes
    , cElasticIpStatus
    , cClusterRevisionNumber

    -- * ClusterNode
    , ClusterNode
    , mkClusterNode
    , cnNodeRole
    , cnPrivateIPAddress
    , cnPublicIPAddress

    -- * ClusterParameterGroup
    , ClusterParameterGroup
    , mkClusterParameterGroup
    , cpgParameterGroupName
    , cpgParameterGroupFamily
    , cpgDescription

    -- * ClusterParameterGroupStatus
    , ClusterParameterGroupStatus
    , mkClusterParameterGroupStatus
    , cpgsParameterGroupName
    , cpgsParameterApplyStatus

    -- * ClusterSecurityGroup
    , ClusterSecurityGroup
    , mkClusterSecurityGroup
    , csgClusterSecurityGroupName
    , csgDescription
    , csgEC2SecurityGroups
    , csgIPRanges

    -- * ClusterSecurityGroupMembership
    , ClusterSecurityGroupMembership
    , mkClusterSecurityGroupMembership
    , csgmClusterSecurityGroupName
    , csgmStatus

    -- * ClusterSnapshotCopyStatus
    , ClusterSnapshotCopyStatus
    , mkClusterSnapshotCopyStatus
    , cscsDestinationRegion
    , cscsRetentionPeriod

    -- * ClusterSubnetGroup
    , ClusterSubnetGroup
    , mkClusterSubnetGroup
    , csgrsClusterSubnetGroupName
    , csgrsDescription
    , csgrsVpcId
    , csgrsSubnetGroupStatus
    , csgrsSubnets

    -- * ClusterVersion
    , ClusterVersion
    , mkClusterVersion
    , cvClusterVersion
    , cvClusterParameterGroupFamily
    , cvDescription

    -- * DefaultClusterParameters
    , DefaultClusterParameters
    , mkDefaultClusterParameters
    , dcp1ParameterGroupFamily
    , dcp1Marker
    , dcp1Parameters

    -- * EC2SecurityGroup
    , EC2SecurityGroup
    , mkEC2SecurityGroup
    , ecsgStatus
    , ecsgEC2SecurityGroupName
    , ecsgEC2SecurityGroupOwnerId

    -- * ElasticIpStatus
    , ElasticIpStatus
    , mkElasticIpStatus
    , eisElasticIp
    , eisStatus

    -- * Endpoint
    , Endpoint
    , mkEndpoint
    , eAddress
    , ePort

    -- * Event
    , Event
    , mkEvent
    , ersSourceIdentifier
    , ersSourceType
    , ersMessage
    , ersEventCategories
    , ersSeverity
    , ersDate
    , ersEventId

    -- * EventCategoriesMap
    , EventCategoriesMap
    , mkEventCategoriesMap
    , ecmSourceType
    , ecmEvents

    -- * EventInfoMap
    , EventInfoMap
    , mkEventInfoMap
    , eimEventId
    , eimEventCategories
    , eimEventDescription
    , eimSeverity

    -- * EventSubscription
    , EventSubscription
    , mkEventSubscription
    , esCustomerAwsId
    , esCustSubscriptionId
    , esSnsTopicArn
    , esStatus
    , esSubscriptionCreationTime
    , esSourceType
    , esSourceIdsList
    , esEventCategoriesList
    , esSeverity
    , esEnabled

    -- * HsmClientCertificate
    , HsmClientCertificate
    , mkHsmClientCertificate
    , hccHsmClientCertificateIdentifier
    , hccHsmClientCertificatePublicKey

    -- * HsmConfiguration
    , HsmConfiguration
    , mkHsmConfiguration
    , hcHsmConfigurationIdentifier
    , hcDescription
    , hcHsmIpAddress
    , hcHsmPartitionName

    -- * HsmStatus
    , HsmStatus
    , mkHsmStatus
    , hsHsmClientCertificateIdentifier
    , hsHsmConfigurationIdentifier
    , hsStatus

    -- * IPRange
    , IPRange
    , mkIPRange
    , iprStatus
    , iprCIDRIP

    -- * OrderableClusterOption
    , OrderableClusterOption
    , mkOrderableClusterOption
    , ocoClusterVersion
    , ocoClusterType
    , ocoNodeType
    , ocoAvailabilityZones

    -- * Parameter
    , Parameter
    , mkParameter
    , pParameterName
    , pParameterValue
    , pDescription
    , pSource
    , pDataType
    , pAllowedValues
    , pIsModifiable
    , pMinimumEngineVersion

    -- * PendingModifiedValues
    , PendingModifiedValues
    , mkPendingModifiedValues
    , pmvMasterUserPassword
    , pmvNodeType
    , pmvNumberOfNodes
    , pmvClusterType
    , pmvClusterVersion
    , pmvAutomatedSnapshotRetentionPeriod
    , pmvClusterIdentifier

    -- * RecurringCharge
    , RecurringCharge
    , mkRecurringCharge
    , rcRecurringChargeAmount
    , rcRecurringChargeFrequency

    -- * ReservedNode
    , ReservedNode
    , mkReservedNode
    , rnReservedNodeId
    , rnReservedNodeOfferingId
    , rnNodeType
    , rnStartTime
    , rnDuration
    , rnFixedPrice
    , rnUsagePrice
    , rnCurrencyCode
    , rnNodeCount
    , rnState
    , rnOfferingType
    , rnRecurringCharges

    -- * ReservedNodeOffering
    , ReservedNodeOffering
    , mkReservedNodeOffering
    , rnoReservedNodeOfferingId
    , rnoNodeType
    , rnoDuration
    , rnoFixedPrice
    , rnoUsagePrice
    , rnoCurrencyCode
    , rnoOfferingType
    , rnoRecurringCharges

    -- * RestoreStatus
    , RestoreStatus
    , mkRestoreStatus
    , rsStatus
    , rsCurrentRestoreRateInMegaBytesPerSecond
    , rsSnapshotSizeInMegaBytes
    , rsProgressInMegaBytes
    , rsElapsedTimeInSeconds
    , rsEstimatedTimeToCompletionInSeconds

    -- * Snapshot
    , Snapshot
    , mkSnapshot
    , sSnapshotIdentifier
    , sClusterIdentifier
    , sSnapshotCreateTime
    , sStatus
    , sPort
    , sAvailabilityZone
    , sClusterCreateTime
    , sMasterUsername
    , sClusterVersion
    , sSnapshotType
    , sNodeType
    , sNumberOfNodes
    , sDBName
    , sVpcId
    , sEncrypted
    , sEncryptedWithHSM
    , sAccountsWithRestoreAccess
    , sOwnerAccount
    , sTotalBackupSizeInMegaBytes
    , sActualIncrementalBackupSizeInMegaBytes
    , sBackupProgressInMegaBytes
    , sCurrentBackupRateInMegaBytesPerSecond
    , sEstimatedSecondsToCompletion
    , sElapsedTimeInSeconds
    , sSourceRegion

    -- * Subnet
    , Subnet
    , mkSubnet
    , srsSubnetIdentifier
    , srsSubnetAvailabilityZone
    , srsSubnetStatus

    -- * VpcSecurityGroupMembership
    , VpcSecurityGroupMembership
    , mkVpcSecurityGroupMembership
    , vsgmVpcSecurityGroupId
    , vsgmStatus
    ) where

import Network.AWS.Prelude
import Network.AWS.Signing.V4

-- | Supported version (@2012-12-01@) of the
-- @Amazon Redshift@ service.
data Redshift deriving (Typeable)

instance AWSService Redshift where
    type Sg Redshift = V4
    data Er Redshift
        = AccessToSnapshotDeniedFault
        | AuthorizationAlreadyExistsFault
        | AuthorizationNotFoundFault
        | AuthorizationQuotaExceededFault
        | BucketNotFoundFault
        | ClusterAlreadyExistsFault
        | ClusterNotFoundFault
        | ClusterParameterGroupAlreadyExistsFault
        | ClusterParameterGroupNotFoundFault
        | ClusterParameterGroupQuotaExceededFault
        | ClusterQuotaExceededFault
        | ClusterSecurityGroupAlreadyExistsFault
        | ClusterSecurityGroupNotFoundFault
        | ClusterSecurityGroupQuotaExceededFault
        | ClusterSnapshotAlreadyExistsFault
        | ClusterSnapshotNotFoundFault
        | ClusterSnapshotQuotaExceededFault
        | ClusterSubnetGroupAlreadyExistsFault
        | ClusterSubnetGroupNotFoundFault
        | ClusterSubnetGroupQuotaExceededFault
        | ClusterSubnetQuotaExceededFault
        | CopyToRegionDisabledFault
        | EventSubscriptionQuotaExceededFault
        | HsmClientCertificateAlreadyExistsFault
        | HsmClientCertificateNotFoundFault
        | HsmClientCertificateQuotaExceededFault
        | HsmConfigurationAlreadyExistsFault
        | HsmConfigurationNotFoundFault
        | HsmConfigurationQuotaExceededFault
        | IncompatibleOrderableOptions
        | InsufficientClusterCapacityFault
        | InsufficientS3BucketPolicyFault
        | InvalidClusterParameterGroupStateFault
        | InvalidClusterSecurityGroupStateFault
        | InvalidClusterSnapshotStateFault
        | InvalidClusterStateFault
        | InvalidClusterSubnetGroupStateFault
        | InvalidClusterSubnetStateFault
        | InvalidElasticIpFault
        | InvalidHsmClientCertificateStateFault
        | InvalidHsmConfigurationStateFault
        | InvalidRestoreFault
        | InvalidS3BucketNameFault
        | InvalidS3KeyPrefixFault
        | InvalidSubnet
        | InvalidSubscriptionStateFault
        | InvalidVPCNetworkStateFault
        | NumberOfNodesPerClusterLimitExceededFault
        | NumberOfNodesQuotaExceededFault
        | RedshiftClient HttpException
        | RedshiftSerializer String
        | RedshiftService String
        | ReservedNodeAlreadyExistsFault
        | ReservedNodeNotFoundFault
        | ReservedNodeOfferingNotFoundFault
        | ReservedNodeQuotaExceededFault
        | ResizeNotFoundFault
        | SNSInvalidTopicFault
        | SNSNoAuthorizationFault
        | SNSTopicArnNotFoundFault
        | SnapshotCopyAlreadyDisabledFault
        | SnapshotCopyAlreadyEnabledFault
        | SnapshotCopyDisabledFault
        | SourceNotFoundFault
        | SubnetAlreadyInUse
        | SubscriptionAlreadyExistFault
        | SubscriptionCategoryNotFoundFault
        | SubscriptionEventIdNotFoundFault
        | SubscriptionNotFoundFault
        | SubscriptionSeverityNotFoundFault
        | UnauthorizedOperation
        | UnknownSnapshotCopyRegionFault
        | UnsupportedOptionFault

    service = Service'
        { _svcEndpoint = Regional
        , _svcPrefix   = "redshift"
        , _svcVersion  = "2012-12-01"
        , _svcTarget   = Nothing
        }

deriving instance Show    (Er Redshift)
deriving instance Generic (Er Redshift)

instance AWSError (Er Redshift) where
    awsError = const "RedshiftError"

instance AWSServiceError (Er Redshift) where
    serviceError    = RedshiftService
    clientError     = RedshiftClient
    serializerError = RedshiftSerializer

instance Exception (Er Redshift)

xmlOptions :: Tagged a XMLOptions
xmlOptions = Tagged def
    { xmlNamespace = Just "http://redshift.amazonaws.com/doc/2012-12-01/"
    }

data SourceType
    = SourceTypeCluster -- ^ cluster
    | SourceTypeClusterParameterGroup -- ^ cluster-parameter-group
    | SourceTypeClusterSecurityGroup -- ^ cluster-security-group
    | SourceTypeClusterSnapshot -- ^ cluster-snapshot
      deriving (Eq, Show, Generic)

instance Hashable SourceType

instance FromText SourceType where
    parser = match "cluster" SourceTypeCluster
         <|> match "cluster-parameter-group" SourceTypeClusterParameterGroup
         <|> match "cluster-security-group" SourceTypeClusterSecurityGroup
         <|> match "cluster-snapshot" SourceTypeClusterSnapshot

instance ToText SourceType where
    toText SourceTypeCluster = "cluster"
    toText SourceTypeClusterParameterGroup = "cluster-parameter-group"
    toText SourceTypeClusterSecurityGroup = "cluster-security-group"
    toText SourceTypeClusterSnapshot = "cluster-snapshot"

instance ToByteString SourceType

instance FromXML SourceType where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "SourceType"

instance ToQuery SourceType where
    toQuery = genericQuery def

-- | Describes an AWS customer account authorized to restore a snapshot.
newtype AccountWithRestoreAccess = AccountWithRestoreAccess
    { _awraAccountId :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'AccountWithRestoreAccess' data type to populate a request.
mkAccountWithRestoreAccess :: AccountWithRestoreAccess
mkAccountWithRestoreAccess = AccountWithRestoreAccess
    { _awraAccountId = Nothing
    }
{-# INLINE mkAccountWithRestoreAccess #-}

-- | The identifier of an AWS customer account authorized to restore a snapshot.
awraAccountId :: Lens' AccountWithRestoreAccess (Maybe Text)
awraAccountId = lens _awraAccountId (\s a -> s { _awraAccountId = a })
{-# INLINE awraAccountId #-}

instance FromXML AccountWithRestoreAccess where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "AccountWithRestoreAccess"

instance ToQuery AccountWithRestoreAccess where
    toQuery = genericQuery def

-- | Describes an availability zone.
newtype AvailabilityZone = AvailabilityZone
    { _azName :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'AvailabilityZone' data type to populate a request.
mkAvailabilityZone :: AvailabilityZone
mkAvailabilityZone = AvailabilityZone
    { _azName = Nothing
    }
{-# INLINE mkAvailabilityZone #-}

-- | The name of the availability zone.
azName :: Lens' AvailabilityZone (Maybe Text)
azName = lens _azName (\s a -> s { _azName = a })
{-# INLINE azName #-}

instance FromXML AvailabilityZone where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "AvailabilityZone"

instance ToQuery AvailabilityZone where
    toQuery = genericQuery def

-- | Describes a cluster.
data Cluster = Cluster
    { _cClusterIdentifier :: Maybe Text
    , _cNodeType :: Maybe Text
    , _cClusterStatus :: Maybe Text
    , _cModifyStatus :: Maybe Text
    , _cMasterUsername :: Maybe Text
    , _cDBName :: Maybe Text
    , _cEndpoint :: Maybe Endpoint
    , _cClusterCreateTime :: Maybe ISO8601
    , _cAutomatedSnapshotRetentionPeriod :: Maybe Integer
    , _cClusterSecurityGroups :: [ClusterSecurityGroupMembership]
    , _cVpcSecurityGroups :: [VpcSecurityGroupMembership]
    , _cClusterParameterGroups :: [ClusterParameterGroupStatus]
    , _cClusterSubnetGroupName :: Maybe Text
    , _cVpcId :: Maybe Text
    , _cAvailabilityZone :: Maybe Text
    , _cPreferredMaintenanceWindow :: Maybe Text
    , _cPendingModifiedValues :: Maybe PendingModifiedValues
    , _cClusterVersion :: Maybe Text
    , _cAllowVersionUpgrade :: Maybe Bool
    , _cNumberOfNodes :: Maybe Integer
    , _cPubliclyAccessible :: Maybe Bool
    , _cEncrypted :: Maybe Bool
    , _cRestoreStatus :: Maybe RestoreStatus
    , _cHsmStatus :: Maybe HsmStatus
    , _cClusterSnapshotCopyStatus :: Maybe ClusterSnapshotCopyStatus
    , _cClusterPublicKey :: Maybe Text
    , _cClusterNodes :: [ClusterNode]
    , _cElasticIpStatus :: Maybe ElasticIpStatus
    , _cClusterRevisionNumber :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'Cluster' data type to populate a request.
mkCluster :: Cluster
mkCluster = Cluster
    { _cClusterIdentifier = Nothing
    , _cNodeType = Nothing
    , _cClusterStatus = Nothing
    , _cModifyStatus = Nothing
    , _cMasterUsername = Nothing
    , _cDBName = Nothing
    , _cEndpoint = Nothing
    , _cClusterCreateTime = Nothing
    , _cAutomatedSnapshotRetentionPeriod = Nothing
    , _cClusterSecurityGroups = mempty
    , _cVpcSecurityGroups = mempty
    , _cClusterParameterGroups = mempty
    , _cClusterSubnetGroupName = Nothing
    , _cVpcId = Nothing
    , _cAvailabilityZone = Nothing
    , _cPreferredMaintenanceWindow = Nothing
    , _cPendingModifiedValues = Nothing
    , _cClusterVersion = Nothing
    , _cAllowVersionUpgrade = Nothing
    , _cNumberOfNodes = Nothing
    , _cPubliclyAccessible = Nothing
    , _cEncrypted = Nothing
    , _cRestoreStatus = Nothing
    , _cHsmStatus = Nothing
    , _cClusterSnapshotCopyStatus = Nothing
    , _cClusterPublicKey = Nothing
    , _cClusterNodes = mempty
    , _cElasticIpStatus = Nothing
    , _cClusterRevisionNumber = Nothing
    }
{-# INLINE mkCluster #-}

-- | The unique identifier of the cluster.
cClusterIdentifier :: Lens' Cluster (Maybe Text)
cClusterIdentifier =
    lens _cClusterIdentifier (\s a -> s { _cClusterIdentifier = a })
{-# INLINE cClusterIdentifier #-}

-- | The node type for the nodes in the cluster.
cNodeType :: Lens' Cluster (Maybe Text)
cNodeType = lens _cNodeType (\s a -> s { _cNodeType = a })
{-# INLINE cNodeType #-}

-- | The current state of this cluster. Possible values include available,
-- creating, deleting, rebooting, renaming, and resizing.
cClusterStatus :: Lens' Cluster (Maybe Text)
cClusterStatus = lens _cClusterStatus (\s a -> s { _cClusterStatus = a })
{-# INLINE cClusterStatus #-}

-- | The status of a modify operation, if any, initiated for the cluster.
cModifyStatus :: Lens' Cluster (Maybe Text)
cModifyStatus = lens _cModifyStatus (\s a -> s { _cModifyStatus = a })
{-# INLINE cModifyStatus #-}

-- | The master user name for the cluster. This name is used to connect to the
-- database that is specified in DBName.
cMasterUsername :: Lens' Cluster (Maybe Text)
cMasterUsername = lens _cMasterUsername (\s a -> s { _cMasterUsername = a })
{-# INLINE cMasterUsername #-}

-- | The name of the initial database that was created when the cluster was
-- created. This same name is returned for the life of the cluster. If an
-- initial database was not specified, a database named "dev" was created by
-- default.
cDBName :: Lens' Cluster (Maybe Text)
cDBName = lens _cDBName (\s a -> s { _cDBName = a })
{-# INLINE cDBName #-}

-- | The connection endpoint.
cEndpoint :: Lens' Cluster (Maybe Endpoint)
cEndpoint = lens _cEndpoint (\s a -> s { _cEndpoint = a })
{-# INLINE cEndpoint #-}

-- | The date and time that the cluster was created.
cClusterCreateTime :: Lens' Cluster (Maybe ISO8601)
cClusterCreateTime =
    lens _cClusterCreateTime (\s a -> s { _cClusterCreateTime = a })
{-# INLINE cClusterCreateTime #-}

-- | The number of days that automatic cluster snapshots are retained.
cAutomatedSnapshotRetentionPeriod :: Lens' Cluster (Maybe Integer)
cAutomatedSnapshotRetentionPeriod =
    lens _cAutomatedSnapshotRetentionPeriod
         (\s a -> s { _cAutomatedSnapshotRetentionPeriod = a })
{-# INLINE cAutomatedSnapshotRetentionPeriod #-}

-- | A list of cluster security group that are associated with the cluster. Each
-- security group is represented by an element that contains
-- ClusterSecurityGroup.Name and ClusterSecurityGroup.Status subelements.
-- Cluster security groups are used when the cluster is not created in a VPC.
-- Clusters that are created in a VPC use VPC security groups, which are
-- listed by the VpcSecurityGroups parameter.
cClusterSecurityGroups :: Lens' Cluster [ClusterSecurityGroupMembership]
cClusterSecurityGroups =
    lens _cClusterSecurityGroups (\s a -> s { _cClusterSecurityGroups = a })
{-# INLINE cClusterSecurityGroups #-}

-- | A list of Virtual Private Cloud (VPC) security groups that are associated
-- with the cluster. This parameter is returned only if the cluster is in a
-- VPC.
cVpcSecurityGroups :: Lens' Cluster [VpcSecurityGroupMembership]
cVpcSecurityGroups =
    lens _cVpcSecurityGroups (\s a -> s { _cVpcSecurityGroups = a })
{-# INLINE cVpcSecurityGroups #-}

-- | The list of cluster parameter groups that are associated with this cluster.
cClusterParameterGroups :: Lens' Cluster [ClusterParameterGroupStatus]
cClusterParameterGroups =
    lens _cClusterParameterGroups
         (\s a -> s { _cClusterParameterGroups = a })
{-# INLINE cClusterParameterGroups #-}

-- | The name of the subnet group that is associated with the cluster. This
-- parameter is valid only when the cluster is in a VPC.
cClusterSubnetGroupName :: Lens' Cluster (Maybe Text)
cClusterSubnetGroupName =
    lens _cClusterSubnetGroupName
         (\s a -> s { _cClusterSubnetGroupName = a })
{-# INLINE cClusterSubnetGroupName #-}

-- | The identifier of the VPC the cluster is in, if the cluster is in a VPC.
cVpcId :: Lens' Cluster (Maybe Text)
cVpcId = lens _cVpcId (\s a -> s { _cVpcId = a })
{-# INLINE cVpcId #-}

-- | The name of the Availability Zone in which the cluster is located.
cAvailabilityZone :: Lens' Cluster (Maybe Text)
cAvailabilityZone =
    lens _cAvailabilityZone (\s a -> s { _cAvailabilityZone = a })
{-# INLINE cAvailabilityZone #-}

-- | The weekly time range (in UTC) during which system maintenance can occur.
cPreferredMaintenanceWindow :: Lens' Cluster (Maybe Text)
cPreferredMaintenanceWindow =
    lens _cPreferredMaintenanceWindow
         (\s a -> s { _cPreferredMaintenanceWindow = a })
{-# INLINE cPreferredMaintenanceWindow #-}

-- | If present, changes to the cluster are pending. Specific pending changes
-- are identified by subelements.
cPendingModifiedValues :: Lens' Cluster (Maybe PendingModifiedValues)
cPendingModifiedValues =
    lens _cPendingModifiedValues (\s a -> s { _cPendingModifiedValues = a })
{-# INLINE cPendingModifiedValues #-}

-- | The version ID of the Amazon Redshift engine that is running on the
-- cluster.
cClusterVersion :: Lens' Cluster (Maybe Text)
cClusterVersion = lens _cClusterVersion (\s a -> s { _cClusterVersion = a })
{-# INLINE cClusterVersion #-}

-- | If true, version upgrades will be applied automatically to the cluster
-- during the maintenance window.
cAllowVersionUpgrade :: Lens' Cluster (Maybe Bool)
cAllowVersionUpgrade =
    lens _cAllowVersionUpgrade (\s a -> s { _cAllowVersionUpgrade = a })
{-# INLINE cAllowVersionUpgrade #-}

-- | The number of compute nodes in the cluster.
cNumberOfNodes :: Lens' Cluster (Maybe Integer)
cNumberOfNodes = lens _cNumberOfNodes (\s a -> s { _cNumberOfNodes = a })
{-# INLINE cNumberOfNodes #-}

-- | If true, the cluster can be accessed from a public network.
cPubliclyAccessible :: Lens' Cluster (Maybe Bool)
cPubliclyAccessible =
    lens _cPubliclyAccessible (\s a -> s { _cPubliclyAccessible = a })
{-# INLINE cPubliclyAccessible #-}

-- | If true, data in the cluster is encrypted at rest.
cEncrypted :: Lens' Cluster (Maybe Bool)
cEncrypted = lens _cEncrypted (\s a -> s { _cEncrypted = a })
{-# INLINE cEncrypted #-}

-- | Describes the status of a cluster restore action. Returns null if the
-- cluster was not created by restoring a snapshot.
cRestoreStatus :: Lens' Cluster (Maybe RestoreStatus)
cRestoreStatus = lens _cRestoreStatus (\s a -> s { _cRestoreStatus = a })
{-# INLINE cRestoreStatus #-}

-- | Reports whether the Amazon Redshift cluster has finished applying any HSM
-- settings changes specified in a modify cluster command. Values: active,
-- applying.
cHsmStatus :: Lens' Cluster (Maybe HsmStatus)
cHsmStatus = lens _cHsmStatus (\s a -> s { _cHsmStatus = a })
{-# INLINE cHsmStatus #-}

-- | Returns the destination region and retention period that are configured for
-- cross-region snapshot copy.
cClusterSnapshotCopyStatus :: Lens' Cluster (Maybe ClusterSnapshotCopyStatus)
cClusterSnapshotCopyStatus =
    lens _cClusterSnapshotCopyStatus
         (\s a -> s { _cClusterSnapshotCopyStatus = a })
{-# INLINE cClusterSnapshotCopyStatus #-}

-- | The public key for the cluster.
cClusterPublicKey :: Lens' Cluster (Maybe Text)
cClusterPublicKey =
    lens _cClusterPublicKey (\s a -> s { _cClusterPublicKey = a })
{-# INLINE cClusterPublicKey #-}

-- | The nodes in a cluster.
cClusterNodes :: Lens' Cluster [ClusterNode]
cClusterNodes = lens _cClusterNodes (\s a -> s { _cClusterNodes = a })
{-# INLINE cClusterNodes #-}

-- | Describes the status of the elastic IP (EIP) address.
cElasticIpStatus :: Lens' Cluster (Maybe ElasticIpStatus)
cElasticIpStatus =
    lens _cElasticIpStatus (\s a -> s { _cElasticIpStatus = a })
{-# INLINE cElasticIpStatus #-}

-- | The specific revision number of the database in the cluster.
cClusterRevisionNumber :: Lens' Cluster (Maybe Text)
cClusterRevisionNumber =
    lens _cClusterRevisionNumber (\s a -> s { _cClusterRevisionNumber = a })
{-# INLINE cClusterRevisionNumber #-}

instance FromXML Cluster where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Cluster"

-- | The identifier of a node in a cluster. --&gt;.
data ClusterNode = ClusterNode
    { _cnNodeRole :: Maybe Text
    , _cnPrivateIPAddress :: Maybe Text
    , _cnPublicIPAddress :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'ClusterNode' data type to populate a request.
mkClusterNode :: ClusterNode
mkClusterNode = ClusterNode
    { _cnNodeRole = Nothing
    , _cnPrivateIPAddress = Nothing
    , _cnPublicIPAddress = Nothing
    }
{-# INLINE mkClusterNode #-}

-- | Whether the node is a leader node or a compute node.
cnNodeRole :: Lens' ClusterNode (Maybe Text)
cnNodeRole = lens _cnNodeRole (\s a -> s { _cnNodeRole = a })
{-# INLINE cnNodeRole #-}

-- | The private IP address of a node within a cluster.
cnPrivateIPAddress :: Lens' ClusterNode (Maybe Text)
cnPrivateIPAddress =
    lens _cnPrivateIPAddress (\s a -> s { _cnPrivateIPAddress = a })
{-# INLINE cnPrivateIPAddress #-}

-- | The public IP address of a node within a cluster.
cnPublicIPAddress :: Lens' ClusterNode (Maybe Text)
cnPublicIPAddress =
    lens _cnPublicIPAddress (\s a -> s { _cnPublicIPAddress = a })
{-# INLINE cnPublicIPAddress #-}

instance FromXML ClusterNode where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ClusterNode"

instance ToQuery ClusterNode where
    toQuery = genericQuery def

-- | Describes a parameter group.
data ClusterParameterGroup = ClusterParameterGroup
    { _cpgParameterGroupName :: Maybe Text
    , _cpgParameterGroupFamily :: Maybe Text
    , _cpgDescription :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'ClusterParameterGroup' data type to populate a request.
mkClusterParameterGroup :: ClusterParameterGroup
mkClusterParameterGroup = ClusterParameterGroup
    { _cpgParameterGroupName = Nothing
    , _cpgParameterGroupFamily = Nothing
    , _cpgDescription = Nothing
    }
{-# INLINE mkClusterParameterGroup #-}

-- | The name of the cluster parameter group.
cpgParameterGroupName :: Lens' ClusterParameterGroup (Maybe Text)
cpgParameterGroupName =
    lens _cpgParameterGroupName (\s a -> s { _cpgParameterGroupName = a })
{-# INLINE cpgParameterGroupName #-}

-- | The name of the cluster parameter group family that this cluster parameter
-- group is compatible with.
cpgParameterGroupFamily :: Lens' ClusterParameterGroup (Maybe Text)
cpgParameterGroupFamily =
    lens _cpgParameterGroupFamily
         (\s a -> s { _cpgParameterGroupFamily = a })
{-# INLINE cpgParameterGroupFamily #-}

-- | The description of the parameter group.
cpgDescription :: Lens' ClusterParameterGroup (Maybe Text)
cpgDescription = lens _cpgDescription (\s a -> s { _cpgDescription = a })
{-# INLINE cpgDescription #-}

instance FromXML ClusterParameterGroup where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ClusterParameterGroup"

-- | Describes the status of a parameter group.
data ClusterParameterGroupStatus = ClusterParameterGroupStatus
    { _cpgsParameterGroupName :: Maybe Text
    , _cpgsParameterApplyStatus :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'ClusterParameterGroupStatus' data type to populate a request.
mkClusterParameterGroupStatus :: ClusterParameterGroupStatus
mkClusterParameterGroupStatus = ClusterParameterGroupStatus
    { _cpgsParameterGroupName = Nothing
    , _cpgsParameterApplyStatus = Nothing
    }
{-# INLINE mkClusterParameterGroupStatus #-}

-- | The name of the cluster parameter group.
cpgsParameterGroupName :: Lens' ClusterParameterGroupStatus (Maybe Text)
cpgsParameterGroupName =
    lens _cpgsParameterGroupName (\s a -> s { _cpgsParameterGroupName = a })
{-# INLINE cpgsParameterGroupName #-}

-- | The status of parameter updates.
cpgsParameterApplyStatus :: Lens' ClusterParameterGroupStatus (Maybe Text)
cpgsParameterApplyStatus =
    lens _cpgsParameterApplyStatus
         (\s a -> s { _cpgsParameterApplyStatus = a })
{-# INLINE cpgsParameterApplyStatus #-}

instance FromXML ClusterParameterGroupStatus where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ClusterParameterGroup"

instance ToQuery ClusterParameterGroupStatus where
    toQuery = genericQuery def

-- | Describes a security group.
data ClusterSecurityGroup = ClusterSecurityGroup
    { _csgClusterSecurityGroupName :: Maybe Text
    , _csgDescription :: Maybe Text
    , _csgEC2SecurityGroups :: [EC2SecurityGroup]
    , _csgIPRanges :: [IPRange]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'ClusterSecurityGroup' data type to populate a request.
mkClusterSecurityGroup :: ClusterSecurityGroup
mkClusterSecurityGroup = ClusterSecurityGroup
    { _csgClusterSecurityGroupName = Nothing
    , _csgDescription = Nothing
    , _csgEC2SecurityGroups = mempty
    , _csgIPRanges = mempty
    }
{-# INLINE mkClusterSecurityGroup #-}

-- | The name of the cluster security group to which the operation was applied.
csgClusterSecurityGroupName :: Lens' ClusterSecurityGroup (Maybe Text)
csgClusterSecurityGroupName =
    lens _csgClusterSecurityGroupName
         (\s a -> s { _csgClusterSecurityGroupName = a })
{-# INLINE csgClusterSecurityGroupName #-}

-- | A description of the security group.
csgDescription :: Lens' ClusterSecurityGroup (Maybe Text)
csgDescription = lens _csgDescription (\s a -> s { _csgDescription = a })
{-# INLINE csgDescription #-}

-- | A list of EC2 security groups that are permitted to access clusters
-- associated with this cluster security group.
csgEC2SecurityGroups :: Lens' ClusterSecurityGroup [EC2SecurityGroup]
csgEC2SecurityGroups =
    lens _csgEC2SecurityGroups (\s a -> s { _csgEC2SecurityGroups = a })
{-# INLINE csgEC2SecurityGroups #-}

-- | A list of IP ranges (CIDR blocks) that are permitted to access clusters
-- associated with this cluster security group.
csgIPRanges :: Lens' ClusterSecurityGroup [IPRange]
csgIPRanges = lens _csgIPRanges (\s a -> s { _csgIPRanges = a })
{-# INLINE csgIPRanges #-}

instance FromXML ClusterSecurityGroup where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ClusterSecurityGroup"

-- | Describes a security group.
data ClusterSecurityGroupMembership = ClusterSecurityGroupMembership
    { _csgmClusterSecurityGroupName :: Maybe Text
    , _csgmStatus :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'ClusterSecurityGroupMembership' data type to populate a request.
mkClusterSecurityGroupMembership :: ClusterSecurityGroupMembership
mkClusterSecurityGroupMembership = ClusterSecurityGroupMembership
    { _csgmClusterSecurityGroupName = Nothing
    , _csgmStatus = Nothing
    }
{-# INLINE mkClusterSecurityGroupMembership #-}

-- | The name of the cluster security group.
csgmClusterSecurityGroupName :: Lens' ClusterSecurityGroupMembership (Maybe Text)
csgmClusterSecurityGroupName =
    lens _csgmClusterSecurityGroupName
         (\s a -> s { _csgmClusterSecurityGroupName = a })
{-# INLINE csgmClusterSecurityGroupName #-}

-- | The status of the cluster security group.
csgmStatus :: Lens' ClusterSecurityGroupMembership (Maybe Text)
csgmStatus = lens _csgmStatus (\s a -> s { _csgmStatus = a })
{-# INLINE csgmStatus #-}

instance FromXML ClusterSecurityGroupMembership where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ClusterSecurityGroup"

instance ToQuery ClusterSecurityGroupMembership where
    toQuery = genericQuery def

-- | Returns the destination region and retention period that are configured for
-- cross-region snapshot copy.
data ClusterSnapshotCopyStatus = ClusterSnapshotCopyStatus
    { _cscsDestinationRegion :: Maybe Text
    , _cscsRetentionPeriod :: Maybe Integer
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'ClusterSnapshotCopyStatus' data type to populate a request.
mkClusterSnapshotCopyStatus :: ClusterSnapshotCopyStatus
mkClusterSnapshotCopyStatus = ClusterSnapshotCopyStatus
    { _cscsDestinationRegion = Nothing
    , _cscsRetentionPeriod = Nothing
    }
{-# INLINE mkClusterSnapshotCopyStatus #-}

-- | The destination region that snapshots are automatically copied to when
-- cross-region snapshot copy is enabled.
cscsDestinationRegion :: Lens' ClusterSnapshotCopyStatus (Maybe Text)
cscsDestinationRegion =
    lens _cscsDestinationRegion (\s a -> s { _cscsDestinationRegion = a })
{-# INLINE cscsDestinationRegion #-}

-- | The number of days that automated snapshots are retained in the destination
-- region after they are copied from a source region.
cscsRetentionPeriod :: Lens' ClusterSnapshotCopyStatus (Maybe Integer)
cscsRetentionPeriod =
    lens _cscsRetentionPeriod (\s a -> s { _cscsRetentionPeriod = a })
{-# INLINE cscsRetentionPeriod #-}

instance FromXML ClusterSnapshotCopyStatus where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ClusterSnapshotCopyStatus"

instance ToQuery ClusterSnapshotCopyStatus where
    toQuery = genericQuery def

-- | Describes a subnet group.
data ClusterSubnetGroup = ClusterSubnetGroup
    { _csgrsClusterSubnetGroupName :: Maybe Text
    , _csgrsDescription :: Maybe Text
    , _csgrsVpcId :: Maybe Text
    , _csgrsSubnetGroupStatus :: Maybe Text
    , _csgrsSubnets :: [Subnet]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'ClusterSubnetGroup' data type to populate a request.
mkClusterSubnetGroup :: ClusterSubnetGroup
mkClusterSubnetGroup = ClusterSubnetGroup
    { _csgrsClusterSubnetGroupName = Nothing
    , _csgrsDescription = Nothing
    , _csgrsVpcId = Nothing
    , _csgrsSubnetGroupStatus = Nothing
    , _csgrsSubnets = mempty
    }
{-# INLINE mkClusterSubnetGroup #-}

-- | The name of the cluster subnet group.
csgrsClusterSubnetGroupName :: Lens' ClusterSubnetGroup (Maybe Text)
csgrsClusterSubnetGroupName =
    lens _csgrsClusterSubnetGroupName
         (\s a -> s { _csgrsClusterSubnetGroupName = a })
{-# INLINE csgrsClusterSubnetGroupName #-}

-- | The description of the cluster subnet group.
csgrsDescription :: Lens' ClusterSubnetGroup (Maybe Text)
csgrsDescription =
    lens _csgrsDescription (\s a -> s { _csgrsDescription = a })
{-# INLINE csgrsDescription #-}

-- | The VPC ID of the cluster subnet group.
csgrsVpcId :: Lens' ClusterSubnetGroup (Maybe Text)
csgrsVpcId = lens _csgrsVpcId (\s a -> s { _csgrsVpcId = a })
{-# INLINE csgrsVpcId #-}

-- | The status of the cluster subnet group. Possible values are Complete,
-- Incomplete and Invalid.
csgrsSubnetGroupStatus :: Lens' ClusterSubnetGroup (Maybe Text)
csgrsSubnetGroupStatus =
    lens _csgrsSubnetGroupStatus (\s a -> s { _csgrsSubnetGroupStatus = a })
{-# INLINE csgrsSubnetGroupStatus #-}

-- | A list of the VPC Subnet elements.
csgrsSubnets :: Lens' ClusterSubnetGroup [Subnet]
csgrsSubnets = lens _csgrsSubnets (\s a -> s { _csgrsSubnets = a })
{-# INLINE csgrsSubnets #-}

instance FromXML ClusterSubnetGroup where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ClusterSubnetGroup"

-- | Describes a cluster version, including the parameter group family and
-- description of the version.
data ClusterVersion = ClusterVersion
    { _cvClusterVersion :: Maybe Text
    , _cvClusterParameterGroupFamily :: Maybe Text
    , _cvDescription :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'ClusterVersion' data type to populate a request.
mkClusterVersion :: ClusterVersion
mkClusterVersion = ClusterVersion
    { _cvClusterVersion = Nothing
    , _cvClusterParameterGroupFamily = Nothing
    , _cvDescription = Nothing
    }
{-# INLINE mkClusterVersion #-}

-- | The version number used by the cluster.
cvClusterVersion :: Lens' ClusterVersion (Maybe Text)
cvClusterVersion =
    lens _cvClusterVersion (\s a -> s { _cvClusterVersion = a })
{-# INLINE cvClusterVersion #-}

-- | The name of the cluster parameter group family for the cluster.
cvClusterParameterGroupFamily :: Lens' ClusterVersion (Maybe Text)
cvClusterParameterGroupFamily =
    lens _cvClusterParameterGroupFamily
         (\s a -> s { _cvClusterParameterGroupFamily = a })
{-# INLINE cvClusterParameterGroupFamily #-}

-- | The description of the cluster version.
cvDescription :: Lens' ClusterVersion (Maybe Text)
cvDescription = lens _cvDescription (\s a -> s { _cvDescription = a })
{-# INLINE cvDescription #-}

instance FromXML ClusterVersion where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ClusterVersion"

-- | Describes the default cluster parameters for a parameter group family.
data DefaultClusterParameters = DefaultClusterParameters
    { _dcp1ParameterGroupFamily :: Maybe Text
    , _dcp1Marker :: Maybe Text
    , _dcp1Parameters :: [Parameter]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'DefaultClusterParameters' data type to populate a request.
mkDefaultClusterParameters :: DefaultClusterParameters
mkDefaultClusterParameters = DefaultClusterParameters
    { _dcp1ParameterGroupFamily = Nothing
    , _dcp1Marker = Nothing
    , _dcp1Parameters = mempty
    }
{-# INLINE mkDefaultClusterParameters #-}

-- | The name of the cluster parameter group family to which the engine default
-- parameters apply.
dcp1ParameterGroupFamily :: Lens' DefaultClusterParameters (Maybe Text)
dcp1ParameterGroupFamily =
    lens _dcp1ParameterGroupFamily
         (\s a -> s { _dcp1ParameterGroupFamily = a })
{-# INLINE dcp1ParameterGroupFamily #-}

-- | A value that indicates the starting point for the next set of response
-- records in a subsequent request. If a value is returned in a response, you
-- can retrieve the next set of records by providing this returned marker
-- value in the Marker parameter and retrying the command. If the Marker field
-- is empty, all response records have been retrieved for the request.
dcp1Marker :: Lens' DefaultClusterParameters (Maybe Text)
dcp1Marker = lens _dcp1Marker (\s a -> s { _dcp1Marker = a })
{-# INLINE dcp1Marker #-}

-- | The list of cluster default parameters.
dcp1Parameters :: Lens' DefaultClusterParameters [Parameter]
dcp1Parameters = lens _dcp1Parameters (\s a -> s { _dcp1Parameters = a })
{-# INLINE dcp1Parameters #-}

instance FromXML DefaultClusterParameters where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "DefaultClusterParameters"

-- | Describes an Amazon EC2 security group.
data EC2SecurityGroup = EC2SecurityGroup
    { _ecsgStatus :: Maybe Text
    , _ecsgEC2SecurityGroupName :: Maybe Text
    , _ecsgEC2SecurityGroupOwnerId :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'EC2SecurityGroup' data type to populate a request.
mkEC2SecurityGroup :: EC2SecurityGroup
mkEC2SecurityGroup = EC2SecurityGroup
    { _ecsgStatus = Nothing
    , _ecsgEC2SecurityGroupName = Nothing
    , _ecsgEC2SecurityGroupOwnerId = Nothing
    }
{-# INLINE mkEC2SecurityGroup #-}

-- | The status of the EC2 security group.
ecsgStatus :: Lens' EC2SecurityGroup (Maybe Text)
ecsgStatus = lens _ecsgStatus (\s a -> s { _ecsgStatus = a })
{-# INLINE ecsgStatus #-}

-- | The name of the EC2 Security Group.
ecsgEC2SecurityGroupName :: Lens' EC2SecurityGroup (Maybe Text)
ecsgEC2SecurityGroupName =
    lens _ecsgEC2SecurityGroupName
         (\s a -> s { _ecsgEC2SecurityGroupName = a })
{-# INLINE ecsgEC2SecurityGroupName #-}

-- | The AWS ID of the owner of the EC2 security group specified in the
-- EC2SecurityGroupName field.
ecsgEC2SecurityGroupOwnerId :: Lens' EC2SecurityGroup (Maybe Text)
ecsgEC2SecurityGroupOwnerId =
    lens _ecsgEC2SecurityGroupOwnerId
         (\s a -> s { _ecsgEC2SecurityGroupOwnerId = a })
{-# INLINE ecsgEC2SecurityGroupOwnerId #-}

instance FromXML EC2SecurityGroup where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "EC2SecurityGroup"

instance ToQuery EC2SecurityGroup where
    toQuery = genericQuery def

-- | Describes the status of the elastic IP (EIP) address.
data ElasticIpStatus = ElasticIpStatus
    { _eisElasticIp :: Maybe Text
    , _eisStatus :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'ElasticIpStatus' data type to populate a request.
mkElasticIpStatus :: ElasticIpStatus
mkElasticIpStatus = ElasticIpStatus
    { _eisElasticIp = Nothing
    , _eisStatus = Nothing
    }
{-# INLINE mkElasticIpStatus #-}

-- | The elastic IP (EIP) address for the cluster.
eisElasticIp :: Lens' ElasticIpStatus (Maybe Text)
eisElasticIp = lens _eisElasticIp (\s a -> s { _eisElasticIp = a })
{-# INLINE eisElasticIp #-}

-- | Describes the status of the elastic IP (EIP) address.
eisStatus :: Lens' ElasticIpStatus (Maybe Text)
eisStatus = lens _eisStatus (\s a -> s { _eisStatus = a })
{-# INLINE eisStatus #-}

instance FromXML ElasticIpStatus where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ElasticIpStatus"

instance ToQuery ElasticIpStatus where
    toQuery = genericQuery def

-- | The connection endpoint.
data Endpoint = Endpoint
    { _eAddress :: Maybe Text
    , _ePort :: Maybe Integer
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'Endpoint' data type to populate a request.
mkEndpoint :: Endpoint
mkEndpoint = Endpoint
    { _eAddress = Nothing
    , _ePort = Nothing
    }
{-# INLINE mkEndpoint #-}

-- | The DNS address of the Cluster.
eAddress :: Lens' Endpoint (Maybe Text)
eAddress = lens _eAddress (\s a -> s { _eAddress = a })
{-# INLINE eAddress #-}

-- | The port that the database engine is listening on.
ePort :: Lens' Endpoint (Maybe Integer)
ePort = lens _ePort (\s a -> s { _ePort = a })
{-# INLINE ePort #-}

instance FromXML Endpoint where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Endpoint"

instance ToQuery Endpoint where
    toQuery = genericQuery def

-- | Describes an event.
data Event = Event
    { _ersSourceIdentifier :: Maybe Text
    , _ersSourceType :: Maybe SourceType
    , _ersMessage :: Maybe Text
    , _ersEventCategories :: [Text]
    , _ersSeverity :: Maybe Text
    , _ersDate :: Maybe ISO8601
    , _ersEventId :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'Event' data type to populate a request.
mkEvent :: Event
mkEvent = Event
    { _ersSourceIdentifier = Nothing
    , _ersSourceType = Nothing
    , _ersMessage = Nothing
    , _ersEventCategories = mempty
    , _ersSeverity = Nothing
    , _ersDate = Nothing
    , _ersEventId = Nothing
    }
{-# INLINE mkEvent #-}

-- | The identifier for the source of the event.
ersSourceIdentifier :: Lens' Event (Maybe Text)
ersSourceIdentifier =
    lens _ersSourceIdentifier (\s a -> s { _ersSourceIdentifier = a })
{-# INLINE ersSourceIdentifier #-}

-- | The source type for this event.
ersSourceType :: Lens' Event (Maybe SourceType)
ersSourceType = lens _ersSourceType (\s a -> s { _ersSourceType = a })
{-# INLINE ersSourceType #-}

-- | The text of this event.
ersMessage :: Lens' Event (Maybe Text)
ersMessage = lens _ersMessage (\s a -> s { _ersMessage = a })
{-# INLINE ersMessage #-}

-- | A list of the event categories.
ersEventCategories :: Lens' Event [Text]
ersEventCategories =
    lens _ersEventCategories (\s a -> s { _ersEventCategories = a })
{-# INLINE ersEventCategories #-}

-- | The severity of the event. Values: ERROR, INFO.
ersSeverity :: Lens' Event (Maybe Text)
ersSeverity = lens _ersSeverity (\s a -> s { _ersSeverity = a })
{-# INLINE ersSeverity #-}

-- | The date and time of the event.
ersDate :: Lens' Event (Maybe ISO8601)
ersDate = lens _ersDate (\s a -> s { _ersDate = a })
{-# INLINE ersDate #-}

-- | The identifier of the event.
ersEventId :: Lens' Event (Maybe Text)
ersEventId = lens _ersEventId (\s a -> s { _ersEventId = a })
{-# INLINE ersEventId #-}

instance FromXML Event where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Event"

-- | 
data EventCategoriesMap = EventCategoriesMap
    { _ecmSourceType :: Maybe Text
    , _ecmEvents :: [EventInfoMap]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'EventCategoriesMap' data type to populate a request.
mkEventCategoriesMap :: EventCategoriesMap
mkEventCategoriesMap = EventCategoriesMap
    { _ecmSourceType = Nothing
    , _ecmEvents = mempty
    }
{-# INLINE mkEventCategoriesMap #-}

-- | The Amazon Redshift source type, such as cluster or cluster-snapshot, that
-- the returned categories belong to.
ecmSourceType :: Lens' EventCategoriesMap (Maybe Text)
ecmSourceType = lens _ecmSourceType (\s a -> s { _ecmSourceType = a })
{-# INLINE ecmSourceType #-}

-- | The events in the event category.
ecmEvents :: Lens' EventCategoriesMap [EventInfoMap]
ecmEvents = lens _ecmEvents (\s a -> s { _ecmEvents = a })
{-# INLINE ecmEvents #-}

instance FromXML EventCategoriesMap where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "EventCategoriesMap"

-- | 
data EventInfoMap = EventInfoMap
    { _eimEventId :: Maybe Text
    , _eimEventCategories :: [Text]
    , _eimEventDescription :: Maybe Text
    , _eimSeverity :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'EventInfoMap' data type to populate a request.
mkEventInfoMap :: EventInfoMap
mkEventInfoMap = EventInfoMap
    { _eimEventId = Nothing
    , _eimEventCategories = mempty
    , _eimEventDescription = Nothing
    , _eimSeverity = Nothing
    }
{-# INLINE mkEventInfoMap #-}

-- | The identifier of an Amazon Redshift event.
eimEventId :: Lens' EventInfoMap (Maybe Text)
eimEventId = lens _eimEventId (\s a -> s { _eimEventId = a })
{-# INLINE eimEventId #-}

-- | The category of an Amazon Redshift event.
eimEventCategories :: Lens' EventInfoMap [Text]
eimEventCategories =
    lens _eimEventCategories (\s a -> s { _eimEventCategories = a })
{-# INLINE eimEventCategories #-}

-- | The description of an Amazon Redshift event.
eimEventDescription :: Lens' EventInfoMap (Maybe Text)
eimEventDescription =
    lens _eimEventDescription (\s a -> s { _eimEventDescription = a })
{-# INLINE eimEventDescription #-}

-- | The severity of the event. Values: ERROR, INFO.
eimSeverity :: Lens' EventInfoMap (Maybe Text)
eimSeverity = lens _eimSeverity (\s a -> s { _eimSeverity = a })
{-# INLINE eimSeverity #-}

instance FromXML EventInfoMap where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "EventInfoMap"

instance ToQuery EventInfoMap where
    toQuery = genericQuery def

-- | 
data EventSubscription = EventSubscription
    { _esCustomerAwsId :: Maybe Text
    , _esCustSubscriptionId :: Maybe Text
    , _esSnsTopicArn :: Maybe Text
    , _esStatus :: Maybe Text
    , _esSubscriptionCreationTime :: Maybe ISO8601
    , _esSourceType :: Maybe Text
    , _esSourceIdsList :: [Text]
    , _esEventCategoriesList :: [Text]
    , _esSeverity :: Maybe Text
    , _esEnabled :: Maybe Bool
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'EventSubscription' data type to populate a request.
mkEventSubscription :: EventSubscription
mkEventSubscription = EventSubscription
    { _esCustomerAwsId = Nothing
    , _esCustSubscriptionId = Nothing
    , _esSnsTopicArn = Nothing
    , _esStatus = Nothing
    , _esSubscriptionCreationTime = Nothing
    , _esSourceType = Nothing
    , _esSourceIdsList = mempty
    , _esEventCategoriesList = mempty
    , _esSeverity = Nothing
    , _esEnabled = Nothing
    }
{-# INLINE mkEventSubscription #-}

-- | The AWS customer account associated with the Amazon Redshift event
-- notification subscription.
esCustomerAwsId :: Lens' EventSubscription (Maybe Text)
esCustomerAwsId = lens _esCustomerAwsId (\s a -> s { _esCustomerAwsId = a })
{-# INLINE esCustomerAwsId #-}

-- | The name of the Amazon Redshift event notification subscription.
esCustSubscriptionId :: Lens' EventSubscription (Maybe Text)
esCustSubscriptionId =
    lens _esCustSubscriptionId (\s a -> s { _esCustSubscriptionId = a })
{-# INLINE esCustSubscriptionId #-}

-- | The Amazon Resource Name (ARN) of the Amazon SNS topic used by the event
-- notification subscription.
esSnsTopicArn :: Lens' EventSubscription (Maybe Text)
esSnsTopicArn = lens _esSnsTopicArn (\s a -> s { _esSnsTopicArn = a })
{-# INLINE esSnsTopicArn #-}

-- | The status of the Amazon Redshift event notification subscription.
-- Constraints: Can be one of the following: active | no-permission |
-- topic-not-exist The status "no-permission" indicates that Amazon Redshift
-- no longer has permission to post to the Amazon SNS topic. The status
-- "topic-not-exist" indicates that the topic was deleted after the
-- subscription was created.
esStatus :: Lens' EventSubscription (Maybe Text)
esStatus = lens _esStatus (\s a -> s { _esStatus = a })
{-# INLINE esStatus #-}

-- | The date and time the Amazon Redshift event notification subscription was
-- created.
esSubscriptionCreationTime :: Lens' EventSubscription (Maybe ISO8601)
esSubscriptionCreationTime =
    lens _esSubscriptionCreationTime
         (\s a -> s { _esSubscriptionCreationTime = a })
{-# INLINE esSubscriptionCreationTime #-}

-- | The source type of the events returned the Amazon Redshift event
-- notification, such as cluster, or cluster-snapshot.
esSourceType :: Lens' EventSubscription (Maybe Text)
esSourceType = lens _esSourceType (\s a -> s { _esSourceType = a })
{-# INLINE esSourceType #-}

-- | A list of the sources that publish events to the Amazon Redshift event
-- notification subscription.
esSourceIdsList :: Lens' EventSubscription [Text]
esSourceIdsList = lens _esSourceIdsList (\s a -> s { _esSourceIdsList = a })
{-# INLINE esSourceIdsList #-}

-- | The list of Amazon Redshift event categories specified in the event
-- notification subscription. Values: Configuration, Management, Monitoring,
-- Security.
esEventCategoriesList :: Lens' EventSubscription [Text]
esEventCategoriesList =
    lens _esEventCategoriesList (\s a -> s { _esEventCategoriesList = a })
{-# INLINE esEventCategoriesList #-}

-- | The event severity specified in the Amazon Redshift event notification
-- subscription. Values: ERROR, INFO.
esSeverity :: Lens' EventSubscription (Maybe Text)
esSeverity = lens _esSeverity (\s a -> s { _esSeverity = a })
{-# INLINE esSeverity #-}

-- | A Boolean value indicating whether the subscription is enabled. true
-- indicates the subscription is enabled.
esEnabled :: Lens' EventSubscription (Maybe Bool)
esEnabled = lens _esEnabled (\s a -> s { _esEnabled = a })
{-# INLINE esEnabled #-}

instance FromXML EventSubscription where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "EventSubscription"

-- | Returns information about an HSM client certificate. The certificate is
-- stored in a secure Hardware Storage Module (HSM), and used by the Amazon
-- Redshift cluster to encrypt data files.
data HsmClientCertificate = HsmClientCertificate
    { _hccHsmClientCertificateIdentifier :: Maybe Text
    , _hccHsmClientCertificatePublicKey :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'HsmClientCertificate' data type to populate a request.
mkHsmClientCertificate :: HsmClientCertificate
mkHsmClientCertificate = HsmClientCertificate
    { _hccHsmClientCertificateIdentifier = Nothing
    , _hccHsmClientCertificatePublicKey = Nothing
    }
{-# INLINE mkHsmClientCertificate #-}

-- | The identifier of the HSM client certificate.
hccHsmClientCertificateIdentifier :: Lens' HsmClientCertificate (Maybe Text)
hccHsmClientCertificateIdentifier =
    lens _hccHsmClientCertificateIdentifier
         (\s a -> s { _hccHsmClientCertificateIdentifier = a })
{-# INLINE hccHsmClientCertificateIdentifier #-}

-- | The public key that the Amazon Redshift cluster will use to connect to the
-- HSM. You must register the public key in the HSM.
hccHsmClientCertificatePublicKey :: Lens' HsmClientCertificate (Maybe Text)
hccHsmClientCertificatePublicKey =
    lens _hccHsmClientCertificatePublicKey
         (\s a -> s { _hccHsmClientCertificatePublicKey = a })
{-# INLINE hccHsmClientCertificatePublicKey #-}

instance FromXML HsmClientCertificate where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "HsmClientCertificate"

-- | Returns information about an HSM configuration, which is an object that
-- describes to Amazon Redshift clusters the information they require to
-- connect to an HSM where they can store database encryption keys.
data HsmConfiguration = HsmConfiguration
    { _hcHsmConfigurationIdentifier :: Maybe Text
    , _hcDescription :: Maybe Text
    , _hcHsmIpAddress :: Maybe Text
    , _hcHsmPartitionName :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'HsmConfiguration' data type to populate a request.
mkHsmConfiguration :: HsmConfiguration
mkHsmConfiguration = HsmConfiguration
    { _hcHsmConfigurationIdentifier = Nothing
    , _hcDescription = Nothing
    , _hcHsmIpAddress = Nothing
    , _hcHsmPartitionName = Nothing
    }
{-# INLINE mkHsmConfiguration #-}

-- | The name of the Amazon Redshift HSM configuration.
hcHsmConfigurationIdentifier :: Lens' HsmConfiguration (Maybe Text)
hcHsmConfigurationIdentifier =
    lens _hcHsmConfigurationIdentifier
         (\s a -> s { _hcHsmConfigurationIdentifier = a })
{-# INLINE hcHsmConfigurationIdentifier #-}

-- | A text description of the HSM configuration.
hcDescription :: Lens' HsmConfiguration (Maybe Text)
hcDescription = lens _hcDescription (\s a -> s { _hcDescription = a })
{-# INLINE hcDescription #-}

-- | The IP address that the Amazon Redshift cluster must use to access the HSM.
hcHsmIpAddress :: Lens' HsmConfiguration (Maybe Text)
hcHsmIpAddress = lens _hcHsmIpAddress (\s a -> s { _hcHsmIpAddress = a })
{-# INLINE hcHsmIpAddress #-}

-- | The name of the partition in the HSM where the Amazon Redshift clusters
-- will store their database encryption keys.
hcHsmPartitionName :: Lens' HsmConfiguration (Maybe Text)
hcHsmPartitionName =
    lens _hcHsmPartitionName (\s a -> s { _hcHsmPartitionName = a })
{-# INLINE hcHsmPartitionName #-}

instance FromXML HsmConfiguration where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "HsmConfiguration"

-- | Reports whether the Amazon Redshift cluster has finished applying any HSM
-- settings changes specified in a modify cluster command. Values: active,
-- applying.
data HsmStatus = HsmStatus
    { _hsHsmClientCertificateIdentifier :: Maybe Text
    , _hsHsmConfigurationIdentifier :: Maybe Text
    , _hsStatus :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'HsmStatus' data type to populate a request.
mkHsmStatus :: HsmStatus
mkHsmStatus = HsmStatus
    { _hsHsmClientCertificateIdentifier = Nothing
    , _hsHsmConfigurationIdentifier = Nothing
    , _hsStatus = Nothing
    }
{-# INLINE mkHsmStatus #-}

-- | Specifies the name of the HSM client certificate the Amazon Redshift
-- cluster uses to retrieve the data encryption keys stored in an HSM.
hsHsmClientCertificateIdentifier :: Lens' HsmStatus (Maybe Text)
hsHsmClientCertificateIdentifier =
    lens _hsHsmClientCertificateIdentifier
         (\s a -> s { _hsHsmClientCertificateIdentifier = a })
{-# INLINE hsHsmClientCertificateIdentifier #-}

-- | Specifies the name of the HSM configuration that contains the information
-- the Amazon Redshift cluster can use to retrieve and store keys in an HSM.
hsHsmConfigurationIdentifier :: Lens' HsmStatus (Maybe Text)
hsHsmConfigurationIdentifier =
    lens _hsHsmConfigurationIdentifier
         (\s a -> s { _hsHsmConfigurationIdentifier = a })
{-# INLINE hsHsmConfigurationIdentifier #-}

-- | Reports whether the Amazon Redshift cluster has finished applying any HSM
-- settings changes specified in a modify cluster command. Values: active,
-- applying.
hsStatus :: Lens' HsmStatus (Maybe Text)
hsStatus = lens _hsStatus (\s a -> s { _hsStatus = a })
{-# INLINE hsStatus #-}

instance FromXML HsmStatus where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "HsmStatus"

instance ToQuery HsmStatus where
    toQuery = genericQuery def

-- | Describes an IP range used in a security group.
data IPRange = IPRange
    { _iprStatus :: Maybe Text
    , _iprCIDRIP :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'IPRange' data type to populate a request.
mkIPRange :: IPRange
mkIPRange = IPRange
    { _iprStatus = Nothing
    , _iprCIDRIP = Nothing
    }
{-# INLINE mkIPRange #-}

-- | The status of the IP range, for example, "authorized".
iprStatus :: Lens' IPRange (Maybe Text)
iprStatus = lens _iprStatus (\s a -> s { _iprStatus = a })
{-# INLINE iprStatus #-}

-- | The IP range in Classless Inter-Domain Routing (CIDR) notation.
iprCIDRIP :: Lens' IPRange (Maybe Text)
iprCIDRIP = lens _iprCIDRIP (\s a -> s { _iprCIDRIP = a })
{-# INLINE iprCIDRIP #-}

instance FromXML IPRange where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "IPRange"

instance ToQuery IPRange where
    toQuery = genericQuery def

-- | Describes an orderable cluster option.
data OrderableClusterOption = OrderableClusterOption
    { _ocoClusterVersion :: Maybe Text
    , _ocoClusterType :: Maybe Text
    , _ocoNodeType :: Maybe Text
    , _ocoAvailabilityZones :: [AvailabilityZone]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'OrderableClusterOption' data type to populate a request.
mkOrderableClusterOption :: OrderableClusterOption
mkOrderableClusterOption = OrderableClusterOption
    { _ocoClusterVersion = Nothing
    , _ocoClusterType = Nothing
    , _ocoNodeType = Nothing
    , _ocoAvailabilityZones = mempty
    }
{-# INLINE mkOrderableClusterOption #-}

-- | The version of the orderable cluster.
ocoClusterVersion :: Lens' OrderableClusterOption (Maybe Text)
ocoClusterVersion =
    lens _ocoClusterVersion (\s a -> s { _ocoClusterVersion = a })
{-# INLINE ocoClusterVersion #-}

-- | The cluster type, for example multi-node.
ocoClusterType :: Lens' OrderableClusterOption (Maybe Text)
ocoClusterType = lens _ocoClusterType (\s a -> s { _ocoClusterType = a })
{-# INLINE ocoClusterType #-}

-- | The node type for the orderable cluster.
ocoNodeType :: Lens' OrderableClusterOption (Maybe Text)
ocoNodeType = lens _ocoNodeType (\s a -> s { _ocoNodeType = a })
{-# INLINE ocoNodeType #-}

-- | A list of availability zones for the orderable cluster.
ocoAvailabilityZones :: Lens' OrderableClusterOption [AvailabilityZone]
ocoAvailabilityZones =
    lens _ocoAvailabilityZones (\s a -> s { _ocoAvailabilityZones = a })
{-# INLINE ocoAvailabilityZones #-}

instance FromXML OrderableClusterOption where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "OrderableClusterOption"

-- | Describes a parameter in a cluster parameter group.
data Parameter = Parameter
    { _pParameterName :: Maybe Text
    , _pParameterValue :: Maybe Text
    , _pDescription :: Maybe Text
    , _pSource :: Maybe Text
    , _pDataType :: Maybe Text
    , _pAllowedValues :: Maybe Text
    , _pIsModifiable :: Maybe Bool
    , _pMinimumEngineVersion :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'Parameter' data type to populate a request.
mkParameter :: Parameter
mkParameter = Parameter
    { _pParameterName = Nothing
    , _pParameterValue = Nothing
    , _pDescription = Nothing
    , _pSource = Nothing
    , _pDataType = Nothing
    , _pAllowedValues = Nothing
    , _pIsModifiable = Nothing
    , _pMinimumEngineVersion = Nothing
    }
{-# INLINE mkParameter #-}

-- | The name of the parameter.
pParameterName :: Lens' Parameter (Maybe Text)
pParameterName = lens _pParameterName (\s a -> s { _pParameterName = a })
{-# INLINE pParameterName #-}

-- | The value of the parameter.
pParameterValue :: Lens' Parameter (Maybe Text)
pParameterValue = lens _pParameterValue (\s a -> s { _pParameterValue = a })
{-# INLINE pParameterValue #-}

-- | A description of the parameter.
pDescription :: Lens' Parameter (Maybe Text)
pDescription = lens _pDescription (\s a -> s { _pDescription = a })
{-# INLINE pDescription #-}

-- | The source of the parameter value, such as "engine-default" or "user".
pSource :: Lens' Parameter (Maybe Text)
pSource = lens _pSource (\s a -> s { _pSource = a })
{-# INLINE pSource #-}

-- | The data type of the parameter.
pDataType :: Lens' Parameter (Maybe Text)
pDataType = lens _pDataType (\s a -> s { _pDataType = a })
{-# INLINE pDataType #-}

-- | The valid range of values for the parameter.
pAllowedValues :: Lens' Parameter (Maybe Text)
pAllowedValues = lens _pAllowedValues (\s a -> s { _pAllowedValues = a })
{-# INLINE pAllowedValues #-}

-- | If true, the parameter can be modified. Some parameters have security or
-- operational implications that prevent them from being changed.
pIsModifiable :: Lens' Parameter (Maybe Bool)
pIsModifiable = lens _pIsModifiable (\s a -> s { _pIsModifiable = a })
{-# INLINE pIsModifiable #-}

-- | The earliest engine version to which the parameter can apply.
pMinimumEngineVersion :: Lens' Parameter (Maybe Text)
pMinimumEngineVersion =
    lens _pMinimumEngineVersion (\s a -> s { _pMinimumEngineVersion = a })
{-# INLINE pMinimumEngineVersion #-}

instance FromXML Parameter where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Parameter"

instance ToQuery Parameter where
    toQuery = genericQuery def

-- | If present, changes to the cluster are pending. Specific pending changes
-- are identified by subelements.
data PendingModifiedValues = PendingModifiedValues
    { _pmvMasterUserPassword :: Maybe Text
    , _pmvNodeType :: Maybe Text
    , _pmvNumberOfNodes :: Maybe Integer
    , _pmvClusterType :: Maybe Text
    , _pmvClusterVersion :: Maybe Text
    , _pmvAutomatedSnapshotRetentionPeriod :: Maybe Integer
    , _pmvClusterIdentifier :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'PendingModifiedValues' data type to populate a request.
mkPendingModifiedValues :: PendingModifiedValues
mkPendingModifiedValues = PendingModifiedValues
    { _pmvMasterUserPassword = Nothing
    , _pmvNodeType = Nothing
    , _pmvNumberOfNodes = Nothing
    , _pmvClusterType = Nothing
    , _pmvClusterVersion = Nothing
    , _pmvAutomatedSnapshotRetentionPeriod = Nothing
    , _pmvClusterIdentifier = Nothing
    }
{-# INLINE mkPendingModifiedValues #-}

-- | The pending or in-progress change of the master user password for the
-- cluster.
pmvMasterUserPassword :: Lens' PendingModifiedValues (Maybe Text)
pmvMasterUserPassword =
    lens _pmvMasterUserPassword (\s a -> s { _pmvMasterUserPassword = a })
{-# INLINE pmvMasterUserPassword #-}

-- | The pending or in-progress change of the cluster's node type.
pmvNodeType :: Lens' PendingModifiedValues (Maybe Text)
pmvNodeType = lens _pmvNodeType (\s a -> s { _pmvNodeType = a })
{-# INLINE pmvNodeType #-}

-- | The pending or in-progress change of the number of nodes in the cluster.
pmvNumberOfNodes :: Lens' PendingModifiedValues (Maybe Integer)
pmvNumberOfNodes =
    lens _pmvNumberOfNodes (\s a -> s { _pmvNumberOfNodes = a })
{-# INLINE pmvNumberOfNodes #-}

-- | The pending or in-progress change of the cluster type.
pmvClusterType :: Lens' PendingModifiedValues (Maybe Text)
pmvClusterType = lens _pmvClusterType (\s a -> s { _pmvClusterType = a })
{-# INLINE pmvClusterType #-}

-- | The pending or in-progress change of the service version.
pmvClusterVersion :: Lens' PendingModifiedValues (Maybe Text)
pmvClusterVersion =
    lens _pmvClusterVersion (\s a -> s { _pmvClusterVersion = a })
{-# INLINE pmvClusterVersion #-}

-- | The pending or in-progress change of the automated snapshot retention
-- period.
pmvAutomatedSnapshotRetentionPeriod :: Lens' PendingModifiedValues (Maybe Integer)
pmvAutomatedSnapshotRetentionPeriod =
    lens _pmvAutomatedSnapshotRetentionPeriod
         (\s a -> s { _pmvAutomatedSnapshotRetentionPeriod = a })
{-# INLINE pmvAutomatedSnapshotRetentionPeriod #-}

-- | The pending or in-progress change of the new identifier for the cluster.
pmvClusterIdentifier :: Lens' PendingModifiedValues (Maybe Text)
pmvClusterIdentifier =
    lens _pmvClusterIdentifier (\s a -> s { _pmvClusterIdentifier = a })
{-# INLINE pmvClusterIdentifier #-}

instance FromXML PendingModifiedValues where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "PendingModifiedValues"

instance ToQuery PendingModifiedValues where
    toQuery = genericQuery def

-- | Describes a recurring charge.
data RecurringCharge = RecurringCharge
    { _rcRecurringChargeAmount :: Maybe Double
    , _rcRecurringChargeFrequency :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'RecurringCharge' data type to populate a request.
mkRecurringCharge :: RecurringCharge
mkRecurringCharge = RecurringCharge
    { _rcRecurringChargeAmount = Nothing
    , _rcRecurringChargeFrequency = Nothing
    }
{-# INLINE mkRecurringCharge #-}

-- | The amount charged per the period of time specified by the recurring charge
-- frequency.
rcRecurringChargeAmount :: Lens' RecurringCharge (Maybe Double)
rcRecurringChargeAmount =
    lens _rcRecurringChargeAmount
         (\s a -> s { _rcRecurringChargeAmount = a })
{-# INLINE rcRecurringChargeAmount #-}

-- | The frequency at which the recurring charge amount is applied.
rcRecurringChargeFrequency :: Lens' RecurringCharge (Maybe Text)
rcRecurringChargeFrequency =
    lens _rcRecurringChargeFrequency
         (\s a -> s { _rcRecurringChargeFrequency = a })
{-# INLINE rcRecurringChargeFrequency #-}

instance FromXML RecurringCharge where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "RecurringCharge"

instance ToQuery RecurringCharge where
    toQuery = genericQuery def

-- | Describes a reserved node.
data ReservedNode = ReservedNode
    { _rnReservedNodeId :: Maybe Text
    , _rnReservedNodeOfferingId :: Maybe Text
    , _rnNodeType :: Maybe Text
    , _rnStartTime :: Maybe ISO8601
    , _rnDuration :: Maybe Integer
    , _rnFixedPrice :: Maybe Double
    , _rnUsagePrice :: Maybe Double
    , _rnCurrencyCode :: Maybe Text
    , _rnNodeCount :: Maybe Integer
    , _rnState :: Maybe Text
    , _rnOfferingType :: Maybe Text
    , _rnRecurringCharges :: [RecurringCharge]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'ReservedNode' data type to populate a request.
mkReservedNode :: ReservedNode
mkReservedNode = ReservedNode
    { _rnReservedNodeId = Nothing
    , _rnReservedNodeOfferingId = Nothing
    , _rnNodeType = Nothing
    , _rnStartTime = Nothing
    , _rnDuration = Nothing
    , _rnFixedPrice = Nothing
    , _rnUsagePrice = Nothing
    , _rnCurrencyCode = Nothing
    , _rnNodeCount = Nothing
    , _rnState = Nothing
    , _rnOfferingType = Nothing
    , _rnRecurringCharges = mempty
    }
{-# INLINE mkReservedNode #-}

-- | The unique identifier for the reservation.
rnReservedNodeId :: Lens' ReservedNode (Maybe Text)
rnReservedNodeId =
    lens _rnReservedNodeId (\s a -> s { _rnReservedNodeId = a })
{-# INLINE rnReservedNodeId #-}

-- | The identifier for the reserved node offering.
rnReservedNodeOfferingId :: Lens' ReservedNode (Maybe Text)
rnReservedNodeOfferingId =
    lens _rnReservedNodeOfferingId
         (\s a -> s { _rnReservedNodeOfferingId = a })
{-# INLINE rnReservedNodeOfferingId #-}

-- | The node type of the reserved node.
rnNodeType :: Lens' ReservedNode (Maybe Text)
rnNodeType = lens _rnNodeType (\s a -> s { _rnNodeType = a })
{-# INLINE rnNodeType #-}

-- | The time the reservation started. You purchase a reserved node offering for
-- a duration. This is the start time of that duration.
rnStartTime :: Lens' ReservedNode (Maybe ISO8601)
rnStartTime = lens _rnStartTime (\s a -> s { _rnStartTime = a })
{-# INLINE rnStartTime #-}

-- | The duration of the node reservation in seconds.
rnDuration :: Lens' ReservedNode (Maybe Integer)
rnDuration = lens _rnDuration (\s a -> s { _rnDuration = a })
{-# INLINE rnDuration #-}

-- | The fixed cost Amazon Redshift charged you for this reserved node.
rnFixedPrice :: Lens' ReservedNode (Maybe Double)
rnFixedPrice = lens _rnFixedPrice (\s a -> s { _rnFixedPrice = a })
{-# INLINE rnFixedPrice #-}

-- | The hourly rate Amazon Redshift charge you for this reserved node.
rnUsagePrice :: Lens' ReservedNode (Maybe Double)
rnUsagePrice = lens _rnUsagePrice (\s a -> s { _rnUsagePrice = a })
{-# INLINE rnUsagePrice #-}

-- | The currency code for the reserved cluster.
rnCurrencyCode :: Lens' ReservedNode (Maybe Text)
rnCurrencyCode = lens _rnCurrencyCode (\s a -> s { _rnCurrencyCode = a })
{-# INLINE rnCurrencyCode #-}

-- | The number of reserved compute nodes.
rnNodeCount :: Lens' ReservedNode (Maybe Integer)
rnNodeCount = lens _rnNodeCount (\s a -> s { _rnNodeCount = a })
{-# INLINE rnNodeCount #-}

-- | The state of the reserved Compute Node. Possible Values:
-- pending-payment-This reserved node has recently been purchased, and the
-- sale has been approved, but payment has not yet been confirmed. active-This
-- reserved node is owned by the caller and is available for use.
-- payment-failed-Payment failed for the purchase attempt.
rnState :: Lens' ReservedNode (Maybe Text)
rnState = lens _rnState (\s a -> s { _rnState = a })
{-# INLINE rnState #-}

-- | The anticipated utilization of the reserved node, as defined in the
-- reserved node offering.
rnOfferingType :: Lens' ReservedNode (Maybe Text)
rnOfferingType = lens _rnOfferingType (\s a -> s { _rnOfferingType = a })
{-# INLINE rnOfferingType #-}

-- | The recurring charges for the reserved node.
rnRecurringCharges :: Lens' ReservedNode [RecurringCharge]
rnRecurringCharges =
    lens _rnRecurringCharges (\s a -> s { _rnRecurringCharges = a })
{-# INLINE rnRecurringCharges #-}

instance FromXML ReservedNode where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ReservedNode"

-- | Describes a reserved node offering.
data ReservedNodeOffering = ReservedNodeOffering
    { _rnoReservedNodeOfferingId :: Maybe Text
    , _rnoNodeType :: Maybe Text
    , _rnoDuration :: Maybe Integer
    , _rnoFixedPrice :: Maybe Double
    , _rnoUsagePrice :: Maybe Double
    , _rnoCurrencyCode :: Maybe Text
    , _rnoOfferingType :: Maybe Text
    , _rnoRecurringCharges :: [RecurringCharge]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'ReservedNodeOffering' data type to populate a request.
mkReservedNodeOffering :: ReservedNodeOffering
mkReservedNodeOffering = ReservedNodeOffering
    { _rnoReservedNodeOfferingId = Nothing
    , _rnoNodeType = Nothing
    , _rnoDuration = Nothing
    , _rnoFixedPrice = Nothing
    , _rnoUsagePrice = Nothing
    , _rnoCurrencyCode = Nothing
    , _rnoOfferingType = Nothing
    , _rnoRecurringCharges = mempty
    }
{-# INLINE mkReservedNodeOffering #-}

-- | The offering identifier.
rnoReservedNodeOfferingId :: Lens' ReservedNodeOffering (Maybe Text)
rnoReservedNodeOfferingId =
    lens _rnoReservedNodeOfferingId
         (\s a -> s { _rnoReservedNodeOfferingId = a })
{-# INLINE rnoReservedNodeOfferingId #-}

-- | The node type offered by the reserved node offering.
rnoNodeType :: Lens' ReservedNodeOffering (Maybe Text)
rnoNodeType = lens _rnoNodeType (\s a -> s { _rnoNodeType = a })
{-# INLINE rnoNodeType #-}

-- | The duration, in seconds, for which the offering will reserve the node.
rnoDuration :: Lens' ReservedNodeOffering (Maybe Integer)
rnoDuration = lens _rnoDuration (\s a -> s { _rnoDuration = a })
{-# INLINE rnoDuration #-}

-- | The upfront fixed charge you will pay to purchase the specific reserved
-- node offering.
rnoFixedPrice :: Lens' ReservedNodeOffering (Maybe Double)
rnoFixedPrice = lens _rnoFixedPrice (\s a -> s { _rnoFixedPrice = a })
{-# INLINE rnoFixedPrice #-}

-- | The rate you are charged for each hour the cluster that is using the
-- offering is running.
rnoUsagePrice :: Lens' ReservedNodeOffering (Maybe Double)
rnoUsagePrice = lens _rnoUsagePrice (\s a -> s { _rnoUsagePrice = a })
{-# INLINE rnoUsagePrice #-}

-- | The currency code for the compute nodes offering.
rnoCurrencyCode :: Lens' ReservedNodeOffering (Maybe Text)
rnoCurrencyCode = lens _rnoCurrencyCode (\s a -> s { _rnoCurrencyCode = a })
{-# INLINE rnoCurrencyCode #-}

-- | The anticipated utilization of the reserved node, as defined in the
-- reserved node offering.
rnoOfferingType :: Lens' ReservedNodeOffering (Maybe Text)
rnoOfferingType = lens _rnoOfferingType (\s a -> s { _rnoOfferingType = a })
{-# INLINE rnoOfferingType #-}

-- | The charge to your account regardless of whether you are creating any
-- clusters using the node offering. Recurring charges are only in effect for
-- heavy-utilization reserved nodes.
rnoRecurringCharges :: Lens' ReservedNodeOffering [RecurringCharge]
rnoRecurringCharges =
    lens _rnoRecurringCharges (\s a -> s { _rnoRecurringCharges = a })
{-# INLINE rnoRecurringCharges #-}

instance FromXML ReservedNodeOffering where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ReservedNodeOffering"

-- | Describes the status of a cluster restore action. Returns null if the
-- cluster was not created by restoring a snapshot.
data RestoreStatus = RestoreStatus
    { _rsStatus :: Maybe Text
    , _rsCurrentRestoreRateInMegaBytesPerSecond :: Maybe Double
    , _rsSnapshotSizeInMegaBytes :: Maybe Integer
    , _rsProgressInMegaBytes :: Maybe Integer
    , _rsElapsedTimeInSeconds :: Maybe Integer
    , _rsEstimatedTimeToCompletionInSeconds :: Maybe Integer
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'RestoreStatus' data type to populate a request.
mkRestoreStatus :: RestoreStatus
mkRestoreStatus = RestoreStatus
    { _rsStatus = Nothing
    , _rsCurrentRestoreRateInMegaBytesPerSecond = Nothing
    , _rsSnapshotSizeInMegaBytes = Nothing
    , _rsProgressInMegaBytes = Nothing
    , _rsElapsedTimeInSeconds = Nothing
    , _rsEstimatedTimeToCompletionInSeconds = Nothing
    }
{-# INLINE mkRestoreStatus #-}

-- | The status of the restore action. Returns starting, restoring, completed,
-- or failed.
rsStatus :: Lens' RestoreStatus (Maybe Text)
rsStatus = lens _rsStatus (\s a -> s { _rsStatus = a })
{-# INLINE rsStatus #-}

-- | The number of megabytes per second being transferred from the backup
-- storage. Returns the average rate for a completed backup.
rsCurrentRestoreRateInMegaBytesPerSecond :: Lens' RestoreStatus (Maybe Double)
rsCurrentRestoreRateInMegaBytesPerSecond =
    lens _rsCurrentRestoreRateInMegaBytesPerSecond
         (\s a -> s { _rsCurrentRestoreRateInMegaBytesPerSecond = a })
{-# INLINE rsCurrentRestoreRateInMegaBytesPerSecond #-}

-- | The size of the set of snapshot data used to restore the cluster.
rsSnapshotSizeInMegaBytes :: Lens' RestoreStatus (Maybe Integer)
rsSnapshotSizeInMegaBytes =
    lens _rsSnapshotSizeInMegaBytes
         (\s a -> s { _rsSnapshotSizeInMegaBytes = a })
{-# INLINE rsSnapshotSizeInMegaBytes #-}

-- | The number of megabytes that have been transferred from snapshot storage.
rsProgressInMegaBytes :: Lens' RestoreStatus (Maybe Integer)
rsProgressInMegaBytes =
    lens _rsProgressInMegaBytes (\s a -> s { _rsProgressInMegaBytes = a })
{-# INLINE rsProgressInMegaBytes #-}

-- | The amount of time an in-progress restore has been running, or the amount
-- of time it took a completed restore to finish.
rsElapsedTimeInSeconds :: Lens' RestoreStatus (Maybe Integer)
rsElapsedTimeInSeconds =
    lens _rsElapsedTimeInSeconds (\s a -> s { _rsElapsedTimeInSeconds = a })
{-# INLINE rsElapsedTimeInSeconds #-}

-- | The estimate of the time remaining before the restore will complete.
-- Returns 0 for a completed restore.
rsEstimatedTimeToCompletionInSeconds :: Lens' RestoreStatus (Maybe Integer)
rsEstimatedTimeToCompletionInSeconds =
    lens _rsEstimatedTimeToCompletionInSeconds
         (\s a -> s { _rsEstimatedTimeToCompletionInSeconds = a })
{-# INLINE rsEstimatedTimeToCompletionInSeconds #-}

instance FromXML RestoreStatus where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "RestoreStatus"

instance ToQuery RestoreStatus where
    toQuery = genericQuery def

-- | Describes a snapshot.
data Snapshot = Snapshot
    { _sSnapshotIdentifier :: Maybe Text
    , _sClusterIdentifier :: Maybe Text
    , _sSnapshotCreateTime :: Maybe ISO8601
    , _sStatus :: Maybe Text
    , _sPort :: Maybe Integer
    , _sAvailabilityZone :: Maybe Text
    , _sClusterCreateTime :: Maybe ISO8601
    , _sMasterUsername :: Maybe Text
    , _sClusterVersion :: Maybe Text
    , _sSnapshotType :: Maybe Text
    , _sNodeType :: Maybe Text
    , _sNumberOfNodes :: Maybe Integer
    , _sDBName :: Maybe Text
    , _sVpcId :: Maybe Text
    , _sEncrypted :: Maybe Bool
    , _sEncryptedWithHSM :: Maybe Bool
    , _sAccountsWithRestoreAccess :: [AccountWithRestoreAccess]
    , _sOwnerAccount :: Maybe Text
    , _sTotalBackupSizeInMegaBytes :: Maybe Double
    , _sActualIncrementalBackupSizeInMegaBytes :: Maybe Double
    , _sBackupProgressInMegaBytes :: Maybe Double
    , _sCurrentBackupRateInMegaBytesPerSecond :: Maybe Double
    , _sEstimatedSecondsToCompletion :: Maybe Integer
    , _sElapsedTimeInSeconds :: Maybe Integer
    , _sSourceRegion :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'Snapshot' data type to populate a request.
mkSnapshot :: Snapshot
mkSnapshot = Snapshot
    { _sSnapshotIdentifier = Nothing
    , _sClusterIdentifier = Nothing
    , _sSnapshotCreateTime = Nothing
    , _sStatus = Nothing
    , _sPort = Nothing
    , _sAvailabilityZone = Nothing
    , _sClusterCreateTime = Nothing
    , _sMasterUsername = Nothing
    , _sClusterVersion = Nothing
    , _sSnapshotType = Nothing
    , _sNodeType = Nothing
    , _sNumberOfNodes = Nothing
    , _sDBName = Nothing
    , _sVpcId = Nothing
    , _sEncrypted = Nothing
    , _sEncryptedWithHSM = Nothing
    , _sAccountsWithRestoreAccess = mempty
    , _sOwnerAccount = Nothing
    , _sTotalBackupSizeInMegaBytes = Nothing
    , _sActualIncrementalBackupSizeInMegaBytes = Nothing
    , _sBackupProgressInMegaBytes = Nothing
    , _sCurrentBackupRateInMegaBytesPerSecond = Nothing
    , _sEstimatedSecondsToCompletion = Nothing
    , _sElapsedTimeInSeconds = Nothing
    , _sSourceRegion = Nothing
    }
{-# INLINE mkSnapshot #-}

-- | The snapshot identifier that is provided in the request.
sSnapshotIdentifier :: Lens' Snapshot (Maybe Text)
sSnapshotIdentifier =
    lens _sSnapshotIdentifier (\s a -> s { _sSnapshotIdentifier = a })
{-# INLINE sSnapshotIdentifier #-}

-- | The identifier of the cluster for which the snapshot was taken.
sClusterIdentifier :: Lens' Snapshot (Maybe Text)
sClusterIdentifier =
    lens _sClusterIdentifier (\s a -> s { _sClusterIdentifier = a })
{-# INLINE sClusterIdentifier #-}

-- | The time (UTC) when Amazon Redshift began the snapshot. A snapshot contains
-- a copy of the cluster data as of this exact time.
sSnapshotCreateTime :: Lens' Snapshot (Maybe ISO8601)
sSnapshotCreateTime =
    lens _sSnapshotCreateTime (\s a -> s { _sSnapshotCreateTime = a })
{-# INLINE sSnapshotCreateTime #-}

-- | The snapshot status. The value of the status depends on the API operation
-- used. CreateClusterSnapshot and CopyClusterSnapshot returns status as
-- "creating". DescribeClusterSnapshots returns status as "creating",
-- "available", "final snapshot", or "failed". DeleteClusterSnapshot returns
-- status as "deleted".
sStatus :: Lens' Snapshot (Maybe Text)
sStatus = lens _sStatus (\s a -> s { _sStatus = a })
{-# INLINE sStatus #-}

-- | The port that the cluster is listening on.
sPort :: Lens' Snapshot (Maybe Integer)
sPort = lens _sPort (\s a -> s { _sPort = a })
{-# INLINE sPort #-}

-- | The Availability Zone in which the cluster was created.
sAvailabilityZone :: Lens' Snapshot (Maybe Text)
sAvailabilityZone =
    lens _sAvailabilityZone (\s a -> s { _sAvailabilityZone = a })
{-# INLINE sAvailabilityZone #-}

-- | The time (UTC) when the cluster was originally created.
sClusterCreateTime :: Lens' Snapshot (Maybe ISO8601)
sClusterCreateTime =
    lens _sClusterCreateTime (\s a -> s { _sClusterCreateTime = a })
{-# INLINE sClusterCreateTime #-}

-- | The master user name for the cluster.
sMasterUsername :: Lens' Snapshot (Maybe Text)
sMasterUsername = lens _sMasterUsername (\s a -> s { _sMasterUsername = a })
{-# INLINE sMasterUsername #-}

-- | The version ID of the Amazon Redshift engine that is running on the
-- cluster.
sClusterVersion :: Lens' Snapshot (Maybe Text)
sClusterVersion = lens _sClusterVersion (\s a -> s { _sClusterVersion = a })
{-# INLINE sClusterVersion #-}

-- | The snapshot type. Snapshots created using CreateClusterSnapshot and
-- CopyClusterSnapshot will be of type "manual".
sSnapshotType :: Lens' Snapshot (Maybe Text)
sSnapshotType = lens _sSnapshotType (\s a -> s { _sSnapshotType = a })
{-# INLINE sSnapshotType #-}

-- | The node type of the nodes in the cluster.
sNodeType :: Lens' Snapshot (Maybe Text)
sNodeType = lens _sNodeType (\s a -> s { _sNodeType = a })
{-# INLINE sNodeType #-}

-- | The number of nodes in the cluster.
sNumberOfNodes :: Lens' Snapshot (Maybe Integer)
sNumberOfNodes = lens _sNumberOfNodes (\s a -> s { _sNumberOfNodes = a })
{-# INLINE sNumberOfNodes #-}

-- | The name of the database that was created when the cluster was created.
sDBName :: Lens' Snapshot (Maybe Text)
sDBName = lens _sDBName (\s a -> s { _sDBName = a })
{-# INLINE sDBName #-}

-- | The VPC identifier of the cluster if the snapshot is from a cluster in a
-- VPC. Otherwise, this field is not in the output.
sVpcId :: Lens' Snapshot (Maybe Text)
sVpcId = lens _sVpcId (\s a -> s { _sVpcId = a })
{-# INLINE sVpcId #-}

-- | If true, the data in the snapshot is encrypted at rest.
sEncrypted :: Lens' Snapshot (Maybe Bool)
sEncrypted = lens _sEncrypted (\s a -> s { _sEncrypted = a })
{-# INLINE sEncrypted #-}

-- | A boolean that indicates whether the snapshot data is encrypted using the
-- HSM keys of the source cluster. true indicates that the data is encrypted
-- using HSM keys.
sEncryptedWithHSM :: Lens' Snapshot (Maybe Bool)
sEncryptedWithHSM =
    lens _sEncryptedWithHSM (\s a -> s { _sEncryptedWithHSM = a })
{-# INLINE sEncryptedWithHSM #-}

-- | A list of the AWS customer accounts authorized to restore the snapshot.
-- Returns null if no accounts are authorized. Visible only to the snapshot
-- owner.
sAccountsWithRestoreAccess :: Lens' Snapshot [AccountWithRestoreAccess]
sAccountsWithRestoreAccess =
    lens _sAccountsWithRestoreAccess
         (\s a -> s { _sAccountsWithRestoreAccess = a })
{-# INLINE sAccountsWithRestoreAccess #-}

-- | For manual snapshots, the AWS customer account used to create or copy the
-- snapshot. For automatic snapshots, the owner of the cluster. The owner can
-- perform all snapshot actions, such as sharing a manual snapshot.
sOwnerAccount :: Lens' Snapshot (Maybe Text)
sOwnerAccount = lens _sOwnerAccount (\s a -> s { _sOwnerAccount = a })
{-# INLINE sOwnerAccount #-}

-- | The size of the complete set of backup data that would be used to restore
-- the cluster.
sTotalBackupSizeInMegaBytes :: Lens' Snapshot (Maybe Double)
sTotalBackupSizeInMegaBytes =
    lens _sTotalBackupSizeInMegaBytes
         (\s a -> s { _sTotalBackupSizeInMegaBytes = a })
{-# INLINE sTotalBackupSizeInMegaBytes #-}

-- | The size of the incremental backup.
sActualIncrementalBackupSizeInMegaBytes :: Lens' Snapshot (Maybe Double)
sActualIncrementalBackupSizeInMegaBytes =
    lens _sActualIncrementalBackupSizeInMegaBytes
         (\s a -> s { _sActualIncrementalBackupSizeInMegaBytes = a })
{-# INLINE sActualIncrementalBackupSizeInMegaBytes #-}

-- | The number of megabytes that have been transferred to the snapshot backup.
sBackupProgressInMegaBytes :: Lens' Snapshot (Maybe Double)
sBackupProgressInMegaBytes =
    lens _sBackupProgressInMegaBytes
         (\s a -> s { _sBackupProgressInMegaBytes = a })
{-# INLINE sBackupProgressInMegaBytes #-}

-- | The number of megabytes per second being transferred to the snapshot
-- backup. Returns 0 for a completed backup.
sCurrentBackupRateInMegaBytesPerSecond :: Lens' Snapshot (Maybe Double)
sCurrentBackupRateInMegaBytesPerSecond =
    lens _sCurrentBackupRateInMegaBytesPerSecond
         (\s a -> s { _sCurrentBackupRateInMegaBytesPerSecond = a })
{-# INLINE sCurrentBackupRateInMegaBytesPerSecond #-}

-- | The estimate of the time remaining before the snapshot backup will
-- complete. Returns 0 for a completed backup.
sEstimatedSecondsToCompletion :: Lens' Snapshot (Maybe Integer)
sEstimatedSecondsToCompletion =
    lens _sEstimatedSecondsToCompletion
         (\s a -> s { _sEstimatedSecondsToCompletion = a })
{-# INLINE sEstimatedSecondsToCompletion #-}

-- | The amount of time an in-progress snapshot backup has been running, or the
-- amount of time it took a completed backup to finish.
sElapsedTimeInSeconds :: Lens' Snapshot (Maybe Integer)
sElapsedTimeInSeconds =
    lens _sElapsedTimeInSeconds (\s a -> s { _sElapsedTimeInSeconds = a })
{-# INLINE sElapsedTimeInSeconds #-}

-- | The source region from which the snapshot was copied.
sSourceRegion :: Lens' Snapshot (Maybe Text)
sSourceRegion = lens _sSourceRegion (\s a -> s { _sSourceRegion = a })
{-# INLINE sSourceRegion #-}

instance FromXML Snapshot where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Snapshot"

-- | Describes a subnet.
data Subnet = Subnet
    { _srsSubnetIdentifier :: Maybe Text
    , _srsSubnetAvailabilityZone :: Maybe AvailabilityZone
    , _srsSubnetStatus :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'Subnet' data type to populate a request.
mkSubnet :: Subnet
mkSubnet = Subnet
    { _srsSubnetIdentifier = Nothing
    , _srsSubnetAvailabilityZone = Nothing
    , _srsSubnetStatus = Nothing
    }
{-# INLINE mkSubnet #-}

-- | The identifier of the subnet.
srsSubnetIdentifier :: Lens' Subnet (Maybe Text)
srsSubnetIdentifier =
    lens _srsSubnetIdentifier (\s a -> s { _srsSubnetIdentifier = a })
{-# INLINE srsSubnetIdentifier #-}

-- | Describes an availability zone.
srsSubnetAvailabilityZone :: Lens' Subnet (Maybe AvailabilityZone)
srsSubnetAvailabilityZone =
    lens _srsSubnetAvailabilityZone
         (\s a -> s { _srsSubnetAvailabilityZone = a })
{-# INLINE srsSubnetAvailabilityZone #-}

-- | The status of the subnet.
srsSubnetStatus :: Lens' Subnet (Maybe Text)
srsSubnetStatus = lens _srsSubnetStatus (\s a -> s { _srsSubnetStatus = a })
{-# INLINE srsSubnetStatus #-}

instance FromXML Subnet where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Subnet"

instance ToQuery Subnet where
    toQuery = genericQuery def

-- | Describes the members of a VPC security group.
data VpcSecurityGroupMembership = VpcSecurityGroupMembership
    { _vsgmVpcSecurityGroupId :: Maybe Text
    , _vsgmStatus :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'VpcSecurityGroupMembership' data type to populate a request.
mkVpcSecurityGroupMembership :: VpcSecurityGroupMembership
mkVpcSecurityGroupMembership = VpcSecurityGroupMembership
    { _vsgmVpcSecurityGroupId = Nothing
    , _vsgmStatus = Nothing
    }
{-# INLINE mkVpcSecurityGroupMembership #-}

-- | 
vsgmVpcSecurityGroupId :: Lens' VpcSecurityGroupMembership (Maybe Text)
vsgmVpcSecurityGroupId =
    lens _vsgmVpcSecurityGroupId (\s a -> s { _vsgmVpcSecurityGroupId = a })
{-# INLINE vsgmVpcSecurityGroupId #-}

-- | 
vsgmStatus :: Lens' VpcSecurityGroupMembership (Maybe Text)
vsgmStatus = lens _vsgmStatus (\s a -> s { _vsgmStatus = a })
{-# INLINE vsgmStatus #-}

instance FromXML VpcSecurityGroupMembership where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "VpcSecurityGroup"

instance ToQuery VpcSecurityGroupMembership where
    toQuery = genericQuery def
