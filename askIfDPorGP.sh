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

# Serial number of the device is passed to script in environment variable
serial=$(system_profiler SPHardwareDataType | grep 'Serial Number (system)' | awk '{print $NF}')

echo 'hello ${serial}'


# Account properties
accountName="jssapi"
accountPassword="RESTEasy!"
jssServerURL="https://jss.chapman.edu:8443"

# The XML for setting the value of the Extension Attribute
eaPutXMLDP="<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>
<computer>
	<extension_attributes>
		<extension_attribute>
			<id>13</id>
			<value>DP</value>
		</extension_attribute>
	</extension_attributes>
</computer>"

eaPutXMLGP="<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>
<computer>
	<extension_attributes>
		<extension_attribute>
			<id>13</id>
			<value>GP</value>
		</extension_attribute>
	</extension_attributes>
</computer>"

#Prompt for User Input #### STILL NEEDS EDITING
purchaseType=$(osascript -e 'tell app "System Events" to display dialog "Is this computer a Departmental/Grant Purchase?" buttons {"DP", "GP", "Neither"} default button 3')
    if [[ ${purchaseType} == "button returned:DP" ]]; then
        /usr/bin/curl -v -sS -k -i -u ${accountName}:${accountPassword} -v -X PUT -H "Content-Type: text/xml" -d "$eaPutXMLDP" ${jssServerURL}/JSSResource/computers/serialnumber/${serial}
    elif [[ ${purchaseType} == "button returned:GP" ]]; then
        /usr/bin/curl -v -sS -k -i -u ${accountName}:${accountPassword} -v -X PUT -H "Content-Type: text/xml" -d "$eaPutXMLGP" ${jssServerURL}/JSSResource/computers/serialnumber/${serial}
    else
        echo "Neither DP or GP"
        echo ${purchaseType}
    fi
