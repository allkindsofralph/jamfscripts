#!/bin/bash
##################################################################
# Ask If Computer Being Setup is a DP or GP
#
# This is a simple script asks if the computer was a DP or GP
# to set attribute to annotate that.
#
# Ralph Casafrancisco
# casafrancisco@chapman.edu
# 2019-9-May
# 
# CODE was UTILIZED/CUSTOMIZED from https://configautomation.com/attach-workflow-jamf.html

# UDID of the device is passed to script in environment variable
udid=$UDID

# Account properties
accountName="yourAccountName"
accountPassword="yourAccountPassword"
jssServerURL="https://my.jss:8443"

# Extension Attribute properties
eaName="Purchase Type"
eaName=$(echo "${eaName}" | sed 's/ /%20/g') # Replace spaces with percent encoding
eaValue="DP"

# Get thew ID of the Extension Attribute specified by name 
eaID=$( /usr/bin/curl -sku ${accountName}:${accountPassword} -H "Accept: text/xml" ${jssServerURL}/JSSResource/computerextensionattributes/name/${eaName} | xpath '/computer_extension_attribute/id/text()')

# The XML for setting the value of the Extension Attribute
eaPutXML="<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>
<computer>
	<extension_attributes>
		<extension_attribute>
			<id>${eaID}</id>
			<value>${eaValue}</value>
		</extension_attribute>
	</extension_attributes>
</computer>"

# Set the value of the Extension Attribute
/usr/bin/curl -v -sS -k -i -u ${accountName}:${accountPassword} -v -X PUT -H "Content-Type: text/xml" -d "$eaPutXML" ${jssServerURL}/JSSResource/computers/udid/${udid}
