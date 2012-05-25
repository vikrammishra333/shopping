Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "448978248464784", "57734d4aeaf436c79eae0a6bf0a140bd",
           :scope => 'email', :display => 'popup'
end