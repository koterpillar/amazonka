{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.OpsWorks.V2013_02_18.CloneStack
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Creates a clone of a specified stack. For more information, see Clone a
-- Stack. Required Permissions: To use this action, an IAM user must have an
-- attached policy that explicitly grants permissions. For more information on
-- user permissions, see Managing User Permissions.
module Network.AWS.OpsWorks.V2013_02_18.CloneStack
    (
    -- * Request
      CloneStack
    -- ** Request constructor
    , mkCloneStack
    -- ** Request lenses
    , csSourceStackId
    , csName
    , csRegion
    , csVpcId
    , csAttributes
    , csServiceRoleArn
    , csDefaultInstanceProfileArn
    , csDefaultOs
    , csHostnameTheme
    , csDefaultAvailabilityZone
    , csDefaultSubnetId
    , csCustomJson
    , csConfigurationManager
    , csChefConfiguration
    , csUseCustomCookbooks
    , csUseOpsworksSecurityGroups
    , csCustomCookbooksSource
    , csDefaultSshKeyName
    , csClonePermissions
    , csCloneAppIds
    , csDefaultRootDeviceType

    -- * Response
    , CloneStackResponse
    -- ** Response lenses
    , csrsStackId
    ) where

import           Network.AWS.OpsWorks.V2013_02_18.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

data CloneStack = CloneStack
    { _csSourceStackId :: Text
    , _csName :: Maybe Text
    , _csRegion :: Maybe Text
    , _csVpcId :: Maybe Text
    , _csAttributes :: Map StackAttributesKeys Text
    , _csServiceRoleArn :: Text
    , _csDefaultInstanceProfileArn :: Maybe Text
    , _csDefaultOs :: Maybe Text
    , _csHostnameTheme :: Maybe Text
    , _csDefaultAvailabilityZone :: Maybe Text
    , _csDefaultSubnetId :: Maybe Text
    , _csCustomJson :: Maybe Text
    , _csConfigurationManager :: Maybe StackConfigurationManager
    , _csChefConfiguration :: Maybe ChefConfiguration
    , _csUseCustomCookbooks :: Maybe Bool
    , _csUseOpsworksSecurityGroups :: Maybe Bool
    , _csCustomCookbooksSource :: Maybe Source
    , _csDefaultSshKeyName :: Maybe Text
    , _csClonePermissions :: Maybe Bool
    , _csCloneAppIds :: [Text]
    , _csDefaultRootDeviceType :: Maybe RootDeviceType
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'CloneStack' request.
mkCloneStack :: Text -- ^ 'csSourceStackId'
             -> Text -- ^ 'csServiceRoleArn'
             -> CloneStack
mkCloneStack p1 p6 = CloneStack
    { _csSourceStackId = p1
    , _csName = Nothing
    , _csRegion = Nothing
    , _csVpcId = Nothing
    , _csAttributes = mempty
    , _csServiceRoleArn = p6
    , _csDefaultInstanceProfileArn = Nothing
    , _csDefaultOs = Nothing
    , _csHostnameTheme = Nothing
    , _csDefaultAvailabilityZone = Nothing
    , _csDefaultSubnetId = Nothing
    , _csCustomJson = Nothing
    , _csConfigurationManager = Nothing
    , _csChefConfiguration = Nothing
    , _csUseCustomCookbooks = Nothing
    , _csUseOpsworksSecurityGroups = Nothing
    , _csCustomCookbooksSource = Nothing
    , _csDefaultSshKeyName = Nothing
    , _csClonePermissions = Nothing
    , _csCloneAppIds = mempty
    , _csDefaultRootDeviceType = Nothing
    }
{-# INLINE mkCloneStack #-}

-- | The source stack ID.
csSourceStackId :: Lens' CloneStack Text
csSourceStackId = lens _csSourceStackId (\s a -> s { _csSourceStackId = a })
{-# INLINE csSourceStackId #-}

-- | The cloned stack name.
csName :: Lens' CloneStack (Maybe Text)
csName = lens _csName (\s a -> s { _csName = a })
{-# INLINE csName #-}

-- | The cloned stack AWS region, such as "us-east-1". For more information
-- about AWS regions, see Regions and Endpoints.
csRegion :: Lens' CloneStack (Maybe Text)
csRegion = lens _csRegion (\s a -> s { _csRegion = a })
{-# INLINE csRegion #-}

-- | The ID of the VPC that the cloned stack is to be launched into. It must be
-- in the specified region. All instances will be launched into this VPC, and
-- you cannot change the ID later. If your account supports EC2 Classic, the
-- default value is no VPC. If your account does not support EC2 Classic, the
-- default value is the default VPC for the specified region. If the VPC ID
-- corresponds to a default VPC and you have specified either the
-- DefaultAvailabilityZone or the DefaultSubnetId parameter only, AWS OpsWorks
-- infers the value of the other parameter. If you specify neither parameter,
-- AWS OpsWorks sets these parameters to the first valid Availability Zone for
-- the specified region and the corresponding default VPC subnet ID,
-- respectively. If you specify a nondefault VPC ID, note the following: It
-- must belong to a VPC in your account that is in the specified region. You
-- must specify a value for DefaultSubnetId. For more information on how to
-- use AWS OpsWorks with a VPC, see Running a Stack in a VPC. For more
-- information on default VPC and EC2 Classic, see Supported Platforms.
csVpcId :: Lens' CloneStack (Maybe Text)
csVpcId = lens _csVpcId (\s a -> s { _csVpcId = a })
{-# INLINE csVpcId #-}

-- | A list of stack attributes and values as key/value pairs to be added to the
-- cloned stack.
csAttributes :: Lens' CloneStack (Map StackAttributesKeys Text)
csAttributes = lens _csAttributes (\s a -> s { _csAttributes = a })
{-# INLINE csAttributes #-}

-- | The stack AWS Identity and Access Management (IAM) role, which allows AWS
-- OpsWorks to work with AWS resources on your behalf. You must set this
-- parameter to the Amazon Resource Name (ARN) for an existing IAM role. If
-- you create a stack by using the AWS OpsWorks console, it creates the role
-- for you. You can obtain an existing stack's IAM ARN programmatically by
-- calling DescribePermissions. For more information about IAM ARNs, see Using
-- Identifiers. You must set this parameter to a valid service role ARN or the
-- action will fail; there is no default value. You can specify the source
-- stack's service role ARN, if you prefer, but you must do so explicitly.
csServiceRoleArn :: Lens' CloneStack Text
csServiceRoleArn =
    lens _csServiceRoleArn (\s a -> s { _csServiceRoleArn = a })
{-# INLINE csServiceRoleArn #-}

-- | The ARN of an IAM profile that is the default profile for all of the
-- stack's EC2 instances. For more information about IAM ARNs, see Using
-- Identifiers.
csDefaultInstanceProfileArn :: Lens' CloneStack (Maybe Text)
csDefaultInstanceProfileArn =
    lens _csDefaultInstanceProfileArn
         (\s a -> s { _csDefaultInstanceProfileArn = a })
{-# INLINE csDefaultInstanceProfileArn #-}

-- | The cloned stack's default operating system, which must be set to Amazon
-- Linux or Ubuntu 12.04 LTS. The default option is Amazon Linux.
csDefaultOs :: Lens' CloneStack (Maybe Text)
csDefaultOs = lens _csDefaultOs (\s a -> s { _csDefaultOs = a })
{-# INLINE csDefaultOs #-}

-- | The stack's host name theme, with spaces are replaced by underscores. The
-- theme is used to generate host names for the stack's instances. By default,
-- HostnameTheme is set to Layer_Dependent, which creates host names by
-- appending integers to the layer's short name. The other themes are:
-- Baked_Goods Clouds European_Cities Fruits Greek_Deities
-- Legendary_Creatures_from_Japan Planets_and_Moons Roman_Deities
-- Scottish_Islands US_Cities Wild_Cats To obtain a generated host name, call
-- GetHostNameSuggestion, which returns a host name based on the current
-- theme.
csHostnameTheme :: Lens' CloneStack (Maybe Text)
csHostnameTheme = lens _csHostnameTheme (\s a -> s { _csHostnameTheme = a })
{-# INLINE csHostnameTheme #-}

-- | The cloned stack's default Availability Zone, which must be in the
-- specified region. For more information, see Regions and Endpoints. If you
-- also specify a value for DefaultSubnetId, the subnet must be in the same
-- zone. For more information, see the VpcId parameter description.
csDefaultAvailabilityZone :: Lens' CloneStack (Maybe Text)
csDefaultAvailabilityZone =
    lens _csDefaultAvailabilityZone
         (\s a -> s { _csDefaultAvailabilityZone = a })
{-# INLINE csDefaultAvailabilityZone #-}

-- | The stack's default subnet ID. All instances will be launched into this
-- subnet unless you specify otherwise when you create the instance. If you
-- also specify a value for DefaultAvailabilityZone, the subnet must be in the
-- same zone. For information on default values and when this parameter is
-- required, see the VpcId parameter description.
csDefaultSubnetId :: Lens' CloneStack (Maybe Text)
csDefaultSubnetId =
    lens _csDefaultSubnetId (\s a -> s { _csDefaultSubnetId = a })
{-# INLINE csDefaultSubnetId #-}

-- | A string that contains user-defined, custom JSON. It is used to override
-- the corresponding default stack configuration JSON values. The string
-- should be in the following format and must escape characters such as '"'.:
-- "{\"key1\": \"value1\", \"key2\": \"value2\",...}" For more information on
-- custom JSON, see Use Custom JSON to Modify the Stack Configuration JSON.
csCustomJson :: Lens' CloneStack (Maybe Text)
csCustomJson = lens _csCustomJson (\s a -> s { _csCustomJson = a })
{-# INLINE csCustomJson #-}

-- | The configuration manager. When you clone a stack we recommend that you use
-- the configuration manager to specify the Chef version, 0.9, 11.4, or 11.10.
-- The default value is currently 11.4.
csConfigurationManager :: Lens' CloneStack (Maybe StackConfigurationManager)
csConfigurationManager =
    lens _csConfigurationManager (\s a -> s { _csConfigurationManager = a })
{-# INLINE csConfigurationManager #-}

-- | A ChefConfiguration object that specifies whether to enable Berkshelf and
-- the Berkshelf version on Chef 11.10 stacks. For more information, see
-- Create a New Stack.
csChefConfiguration :: Lens' CloneStack (Maybe ChefConfiguration)
csChefConfiguration =
    lens _csChefConfiguration (\s a -> s { _csChefConfiguration = a })
{-# INLINE csChefConfiguration #-}

-- | Whether to use custom cookbooks.
csUseCustomCookbooks :: Lens' CloneStack (Maybe Bool)
csUseCustomCookbooks =
    lens _csUseCustomCookbooks (\s a -> s { _csUseCustomCookbooks = a })
{-# INLINE csUseCustomCookbooks #-}

-- | Whether to associate the AWS OpsWorks built-in security groups with the
-- stack's layers. AWS OpsWorks provides a standard set of built-in security
-- groups, one for each layer, which are associated with layers by default.
-- With UseOpsworksSecurityGroups you can instead provide your own custom
-- security groups. UseOpsworksSecurityGroups has the following settings: True
-- - AWS OpsWorks automatically associates the appropriate built-in security
-- group with each layer (default setting). You can associate additional
-- security groups with a layer after you create it but you cannot delete the
-- built-in security group. False - AWS OpsWorks does not associate built-in
-- security groups with layers. You must create appropriate EC2 security
-- groups and associate a security group with each layer that you create.
-- However, you can still manually associate a built-in security group with a
-- layer on creation; custom security groups are required only for those
-- layers that need custom settings. For more information, see Create a New
-- Stack.
csUseOpsworksSecurityGroups :: Lens' CloneStack (Maybe Bool)
csUseOpsworksSecurityGroups =
    lens _csUseOpsworksSecurityGroups
         (\s a -> s { _csUseOpsworksSecurityGroups = a })
{-# INLINE csUseOpsworksSecurityGroups #-}

-- | Contains the information required to retrieve an app or cookbook from a
-- repository. For more information, see Creating Apps or Custom Recipes and
-- Cookbooks.
csCustomCookbooksSource :: Lens' CloneStack (Maybe Source)
csCustomCookbooksSource =
    lens _csCustomCookbooksSource
         (\s a -> s { _csCustomCookbooksSource = a })
{-# INLINE csCustomCookbooksSource #-}

-- | A default SSH key for the stack instances. You can override this value when
-- you create or update an instance.
csDefaultSshKeyName :: Lens' CloneStack (Maybe Text)
csDefaultSshKeyName =
    lens _csDefaultSshKeyName (\s a -> s { _csDefaultSshKeyName = a })
{-# INLINE csDefaultSshKeyName #-}

-- | Whether to clone the source stack's permissions.
csClonePermissions :: Lens' CloneStack (Maybe Bool)
csClonePermissions =
    lens _csClonePermissions (\s a -> s { _csClonePermissions = a })
{-# INLINE csClonePermissions #-}

-- | A list of source stack app IDs to be included in the cloned stack.
csCloneAppIds :: Lens' CloneStack [Text]
csCloneAppIds = lens _csCloneAppIds (\s a -> s { _csCloneAppIds = a })
{-# INLINE csCloneAppIds #-}

-- | The default root device type. This value is used by default for all
-- instances in the cloned stack, but you can override it when you create an
-- instance. For more information, see Storage for the Root Device.
csDefaultRootDeviceType :: Lens' CloneStack (Maybe RootDeviceType)
csDefaultRootDeviceType =
    lens _csDefaultRootDeviceType
         (\s a -> s { _csDefaultRootDeviceType = a })
{-# INLINE csDefaultRootDeviceType #-}

instance ToPath CloneStack

instance ToQuery CloneStack

instance ToHeaders CloneStack

instance ToJSON CloneStack

-- | Contains the response to a CloneStack request.
newtype CloneStackResponse = CloneStackResponse
    { _csrsStackId :: Maybe Text
    } deriving (Show, Generic)

-- | The cloned stack ID.
csrsStackId :: Lens' CloneStackResponse (Maybe Text)
csrsStackId = lens _csrsStackId (\s a -> s { _csrsStackId = a })
{-# INLINE csrsStackId #-}

instance FromJSON CloneStackResponse

instance AWSRequest CloneStack where
    type Sv CloneStack = OpsWorks
    type Rs CloneStack = CloneStackResponse

    request = get
    response _ = jsonResponse
