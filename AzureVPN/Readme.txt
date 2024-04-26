AzureVPN

Intune Deployment for Azure VPN Client configuration Intune-> Devices->Windows->Configuration Profiles->Create->New Policy

Platform: windows 10 & Later Profile Type: Templates

Template name: Custom

Name: AO VPN Azure AD

OMA-URI: ./User/Vendor/MSFT/VPNv2/Contoso-AO-VPN/ProfileXML

Data type: XML file

Download and upload this file, then assign to users to deploy to.

File modifications for other companies:

line 5 TrustedNetworkDetection = domain entered here will prevent VPN connection while connected to that domain.

line 9 ServerURLlist = pulled from your VPN profile download from Azure

line 18 Issuer = pulled from your VPN profile download from Azure

line 19 Tenant = pulled from your VPN profile download from Azure

line 31 Name = display name of vpn connection once connected in client app.

line 41 FQDN = pulled from your VPN profile download from Azure

line 50 server secret = pulled from your VPN profile download from Azure
