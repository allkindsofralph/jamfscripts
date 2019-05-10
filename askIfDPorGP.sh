#!/bin/bash

# UDID of the device is passed to script in environment variable
udid=$UDID

# Account properties
accountName="yourAccountName"
accountPassword="yourAccountPassword"
jssServerURL="https://jss.chapman.edu:8443"

# Extension Attribute properties
eaName="Purchase Type"
eaName=$(echo "${eaName}" | sed 's/ /%20/g') # Replace spaces with percent encoding
eaValue="DP"

# Get thew ID of the Extension Attribute specified by name 
eaID=$( /usr/bin/curl -sku ${accountName}:${accountPassword} -H "Accept: text/xml" ${jssServerURL}/JSSResource/mobiledeviceextensionattributes/name/${eaName} | xpath '/mobile_device_extension_attribute/id/text()')

# The XML for setting the value of the Extension Attribute
eaPutXML="<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>
<mobile_device>
	<extension_attributes>
		<extension_attribute>
			<id>${eaID}</id>
			<value>${eaValue}</value>
		</extension_attribute>
	</extension_attributes>
</mobile_device>"

# Set the value of the Extension Attribute
/usr/bin/curl -v -sS -k -i -u ${accountName}:${accountPassword} -v -X PUT -H "Content-Type: text/xml" -d "$eaPutXML" ${jssServerURL}/JSSResource/mobiledevices/udid/${udid}
