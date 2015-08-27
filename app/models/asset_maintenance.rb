class AssetMaintenance < ActiveRecord::Base
  has_one :asset, dependent: :destroy
end
