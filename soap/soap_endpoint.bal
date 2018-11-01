// Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

# Object for SOAP client endpoint.
#
# + soapConfig - Reference to `SoapConfiguration` type
# + soapConnector - Reference to `SoapConnector` type
public type Client object {

    public SoapConfiguration soapConfig;
    public SoapConnector soapConnector;

    # Initialize SOAP endpoint.
    #
    # + config - SOAP configuraion
    public function init(SoapConfiguration config);

    # Get initialized SOAP connector.
    #
    # + return - The SOAP connector
    public function getCallerActions() returns SoapConnector;
};

public type SoapConfiguration record {
    http:ClientEndpointConfig clientConfig;
};

function Client::init(SoapConfiguration config) {
    self.soapConnector.clientEP.init(config.clientConfig);
}

function Client::getCallerActions() returns SoapConnector {
    return self.soapConnector;
}
