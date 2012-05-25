Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "448978248464784", "57734d4aeaf436c79eae0a6bf0a140bd"
  provider :twitter, "2mDcFMDbDeYRhCrmWvrmHA", "ADP9HjC9OMVeLg2Kex9K5IWwxZym0IRtbzLxblh90Q"
  provider :linkedin, "k1ye5dfzb3sp", "E4Ie5gSlnVGtz1Ue"
  provider :github, "017c296a7a8d4c63ea31", "3aa22eb19b7341bd7ed45c4bcbc318be6386751d"
  provider :google, "cold-galaxy-7530.herokuapp.com", "	STL53V2KlfNfir301xs3PWnv "
end