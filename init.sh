#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")"

# create dev_ssh/files if it does not already exist
files_dir="states/dev_ssh/files"
if [ ! -d "${files_dir}" ]; then
    echo "Creating ${files_dir} dir..."
    mkdir -p ${files_dir}
fi

# prompt for location of keys
privkey_default="~/.ssh/id_rsa"
pubkey_default="~/.ssh/id_rsa.pub"

read -p "Enter location of SSH private key [${privkey_default}]: " privkey
if [ -z "$privkey" ]; then
    privkey=${privkey_default}
fi
eval privkey=${privkey} # resolve ~

read -p "Enter location of SSH public key [${pubkey_default}]: " pubkey
if [ -z "$pubkey" ]; then
    pubkey=${pubkey_default}
fi
eval pubkey=${pubkey} # resolve ~

# add symlinks for keys
#echo "Symlinking keys..."
# disabled as salt doesn't want to follow symlinks
#ln -s ${privkey} ${files_dir}/id_rsa
#ln -s ${pubkey} ${files_dir}/id_rsa.pub

# copy keys
echo "Copying keys..."
cp ${privkey} ${files_dir}/id_rsa
cp ${pubkey} ${files_dir}/id_rsa.pub

echo "Done – dev states ready for use"
