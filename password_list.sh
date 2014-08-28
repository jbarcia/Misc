#!/bin/sh

if [ ! -d /pentest/passwords/vendor ] ; then
echo “Installing the default vendor password lists”
mkdir ~/vendorpasswords && cd ~/vendorpasswords
wget -nc -q http://vulnerabilityassessment.co.uk/default_oracle_passwords.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsNO.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsA.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsB.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsC.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsD.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsE.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsF.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsG.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsH.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsI.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsJ.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsK.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsL.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsM.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsN.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsO.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsP.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsQ.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsR.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsS.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsT.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsU.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsV.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsW.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsX.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsY.htm
wget -nc -q http://vulnerabilityassessment.co.uk/passwordsZ.htm
wget -nc -q http://www.phenoelit-us.org/dpl/dpl.html
fi
exit
