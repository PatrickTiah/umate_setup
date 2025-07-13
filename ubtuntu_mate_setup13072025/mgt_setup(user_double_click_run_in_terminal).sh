#! /bin/bash
exec > >(tee -i ~/umate_mgtsetuplog.txt)
exec 2>&1

echo This has to be run by user, NOT as administrator
echo Hit Enter to continue, or Ctrl-C to abort
read pause

#install Python modules
#echo install python modules
#pip install pandas
#pip install openpyxl
#pip install xlrd
#pip install calendar

echo Create git files
mkdir ~/git
mkdir ~/Downloads/BankConv
mkdir ~/Downloads/BankPmtRecv
mkdir ~/Downloads/ClaimsPV
mkdir ~/Downloads/Enrolment
mkdir ~/Downloads/FinConsol
mkdir ~/Downloads/LeaveCheck
mkdir ~/Downloads/PayrollCheck
mkdir ~/Downloads/PVConvert
mkdir ~/Downloads/QBRecon

cd ~/git

echo Setup ssh
echo -e "\nEnter your username (just the name, exclude @):"
read user_name
echo -e "No passphrase is required, just hit Enter"
ssh-keygen -t ed25519 -C "${user_name}@kinderarena.com.my" -f "${HOME}/git/${user_name}_key"
eval "$(ssh-agent -s)"
ssh-add "${user_name}_key"

echo -e "\nSSH key added for Git, please email "${user_name}_key.pub to the git administrator""
echo -e "\n\nAfter key added by administrator, run git clone:"
echo "cd ~/git"
echo "git clone git@github.com:PatrickTiah/KA_mgt_utils.git"
echo -e "\n\nScript done. Hit enter to close"
read pause
