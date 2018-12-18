#To define the Orderer and organizations
rm -R crypto-config/*

../bin/cryptogen generate --config=crypto-config.yaml

rm config/*

echo "Generating genesis block.."

../bin/configtxgen -profile ThreeOrgOrdererGenesis -outputBlock ./config/genesis.block

echo "Generated genesis block in config folder"

echo "Generating channel.tx file"

../bin/configtxgen -profile ThreeOrgChannel -outputCreateChannelTx ./config/tfchannel.tx -channelID tfchannel

echo "Generated channel.tx file"
