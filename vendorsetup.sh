SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export VENDOR_PATH=$SCRIPT_DIR/..
REPO_PATH=$(basename $SCRIPT_DIR)
export LOCAL_PATH=${VENDOR_PATH}/${REPO_PATH}

if [ ! -z $DEBUG ]; then
        echo "VENDOR_PATH $VENDOR_PATH"
        echo "REPO_PATH $REPO_PATH"
        echo "LOCAL_PATH $LOCAL_PATH"
else
rm -f ${LOCAL_PATH}/vendor_name
python3 ${LOCAL_PATH}/vendor_detect.py > ${LOCAL_PATH}/vendor_name
fi

for dev in $(find ${VENDOR_PATH}/ -maxdepth 1 -type d -not -name $REPO_PATH -not -name .. -not -name "*-common"); do
	BASE_DEVICE=$(basename $dev)
	echo "Generating ${BASE_DEVICE} Makefiles..."
	bash ${LOCAL_PATH}/setup.sh $0 "$BASE_DEVICE"
done
