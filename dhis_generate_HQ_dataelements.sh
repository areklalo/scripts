#!/bin/bash
ADULT_START=1
ADULT_END=16
PED_START=1
PED_END=13
URL=http://172.19.0.13:8080/api/26/dataElements

createDataElement() {
  sendRequest $1
  touch result.txt
  echo $1 $ELEMENT_UID >> result.txt
}

sendRequest() {
    REQUEST='{"aggregationType":"SUM","domainType":"AGGREGATE","categoryCombo":{"displayName":"default","name":"default","id":"bjDvmb4bfuf"},"valueType":"NUMBER","zeroIsSignificant":true,"name":"'$1'","shortName":"'$1'","legendSets":[]}'
    # echo $REQUEST
    RESPONSE=$(curl --header "Content-Type: application/json" --header "Authorization: Basic YWRtaW46ZGlzdHJpY3Q=" --request POST --data "$REQUEST" $URL)
    # echo $RESPONSE
    ELEMENT_UID=$(echo $RESPONSE | sed -n 's/.*uid":"\([^"]*\).*/\1/p')
    echo $ELEMENT_UID >> /dev/null
    if [ -z "$ELEMENT_UID" ]; then
      echo $RESPONSE
    fi
}

createAdult() {
  for ((i=$ADULT_START; i<=$ADULT_END; i++));
  do
    createDataElementSet hq_adult$i
  done
}

createPed() {
  for ((i=$PED_START; i<=$PED_END; i++));
  do
    createDataElementSet hq_ped$i
  done
}

createDataElementSet() {
  createDataElement $1_N_M
  createDataElement $1_N_F
  createDataElement $1_N_T
  createDataElement $1_D_M
  createDataElement $1_D_F
  createDataElement $1_D_T
}

createAdult
createPed
# createDataElement $1
